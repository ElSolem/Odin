#!/usr/bin/env bash
set -euo pipefail

# Defaults
ROOT="$(pwd)"
FROM="odin"
TO="dora"
PRESERVE_CASE=1       # 1 = preserve case-per-letter, 0 = simple lower-case replacement
CASE_INSENSITIVE=1    # 1 = match case-insensitively
DRY_RUN=1             # default: show what would happen; pass --apply to actually change
EXCLUDE_DIRS=(".git" "vendor" "node_modules")
EXT_FILTER=""         # comma-separated extensions without dot, empty = all files
VERBOSE=1

usage() {
cat <<EOF
Usage: $0 [--apply] [--root DIR] [--preserve-case|--no-preserve-case]
          [--extensions ext1,ext2] [--exclude dir1,dir2] [--quiet]

- By default this performs a SAFE dry-run. Use --apply to make changes.
- Replaces occurrences of "$FROM" with "$TO" in:
    1) directory names (deepest-first)
    2) file names
    3) contents of text files
- Preserves letter-by-letter capitalization by default (Odin->Dora, ODIN->DORA).

Options:
  --apply                Actually perform renames and edits (default: dry-run)
  --root DIR             Root folder to operate in (default: current dir)
  --preserve-case        Preserve per-letter capitalization (default)
  --no-preserve-case     Do not preserve case; replace with lower-case 'dora'
  --extensions ext,ext   Only modify files with these extensions (no dot). Empty = all files.
  --exclude dir,dir      Comma-separated list of directory names to exclude (default: .git,vendor,node_modules)
  --quiet                Minimal output
  --help                 Show this message

Examples:
  # Dry-run (safe):
  $0 --root ~/projects/myrepo

  # Apply changes:
  $0 --apply --root ~/projects/myrepo --extensions odin,odinlib --exclude build,dist

EOF
}

# parse args
while [[ $# -gt 0 ]]; do
  case "$1" in
    --apply) DRY_RUN=0; shift ;;
    --root) ROOT="$2"; shift 2 ;;
    --preserve-case) PRESERVE_CASE=1; shift ;;
    --no-preserve-case) PRESERVE_CASE=0; shift ;;
    --extensions) EXT_FILTER="$2"; shift 2 ;;
    --exclude) IFS=',' read -r -a TMP_EXCL <<< "$2"; EXCLUDE_DIRS=("${TMP_EXCL[@]}"); shift 2 ;;
    --quiet) VERBOSE=0; shift ;;
    --help) usage; exit 0 ;;
    *) echo "Unknown arg: $1"; usage; exit 1 ;;
  esac
done

# Build find -prune exclude expression for directories
prune_expr=()
for d in "${EXCLUDE_DIRS[@]}"; do
  prune_expr+=( -path "$ROOT/$d" -prune -o )
done

# Helper: log
log(){ if [[ $VERBOSE -eq 1 ]]; then echo "$@"; fi }

# Python helper to produce a case-preserving replacement of a matched substring
# The function replaces occurrences of FROM in a case-insensitive way; for each match,
# if PRESERVE_CASE=1 it copies the casing pattern of the original match onto TO.
py_case_map() {
python3 - <<'PY' "$1" "$2" "$3" "$4"
import sys,re
from_str = sys.argv[1]
to_str = sys.argv[2]
s = sys.argv[3]
preserve = sys.argv[4] == "1"
flags = re.IGNORECASE

def map_case(match):
    org = match.group(0)
    if not preserve:
        return to_str
    # preserve per-letter case; if lengths differ, map as many letters as possible,
    # leftover letters in 'to_str' adopt the case of the last character in org.
    res = []
    for i,ch in enumerate(to_str):
        if i < len(org):
            res.append(ch.upper() if org[i].isupper() else ch.lower())
        else:
            # fallback: follow last char of original match
            res.append(ch.upper() if org[-1].isupper() else ch.lower())
    return ''.join(res)

pattern = re.compile(re.escape(from_str), flags)
print(pattern.sub(map_case, s), end='')
PY
}

# Function to get new path from old path (preserve directory separators)
compute_new_path() {
  local old="$1"
  # We only change path components that contain $FROM (in any case if CASE_INSENSITIVE=1)
  # We'll call python to do the substitution on the full path string
  new="$(py_case_map "$FROM" "$TO" "$old" "$PRESERVE_CASE")"
  echo "$new"
}

