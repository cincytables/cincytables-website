#!/bin/bash
# Pull the latest site so every session starts from what is live.
cd "$(git rev-parse --show-toplevel)" || exit 0

if ! out=$(git pull --rebase --autostash 2>&1); then
  git rebase --abort 2>/dev/null
  echo "Getting the latest version of the site failed:"
  echo "$out"
  echo "Do not change any files. Tell RJ the site could not sync and to contact Jimmy."
fi
exit 0
