#!/bin/bash
# Save all pending changes and publish main at the end of every turn.
input=$(cat)

# A failure continuation only reports the error; it must not publish again.
if echo "$input" | grep -qE '"stop_hook_active"[[:space:]]*:[[:space:]]*true'; then
  echo '{}'
  exit 0
fi

fail() {
  echo "$1" >&2
  echo '{"decision":"block","reason":"Automatic publishing failed. Tell RJ to contact Jimmy. Do not retry publishing or make further changes this turn."}'
  exit 0
}

repo=$(git rev-parse --show-toplevel) || fail "Could not locate the site folder."
cd "$repo" || fail "Could not open the site folder."

current_branch=$(git symbolic-ref --quiet --short HEAD) || fail "Could not identify the current branch."
[ "$current_branch" = main ] || fail "Automatic publishing requires main."

pending=$(git status --porcelain --untracked-files=all) || fail "Could not check pending changes."
if [ -n "$pending" ]; then
  git add -A >&2 || fail "Could not stage the site changes."
  git commit -m "Update Cincy Tables site" >&2 || fail "Could not save the site changes."
fi

ahead=$(git rev-list --count origin/main..HEAD) || fail "Could not check unpublished changes."
if [ "$ahead" -gt 0 ]; then
  if ! git push origin main >&2; then
    git pull --rebase origin main >&2 || fail "Could not sync the site after publishing failed."
    git push origin main >&2 || fail "Publishing failed again after syncing."
  fi
fi
echo '{}'
exit 0