# Check for required tools
command -v python3 >/dev/null || { echo "ERROR: python3 required"; exit 1; }
command -v file >/dev/null || { echo "ERROR: file command required"; exit 1; }

# Build find predicates for files (extensions)
file_predicate=( -type f )
if [[ -n "$EXT_FILTER" ]]; then
  IFS=',' read -r -a exts <<< "$EXT_FILTER"
  # build: \( -iname "*.ext1" -o -iname "*.ext2" \)
  file_predicate+=( \( )
  first=1
  for e in "${exts[@]}"; do
    if [[ $first -eq 1 ]]; then
      file_predicate+=( -iname "*.${e}" )
      first=0
    else
      file_predicate+=( -o -iname "*.${e}" )
    fi
  done
  file_predicate+=( \) )
fi

# ---------- 1) Rename directories (deepest first) ----------
log "Scanning for directories to rename (deepest-first)..."
# Use -depth so find lists deepest first
# We'll produce an array of renames: old -> new
mapfile -t dir_list < <(eval find "\"$ROOT\"" -depth -type d -name "*${FROM}*" "${prune_expr[@]}" -print 2>/dev/null)

declare -a dir_renames_old
declare -a dir_renames_new

for d in "${dir_list[@]}"; do
  # skip if in excluded path segments
  skip=0
  for ex in "${EXCLUDE_DIRS[@]}"; do
    if [[ "$d" == *"/$ex"* || "$d" == "$ROOT/$ex" ]]; then skip=1; break; fi
  done
  [[ $skip -eq 1 ]] && continue

  newd="$(compute_new_path "$d")"
  if [[ "$d" != "$newd" ]]; then
    dir_renames_old+=("$d")
    dir_renames_new+=("$newd")
  fi
done

# Apply directory renames (deepest first)
for i in "${!dir_renames_old[@]}"; do
  old="${dir_renames_old[$i]}"
  new="${dir_renames_new[$i]}"
  if [[ -e "$new" ]]; then
    log "SKIP (target exists): $old  ->  $new"
    continue
  fi
  if [[ $DRY_RUN -eq 1 ]]; then
    log "DRY-RUN DIR: $old  ->  $new"
  else
    log "RENAMING DIR: $old  ->  $new"
    mv "$old" "$new"
  fi
done

# ---------- 2) Rename files ----------
log "Scanning for files to rename..."
# Use find with optional extension filter and pruning; read results
# Construct command safely
find_cmd=(find "$ROOT")
for d in "${EXCLUDE_DIRS[@]}"; do
  find_cmd+=(-path "$ROOT/$d" -prune -o)
done
find_cmd+=("${file_predicate[@]}" -name "*${FROM}*" -print)

mapfile -t file_list < <("${find_cmd[@]}" 2>/dev/null || true)

declare -a file_renames_old
declare -a file_renames_new

for f in "${file_list[@]}"; do
  newf="$(compute_new_path "$f")"
  if [[ "$f" != "$newf" ]]; then
    file_renames_old+=("$f")
    file_renames_new+=("$newf")
  fi
done

for i in "${!file_renames_old[@]}"; do
  old="${file_renames_old[$i]}"
  new="${file_renames_new[$i]}"
  if [[ -e "$new" ]]; then
    log "SKIP (target exists): $old  ->  $new"
    continue
  fi
  if [[ $DRY_RUN -eq 1 ]]; then
    log "DRY-RUN FILE: $old  ->  $new"
  else
    log "RENAMING FILE: $old  ->  $new"
    mv "$old" "$new"
  fi
done

# ---------- 3) Replace inside text file contents ----------
log "Scanning text files for content replacement..."
# Find all files (respect extension filter and excludes)
find_cmd=(find "$ROOT")
for d in "${EXCLUDE_DIRS[@]}"; do
  find_cmd+=(-path "$ROOT/$d" -prune -o)
done
find_cmd+=( -type f )
if [[ -n "$EXT_FILTER" ]]; then
  # add extension predicate
  find_cmd+=( \( )
  first=1
  IFS=',' read -r -a exts <<< "$EXT_FILTER"
  for e in "${exts[@]}"; do
    if [[ $first -eq 1 ]]; then
      find_cmd+=( -iname "*.${e}" )
      first=0
    else
      find_cmd+=( -o -iname "*.${e}" )
    fi
  done
  find_cmd+=( \) )
