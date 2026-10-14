#!/usr/bin/env bash
# Read-only verification helper for the Kali Linux file-management task.
# Run as agent007 after completing the workflow. This script does not modify
# the lab workspace and does not create evidence files.
set -u

ROOT="/home/agent007/mission"
INTEL="$ROOT/intel"
BACKUP="$ROOT/ops/backup"

status=0

check_dir() {
  if [[ -d "$1" ]]; then
    printf '[OK] Directory exists: %s\n' "$1"
  else
    printf '[MISSING] Directory: %s\n' "$1"
    status=1
  fi
}

check_file() {
  if [[ -e "$1" ]]; then
    printf '[OK] File exists: %s\n' "$1"
  else
    printf '[MISSING] File: %s\n' "$1"
    status=1
  fi
}

printf '%s\n' '== Required directories =='
check_dir "$ROOT"
check_dir "$INTEL"
check_dir "$ROOT/ops"
check_dir "$BACKUP"

printf '\n%s\n' '== Required final files =='
check_file "$INTEL/targets.txt"
check_file "$INTEL/routes.txt"
check_file "$INTEL/listing1.txt"
check_file "$INTEL/listing2.txt"
check_file "$INTEL/listing3.txt"
check_file "$BACKUP/routes.txt"

if [[ -e "$INTEL/keys.txt" ]]; then
  printf '[UNEXPECTED] keys.txt still exists: %s\n' "$INTEL/keys.txt"
  status=1
else
  printf '[OK] keys.txt is absent as required: %s/keys.txt\n' "$INTEL"
fi

printf '\n%s\n' '== Current target metadata =='
if [[ -e "$INTEL/targets.txt" ]]; then
  ls -l "$INTEL/targets.txt"
  stat -c 'Mode: %a | Owner: %U | Group: %G' "$INTEL/targets.txt"
  if [[ "$(stat -c '%a' "$INTEL/targets.txt")" != "640" ]]; then
    printf '[NOTE] Current mode is not 640. Confirm whether a later instructor-directed step changed it.\n'
  fi
fi

printf '\n%s\n' '== Current recursive workspace listing =='
ls -laR "$ROOT"

if [[ "$status" -eq 0 ]]; then
  printf '\n%s\n' 'Basic path checks passed. Review the printed metadata and complete the submission checklist.'
else
  printf '\n%s\n' 'One or more basic path checks failed. Review the workflow and repeat only the appropriate task step.'
fi
exit "$status"
