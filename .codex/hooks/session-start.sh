#!/bin/bash
# Keep drafts intact and prepare a local browser preview.
cd "$(git rev-parse --show-toplevel)" || exit 1

if [ "$(git symbolic-ref --quiet --short HEAD)" != main ]; then
  echo "Site sync failed: this folder is not on main. Do not edit or publish. Explain the failure to RJ in plain language and describe how you will fix it."
elif [ -n "$(git status --porcelain --untracked-files=all)" ] ||
     [ "$(git rev-list --count origin/main..HEAD 2>/dev/null)" != 0 ]; then
  echo "Unpublished work is saved in this folder. Keep it intact; do not publish unless RJ asks."
  if ! git fetch origin main >/dev/null 2>&1; then
    echo "Could not check for newer updates. Do not edit or publish. Explain the failure to RJ in plain language and describe how you will fix it."
  fi
elif ! out=$(git pull --ff-only origin main 2>&1); then
  echo "Getting the latest version of the site failed:"
  echo "$out"
  echo "Do not edit or publish. Explain to RJ that the site could not get the latest updates and describe how you will fix it."
fi

if command -v python3 >/dev/null 2>&1; then
  python3 .codex/hooks/preview.py
else
  echo "Local preview could not start because Python 3 is missing. Explain to RJ that Python 3 is missing and describe the setup repair needed."
fi
echo "Changes stay local until RJ explicitly asks to publish. Open the preview URL for review; never open file:// URLs."
exit 0
