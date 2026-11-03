#!/bin/bash
# Keep drafts intact and prepare a local browser preview.
cd "$(git rev-parse --show-toplevel)" || exit 1

if [ "$(git symbolic-ref --quiet --short HEAD)" != main ]; then
  echo "Site sync failed: this folder is not on main. Do not edit or publish. Tell RJ to contact Jimmy."
elif [ -n "$(git status --porcelain --untracked-files=all)" ] ||
     [ "$(git rev-list --count origin/main..HEAD 2>/dev/null)" != 0 ]; then
  echo "Unpublished work is saved in this folder. Keep it intact; do not publish unless RJ asks."
  if ! git fetch origin main >/dev/null 2>&1; then
    echo "Could not check for newer updates. Do not edit or publish. Tell RJ to contact Jimmy."
  fi
elif ! out=$(git pull --ff-only origin main 2>&1); then
  echo "Getting the latest version of the site failed:"
  echo "$out"
  echo "Do not edit or publish. Tell RJ the site could not sync and to contact Jimmy."
fi

if command -v python3 >/dev/null 2>&1; then
  python3 .codex/hooks/preview.py
else
  echo "Local preview could not start because Python 3 is missing. Tell RJ to contact Jimmy for setup."
fi
echo "Changes stay local until RJ explicitly asks to publish. Open the preview URL for review; never open file:// URLs."
exit 0
