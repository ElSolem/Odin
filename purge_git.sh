#!/usr/bin/env bash

set -e

ROOT="$(pwd)"
echo "Target directory: $ROOT"
echo "Executing precision purge of Git artifacts..."
sleep 1

# Remove .git directories (the repo guts)
find "$ROOT" -type d -name ".git" -prune -exec rm -rf {} +

# Remove top-level Git config files
find "$ROOT" -type f -name ".gitignore" -exec rm -f {} +
find "$ROOT" -type f -name ".gitattributes" -exec rm -f {} +
find "$ROOT" -type f -name ".gitmodules" -exec rm -f {} +

# Remove Git metadata files that sometimes appear
find "$ROOT" -type f -name ".gitkeep" -exec rm -f {} +

echo "Done. All Git-related files removed with surgical precision."

