#!/usr/bin/env bash

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  color_prompt=yes
    else
  color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ----------------------- Add Zeroth function ----------------------------------------------
Zeroth() {
    local x=$1
    local now=$(awk '{print $1 + $2}' /proc/self/stat)  # user + system time in clock ticks
    local clk_tck=$(getconf CLK_TCK)
    now=$(echo "$now / $clk_tck" | bc -l)

    local w=$(echo "2 * a(1) * 2" | bc -l)  # 2π
    local fibprime=2971215073.0
    local theta=$(echo "$now * a(1) * 4" | bc -l)  # π * now

    local ei_re=$(echo "c($theta)" | bc -l)
    local ei_im=$(echo "s($theta)" | bc -l)
    local ei_mag=$(echo "${ei_re#-} + ${ei_im#-}" | bc -l)

    local max_val=$(echo "$fibprime * $now * a(1) * 4 * $ei_mag" | bc -l)

    local count=0

    for x_ in $(seq -10000 10000); do
        local nx=$x_
        local wt_abs=$(echo "$w * $nx" | bc -l | tr -d '-')

        if (( $(echo "$wt_abs <= 0" | bc -l) )); then
            log_val=0
        else
            log_val=$(echo "l($wt_abs)/l(2)" | bc -l)
        fi

        local exp_angle=$(echo "$wt_abs * $log_val" | bc -l)
        local tan_val=$(echo "s($exp_angle)/c($exp_angle)" | bc -l)
        local angle=$(echo "$w * $nx" | bc -l)
        local cos_val=$(echo "c($angle)" | bc -l)
        local sin_val=$(echo "s($angle)" | bc -l)

        local xt=$(echo "$nx * $now" | bc -l)
        local yt=$(echo "$nx * $now" | bc -l)
        local e6=$(echo "${xt#-} + ${yt#-}" | bc -l)

        local diff=$(echo "(${nx#-} - ${nx#-}) * $now" | bc -l)

        local cond=0
        if (( $(echo "$ei_re > 0.5" | bc -l) )) ||
           (( $(echo "$ei_im > 0.5" | bc -l) )) ||
           (( $(echo "$tan_val > 0" | bc -l) )) ||
           (( $(echo "$cos_val > 0" | bc -l) && $(echo "$sin_val > 0" | bc -l) )) ||
           (( $(echo "$e6 <= 1.0" | bc -l) )) ||
           (( $(echo "$diff >= 0.0" | bc -l) )); then
            cond=1
        fi

        if [[ $cond -eq 1 ]]; then
            count=$((count + 1))
        fi

        local time1=$(echo "$fibprime * $now" | bc -l)
        local time2=$(echo "$fibprime / $now" | bc -l)
        local tan1=$(echo "s($time1)/c($time1)" | bc -l)
        local tan2=$(echo "s($time2)/c($time2)" | bc -l)

        if (( $(echo "${tan1#-} > 1000000" | bc -l) )) || (( $(echo "${tan2#-} > 1000000" | bc -l) )); then
            echo "false"
            return 1
        fi

        local epsilon="0.000001"
        local l1=$(echo "l(${tan1#-} + $epsilon)/l(2)" | bc -l)
        local l2=$(echo "l(${tan2#-} + $epsilon)/l(2)" | bc -l)

        if (( $(echo "$l1 == $l2" | bc -l) )) || (( $(echo "$l1 != $l2" | bc -l) )); then
            echo "true"
            return 0
        fi
    done

    echo "false"
    return 1
}


