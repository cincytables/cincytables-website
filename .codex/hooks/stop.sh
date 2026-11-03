#!/bin/bash
# If a commit was made but not pushed, make Codex push it before finishing.
input=$(cat)

# Only nudge once per turn so a failing push cannot loop.
echo "$input" | grep -qE '"stop_hook_active": *true' && exit 0

cd "$(git rev-parse --show-toplevel)" || exit 0
ahead=$(git rev-list --count '@{u}..HEAD' 2>/dev/null) || exit 0

if [ "$ahead" -gt 0 ]; then
  echo '{"decision":"block","reason":"There are committed changes that are not live yet. Push them to main now, then tell RJ the site will update in about a minute. If the push fails, run git pull --rebase and push again. If it still fails, tell RJ to contact Jimmy."}'
fi
exit 0
