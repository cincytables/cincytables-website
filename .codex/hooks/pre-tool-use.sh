#!/bin/bash
# Block git commands that create branches or pull requests, or rewrite history.
# The site publishes by committing and pushing straight to main.
input=$(cat)

blocked='git push[^"]* (--force|-f)|git reset --hard|git (checkout|switch) +(-[bBcC]|--create)|git branch +[^-" ]|gh pr create'

if echo "$input" | grep -qE "$blocked"; then
  echo "Blocked: this site publishes by committing and pushing straight to main. Do not create branches or pull requests, force-push, or reset history. If something is stuck, tell RJ to contact Jimmy." >&2
  exit 2
fi
exit 0