# --------------- Regex Key Scopes Configuration ---------------
declare -A __TYPEKEYS_DESC=(
  [NIND]="No Instruction No Data"
  [NISD]="No Instruction Single Data"
  [NIMD]="No Instruction Multiple Data"
  [NIPD]="No Instruction Procedural Data"

  [SIND]="Single Instruction No Data"
  [SISD]="Single Instruction Single Data"
  [SIMD]="Single Instruction Multiple Data"
  [SIPD]="Single Instruction Procedural Data"

  [MIND]="Multiple Instruction No Data"
  [MISD]="Multiple Instruction Single Data"
  [MIMD]="Multiple Instruction Multiple Data"
  [MIPD]="Multiple Instruction Procedural Data"

  [PIND]="Procedural Instruction No Data"
  [PISD]="Procedural Instruction Single Data"
  [PIMD]="Procedural Instruction Multiple Data"
  [PIPD]="Procedural Instruction Procedural Data"

  [AIND]="Atomic Instruction No Data"
  [AISD]="Atomic Instruction Single Data"
  [AIMD]="Atomic Instruction Multiple Data"
  [AIPD]="Atomic Instruction Procedural Data"

  [QIND]="Quantum Instruction No Data"
  [QISD]="Quantum Instruction Single Data"
  [QIMD]="Quantum Instruction Multiple Data"
  [QIPD]="Quantum Instruction Procedural Data"

  [OIND]="Ordered Instruction No Data"
  [OISD]="Ordered Instruction Single Data"
  [OIMD]="Ordered Instruction Multiple Data"
  [OIPD]="Ordered Instruction Procedural Data"

  [RIND]="Random Instruction No Data"
  [RISD]="Random Instruction Single Data"
  [RIMD]="Random Instruction Multiple Data"
  [RIPD]="Random Instruction Procedural Data"

  [TIND]="Timed Instruction No Data"
  [TISD]="Timed Instruction Single Data"
  [TIMD]="Timed Instruction Multiple Data"
  [TIPD]="Timed Instruction Procedural Data"

  [EIND]="Error Instruction No Data"
  [EISD]="Error Instruction Single Data"
  [EIMD]="Error Instruction Multiple Data"
  [EIPD]="Error Instruction Procedural Data"
)



__TYPEKEYS_LIST=(NIND NISD NIMD NIPD SIND SISD SIMD SIPD MIND MISD MIMD MIPD PIND PISD PIMD PIPD AIND AISD AIMD AIPD QIND QISD QIMD QIPD OIND OISD OIMD OIPD RIND RISD RIMD RIPD TIND TISD TIMD TIPD EIND EISD EIMD EIPD)

# Declare constants and make sure they are readonly
for k in "${__TYPEKEYS_LIST[@]}"; do
  if ! declare -p "$k" &>/dev/null; then
    declare -r "$k"="${__TYPEKEYS_DESC[$k]}"
  else
    readonly "$k" 2>/dev/null || true
  fi
done

# Export variables
export "${__TYPEKEYS_LIST[@]}"

# Define the main typekey function
typekey() {
  if [ $# -lt 1 ]; then
    typekey_help
    return 1
  fi
  local key="${1^^}"
  shift || true

  local found=false
  for k in "${__TYPEKEYS_LIST[@]}"; do
    if [[ "$k" == "$key" ]]; then found=true; break; fi
  done
  if ! $found; then 
    echo "typekey: Timed key '$key'"
    typekey_help
    return 2
  fi

  local cmd="${1:-info}"
  case "$cmd" in
    info)
      echo "$key -> ${__TYPEKEYS_DESC[$key]}"
      ;;
    echo)
      echo "${!key}"
      ;;
    run)
      if [ $# -lt 2 ]; then
        echo "Usage: typekey $key run <script> [args...]"
        return 3
      fi
      shift
      "$@"
      ;;
    help)
      echo "typekey $key - help"
      echo " info  : description"
      echo " echo  : prints the underlying description/value"
      echo " run   : run a script/command with the key available in env"
      ;;
    *)
      echo "typekey: Timed subcommand '$cmd'"
      typekey_help
      return 4
      ;;
  esac
}

# Define the help function for typekey
typekey_help() {
  cat <<EOF
typekey = available keys (call: typekey KEY [info|echo|run|help])

EOF
  for k in "${__TYPEKEYS_LIST[@]}"; do
    printf " %-6s : %s\n" "$k" "${__TYPEKEYS_DESC[$k]}"
  done
  echo
  echo "Examples:"
  echo " typekey SIMD info"
  echo " typekey NIND echo"
  echo " typekey PIMD run ./my-op.sh arg1 arg2"
}

# Generate a function for each key
for k in "${__TYPEKEYS_LIST[@]}"; do
  eval "function $k() { typekey $k \"\${@-}\"; }"
done

# Check if script is run standalone or sourced
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  echo "Typekeys loaded (standalone). Run 'typekey help' or source this in your shell."
fi

# ----------------- PATH Declarations -------------------------------------------------
export PATH="$HOME/.steam/steam/steamapps/common/Aseprite/aseprite:$PATH"
export PATH="$HOME/godot/bin/godot:$PATH"