fi
find_cmd+=( -print )

mapfile -t all_files < <("${find_cmd[@]}" 2>/dev/null || true)

# small python script to replace inside a file with case-preserving replacement
replace_in_file_py() {
python3 - <<'PY' "$FROM" "$TO" "$PRESERVE_CASE" "$1"
import sys, re, io, os
from_str = sys.argv[1]
to_str = sys.argv[2]
preserve = sys.argv[3] == "1"
path = sys.argv[4]

# Read binary-safe then decode if possible
try:
    with open(path, "rb") as fh:
        data = fh.read()
    # Try to guess text by checking for NUL bytes
    if b'\x00' in data:
        print("SKIP_BINARY", end='')  # caller will treat as binary
        sys.exit(0)
    # decode assuming utf-8 (fallback to latin-1)
    try:
        s = data.decode("utf-8")
        enc = "utf-8"
    except Exception:
        s = data.decode("latin-1")
        enc = "latin-1"
except Exception as e:
    print("ERR") ; sys.exit(1)

flags = re.IGNORECASE
pattern = re.compile(re.escape(from_str), flags)

def map_case(match):
    org = match.group(0)
    if not preserve:
        return to_str
    res = []
    for i,ch in enumerate(to_str):
        if i < len(org):
            res.append(ch.upper() if org[i].isupper() else ch.lower())
        else:
            res.append(ch.upper() if org[-1].isupper() else ch.lower())
    return ''.join(res)

new_s, count = pattern.subn(map_case, s)
if count == 0:
    print("NO_CHANGE", end='')
    sys.exit(0)

# write atomically
tmp = path + ".tmp.replace"
with open(tmp, "wb") as fh:
    fh.write(new_s.encode(enc))
os.replace(tmp, path)
print("CHANGED", end='')
PY
}

for f in "${all_files[@]}"; do
  # skip binary files using file(1)
  if ! file --brief --mime-type "$f" | grep -qiE '^(text/|application/json|application/xml|application/javascript|application/x-sh|application/xhtml+xml)'; then
    # still may be text-like; try python check too
    out="$(replace_in_file_py "$f")"
    if [[ "$out" == "SKIP_BINARY" || "$out" == "NO_CHANGE" || "$out" == "ERR" || "$out" == "CHANGED" ]]; then
      case "$out" in
        SKIP_BINARY) log "SKIP (binary): $f" ;;
        NO_CHANGE) : ;;  # nothing to do
        ERR) log "ERR reading: $f" ;;
        CHANGED) log "CONTENT replaced: $f (python check)" ;;
      esac
    fi
    continue
  fi

  # run replacement python which writes atomically if a change occurs
  if [[ $DRY_RUN -eq 1 ]]; then
    # We still want to report whether the file would change. Use python in dry-run mode.
    report="$(python3 - <<'PY' "$FROM" "$TO" "$PRESERVE_CASE" "$f"
import sys,re
from_str = sys.argv[1]; to_str = sys.argv[2]; preserve = sys.argv[3] == "1"; path = sys.argv[4]
try:
    with open(path, "rb") as fh:
        data = fh.read()
    if b'\x00' in data:
        print("SKIP_BINARY"); sys.exit(0)
    try:
        s = data.decode("utf-8")
    except:
        s = data.decode("latin-1")
except:
    print("ERR"); sys.exit(0)
pattern = re.compile(re.escape(from_str), re.IGNORECASE)
def map_case(match):
    org = match.group(0)
    if not preserve:
        return to_str
    res=[]
    for i,ch in enumerate(to_str):
        if i < len(org):
            res.append(ch.upper() if org[i].isupper() else ch.lower())
        else:
            res.append(ch.upper() if org[-1].isupper() else ch.lower())
    return ''.join(res)
new, count = pattern.subn(map_case, s)
print("CHANGED" if count>0 else "NO_CHANGE")
PY
)"
    if [[ "$report" == "CHANGED" ]]; then
      log "DRY-RUN CONTENT: would replace inside: $f"
    fi
  else
    out="$(replace_in_file_py "$f")"
    if [[ "$out" == "CHANGED" ]]; then
      log "CONTENT replaced: $f"
    fi
  fi
done

log "Done. DRY_RUN=$DRY_RUN"
if [[ $DRY_RUN -eq 1 ]]; then
  echo "Dry-run completed. Re-run with --apply to actually perform changes."
fi