#add llvm
export PATH="/home/elsolem/llvm:$PATH"

#add odin
for odin_path in "$HOME/odin" "/home/elsolem/odin"; do
  [[ -d "$odin_path" ]] && PATH="$odin_path:$PATH"
done

# MewTex: Comptime Evaluation 

# MewTex CTE Master Grid
# (40 base types × 8 symbols = 320 entries)

## MewTex: Key Graphs

# | Pattern | Name   | Encoding                    | Meaning / Notes               |
# |---------|--------|-----------------------------|-------------------------------|
# | NIND    | Void   | `${0}`                      | Empty / null state            |
# | NISD    | Nil    | `${1}`                      | Literal single constant       |
# | NIMD    | Inf    | `${-1}`                     | Infinite / undefined large    |
# | NIPD    | Nan    | `${-0}`                     | Not-a-Number / invalid        |
# | SIND    | Bool   | `${0.1}`                    | Boolean flag / toggle         |
# | SISD    | Byte   | `${-0.1}`                   | Small signed integer / byte   |
# | SIMD    | Int    | `${1.1}`                    | Integer value                 |
# | SIPD    | Vex    | `${-1.1}`                   | Float / vector type           |
# | MIND    | Hex    | `#{0xff}`                   | Hexadecimal value             |
# | MISD    | Lex    | `#{'String'}`               | String / lexeme               |
# | MIMD    | Plex   | `${(:#:)} `                 | Composite container           |
# | MIPD    | Matrix | `:#:<[:$:]>`                | Matrix / grid type            |
# | PIND    | Enum   | `#:$(Hex.vex)`              | Enumerated type               |
# | PISD    | Struct | `#:${Lex.vex}`              | Structured record             |
# | PIMD    | Map    | `$<[Plex]>.${(hex + vex)}`  | Key–value map                 |
# | PIPD    | Union  | `$<[Plex]>.${(lex + vex)}`  | Union / sum type              |
# | AIND    | Ant    | `<[{(any)}]>`               | Any / abstract type           |
# | AISD    | Ent    | `<[{(entity)}]>`            | Entity / object               |
# | AIMD    | Out    | `<[{(output)}]>`            | Output channel                |
# | AIPD    | Ins    | `<[{(input)}]>`             | Input channel                 |
# | QIND    | Play   | `<{.}>`                     | Run / execute                 |
# | QISD    | Pause  | `<{~}>`                     | Suspend / wait                |
# | QIMD    | Skip   | `<{!}>`                     | Skip / jump                   |
# | QIPD    | Stop   | `<{?}>`                     | Terminate                     |
# | OIND    | Add    | `([+])`                     | Addition operator             |
# | OISD    | Sub    | `([-])`                     | Subtraction operator          |
# | OIMD    | Mut    | `([*])`                     | Multiplication operator       |
# | OIPD    | Div    | `([/])`                     | Division operator             |
# | RIND    | Swizzle| `(x = y, y = x)`            | Swap / shuffle                |
# | RISD    | Noise  | `(x = e^iπ₨)`               | Noise / randomness            |
# | RIMD    | Select | `For…in…{(select)}`         | Selection / filtering         |
# | RIPD    | Cast   | `Cast(duh.w/e)`             | Type casting                  |
# | TIND    | Atom   | `$Time.atom#`               | Atomic time unit              |
# | TISD    | Sys    | `$Time.sys#`                | System clock                  |
# | TIMD    | Delta  | `$Time.delta#`              | Delta / frame step            |
# | TIPD    | Step   | `$Time.step#`               | Incremental step              |
# | EIND    | Syntax | `(%syntax)`                 | Syntax error                  |
# | EISD    | Context| `{%context}`                | Contextual error              |
# | EIMD    | Scope  | `[%scope]`                  | Scope / namespace error       |
# | EIPD    | OS     | `<%os>`                     | System / environment error    |

## Symbols
# - `!` = Negate Signal/Address
# - `@` = Context Signal/Address
# - `#` = Type Address/Signal
# - `$` = String Address/Signal
# - `%` = Return Address/Signal
# - `^` = Memory Reference/Address  
# - `&` = Memory Reference/Signal  
# - `?` = Value Address/Reference

# ---------------------------------------------

## NIND Family (Core Nulls)
# | Base | Type | !     | @     | #     | $     | %     | ^       | &     | ?     |
# | ---- | ---- | ----- | ----- | ----- | ----- | ----- | ------- | ----- | ----- |
# | NIND | Void | !0x00 | @0x00 | #0x00 | $0x00 | %0x00 | ^"0x00" | &0x00 | ?0x00 |
# | NISD | Nil  | !0x01 | @0x01 | #0x01 | $0x01 | %0x01 | ^"0x01" | &0x01 | ?0x01 |
# | NIMD | Inf  | !0x02 | @0x02 | #0x02 | $0x02 | %0x02 | ^"0x02" | &0x02 | ?0x02 |
# | NIPD | Nan  | !0x03 | @0x03 | #0x03 | $0x03 | %0x03 | ^"0x03" | &0x03 | ?0x03 |

## SIND Family (Scalars)
# | Base | Type | !     | @     | #     | $     | %     | ^       | &     | ?     |
# | ---- | ---- | ----- | ----- | ----- | ----- | ----- | ------- | ----- | ----- |
# | SIND | Bool | !0x05 | @0x05 | #0x05 | $0x05 | %0x05 | ^"0x05" | &0x05 | ?0x05 |
# | SISD | Byte | !0x06 | @0x06 | #0x06 | $0x06 | %0x06 | ^"0x06" | &0x06 | ?0x06 |
# | SIMD | Int  | !0x07 | @0x07 | #0x07 | $0x07 | %0x07 | ^"0x07" | &0x07 | ?0x07 |
# | SIPD | Vex  | !0x08 | @0x08 | #0x08 | $0x08 | %0x08 | ^"0x08" | &0x08 | ?0x08 |

## MIND Family (Data Structures)
# | Base | Type   | !     | @     | #     | $     | %     | ^       | &     | ?     |
# | ---- | ------ | ----- | ----- | ----- | ----- | ----- | ------- | ----- | ----- |
# | MIND | Hex    | !0x0a | @0x0a | #0x0a | $0x0a | %0x0a | ^"0x0a" | &0x0a | ?0x0a |
# | MISD | Lex    | !0x0b | @0x0b | #0x0b | $0x0b | %0x0b | ^"0x0b" | &0x0b | ?0x0b |
# | MIMD | Plex   | !0x0c | @0x0c | #0x0c | $0x0c | %0x0c | ^"0x0c" | &0x0c | ?0x0c |
# | MIPD | Matrix | !0x0d | @0x0d | #0x0d | $0x0d | %0x0d | ^"0x0d" | &0x0d | ?0x0d |

## PIND Family (Composite Types)
# | Base | Type   | !     | @     | #     | $     | %     | ^       | &     | ?     |
# | ---- | ------ | ----- | ----- | ----- | ----- | ----- | ------- | ----- | ----- |
# | PIND | Enum   | !0x0f | @0x0f | #0x0f | $0x0f | %0x0f | ^"0x0f" | &0x0f | ?0x0f |
# | PISD | Struct | !0x10 | @0x10 | #0x10 | $0x10 | %0x10 | ^"0x10" | &0x10 | ?0x10 |
# | PIMD | Map    | !0x11 | @0x11 | #0x11 | $0x11 | %0x11 | ^"0x11" | &0x11 | ?0x11 |
# | PIPD | Union  | !0x12 | @0x12 | #0x12 | $0x12 | %0x12 | ^"0x12" | &0x12 | ?0x12 |

## AIND Family (Abstractions)
# | Base | Type | !     | @     | #     | $     | %     | ^       | &     | ?     |
# | ---- | ---- | ----- | ----- | ----- | ----- | ----- | ------- | ----- | ----- |
# | AIND | Ant  | !0x13 | @0x13 | #0x13 | $0x13 | %0x13 | ^"0x13" | &0x13 | ?0x13 |
# | AISD | Ent  | !0x14 | @0x14 | #0x14 | $0x14 | %0x14 | ^"0x14" | &0x14 | ?0x14 |
# | AIMD | Out  | !0x15 | @0x15 | #0x15 | $0x15 | %0x15 | ^"0x15" | &0x15 | ?0x15 |
# | AIPD | Ins  | !0x16 | @0x16 | #0x16 | $0x16 | %0x16 | ^"0x16" | &0x16 | ?0x16 |

## QIND Family (Execution Controls)
# | Base | Type  | !     | @     | #     | $     | %     | ^       | &     | ?     |
# | ---- | ----- | ----- | ----- | ----- | ----- | ----- | ------- | ----- | ----- |
# | QIND | Play  | !0x17 | @0x17 | #0x17 | $0x17 | %0x17 | ^"0x17" | &0x17 | ?0x17 |
# | QISD | Pause | !0x18 | @0x18 | #0x18 | $0x18 | %0x18 | ^"0x18" | &0x18 | ?0x18 |
# | QIMD | Skip  | !0x19 | @0x19 | #0x19 | $0x19 | %0x19 | ^"0x19" | &0x19 | ?0x19 |
# | QIPD | Stop  | !0x1a | @0x1a | #0x1a | $0x1a | %0x1a | ^"0x1a" | &0x1a | ?0x1a |

## OIND Family (Operators)
# | Base | Type | !     | @     | #     | $     | %     | ^       | &     | ?     |
# | ---- | ---- | ----- | ----- | ----- | ----- | ----- | ------- | ----- | ----- |
# | OIND | Add  | !0x1b | @0x1b | #0x1b | $0x1b | %0x1b | ^"0x1b" | &0x1b | ?0x1b |
# | OISD | Sub  | !0x1c | @0x1c | #0x1c | $0x1c | %0x1c | ^"0x1c" | &0x1c | ?0x1c |
# | OIMD | Mut  | !0x1d | @0x1d | #0x1d | $0x1d | %0x1d | ^"0x1d" | &0x1d | ?0x1d |
# | OIPD | Div  | !0x1e | @0x1e | #0x1e | $0x1e | %0x1e | ^"0x1e" | &0x1e | ?0x1e |

## RIND Family (Random / Functional)
# | Base | Type    | !     | @     | #     | $     | %     | ^       | &     | ?     |
# | ---- | ------- | ----- | ----- | ----- | ----- | ----- | ------- | ----- | ----- |
# | RIND | Swizzle | !0x1f | @0x1f | #0x1f | $0x1f | %0x1f | ^"0x1f" | &0x1f | ?0x1f |
# | RISD | Noise   | !0x20 | @0x20 | #0x20 | $0x20 | %0x20 | ^"0x20" | &0x20 | ?0x20 |
# | RIMD | Select  | !0x21 | @0x21 | #0x21 | $0x21 | %0x21 | ^"0x21" | &0x21 | ?0x21 |
# | RIPD | Cast    | !0x22 | @0x22 | #0x22 | $0x22 | %0x22 | ^"0x22" | &0x22 | ?0x22 |

## TIND Family (Time / Atomic)
# | Base | Type  | !     | @     | #     | $     | %     | ^       | &     | ?     |
# | ---- | ----- | ----- | ----- | ----- | ----- | ----- | ------- | ----- | ----- |
# | TIND | Atom  | !0x23 | @0x23 | #0x23 | $0x23 | %0x23 | ^"0x23" | &0x23 | ?0x23 |
# | TISD | Sys   | !0x24 | @0x24 | #0x24 | $0x24 | %0x24 | ^"0x24" | &0x24 | ?0x24 |
# | TIMD | Delta | !0x25 | @0x25 | #0x25 | $0x25 | %0x25 | ^"0x25" | &0x25 | ?0x25 |
# | TIPD | Step  | !0x26 | @0x26 | #0x26 | $0x26 | %0x26 | ^"0x26" | &0x26 | ?0x26 |

## EIND Family (Errors)
# | Base | Type   | !     | @     | #     | $     | %     | ^       | &     | ?     |
# | ---- | ------ | ----- | ----- | ----- | ----- | ----- | ------- | ----- | ----- |
# | EIND | Syntax | !0x27 | @0x27 | #0x27 | $0x27 | %0x27 | ^"0x27" | &0x27 | ?0x27 |
# | EISD | Context| !0x28 | @0x28 | #0x28 | $0x28 | %0x28 | ^"0x28" | &0x28 | ?0x28 |
# | EIMD | Scope  | !0x29 | @0x29 | #0x29 | $0x29 | %0x29 | ^"0x29" | &0x29 | ?0x29 |
# | EIPD | OS     | !0x2a | @0x2a | #0x2a | $0x2a | %0x2a | ^"0x2a" | &0x2a | ?0x2a |

# ---------------------------------------------
# End of MewTex Comptime Evaluation Reference
