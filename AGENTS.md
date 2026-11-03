# Cincy Tables website

The replacement website for Cincy Tables, a custom furniture shop in Harrison,
Ohio. It is served by GitHub Pages from the `main` branch, but it is not currently
the live site at cincytables.com. The site will be transferred to RJ, then RJ will
move the domain over. Only after that handoff and domain move will
cincytables.com serve this website.

## How the site is built

Plain HTML, CSS, and JavaScript. There is no build step, framework, or package
manager. Do not add one.

- `index.html`, `about.html`, `contact.html`: the three pages.
- `style.css`: one stylesheet for every page. Colors and fonts live in `:root`.
- `script.js`: the mobile menu and the photo viewer.
- `images/`: every photo. Project photos are named `<project>-1.jpg`,
  `<project>-2.jpg`, and so on. Shop photos are `shop-01.jpg` and up.

The header, nav, and footer are copied into all three pages. A change to any of
them must be made in all three files.

To add a Featured Work project, copy an existing `<article class="piece">` in
`index.html`, list its photos in `data-photos`, and renumber `piece-num`.

New photos: save them as `.jpg` in `images/`, no wider than 2000px. Convert
iPhone `.heic` photos to `.jpg` first (`sips -s format jpeg in.heic --out out.jpg`).
Give every image a short `alt` description.

## Rules

- Keep the current design. Reuse the existing colors, fonts, and classes in
  `style.css` instead of inventing new ones.
- The quote form posts to `formsubmit.co/ryan@cincytables.com`. Do not change
  its `action`.

## Working with RJ after handoff

RJ owns this site and is not technical. He only talks to you. Never ask him to
use git, GitHub, branches, or pull requests, and never use those words with him.

When something fails, explain the failure in plain language and say what you
will do to fix it. Investigate and carry out safe repairs yourself, preserving
unfinished work. If a repair needs access or
information you do not have, explain the specific blocker and ask only for what
is needed; do not promise a fix you cannot carry out.

### Start and preview

- The SessionStart hook checks for updates and starts or reuses the local preview.
  It preserves unfinished work instead of stashing or publishing it. If it reports
  a sync failure, resolve it before editing or publishing. Explain what failed
  and how you will fix it, preserving unfinished work.
- Open the preview URL printed by the hook in the browser. Use the changed page's
  route, such as `/about.html`. Use HTTP, never a `file://` URL.
- If the preview has stopped, run `python3 .codex/hooks/preview.py` from the site
  folder and use the URL it prints. Do this for RJ; never ask him to run commands.
- Make the requested changes, check them, and refresh the preview so RJ can review
  them. The server reads the current files directly; no build is needed.
- Changes stay local between replies and sessions. There is no Stop hook.

### Publish only when asked

- An edit request or a reply such as "looks good" does not authorize publishing.
  Let RJ know he can say **"Publish these changes"** when he is ready. Equivalent
  explicit requests such as "publish it" also authorize publishing.
- On an explicit publish request, review all pending changes, run appropriate
  checks, commit the intended changes with a short descriptive message, and push
  straight to `main`. Never create a branch or pull request. If the changes are
  already committed locally, push them without creating an empty commit.
- Do not ask for another confirmation after an explicit publish request unless
  the changes include unrelated work whose inclusion is unclear.
- If the push fails, run `git pull --rebase origin main` and push again. If the
  rebase conflicts, abort it to preserve local work, inspect the conflicting
  changes, and resolve them while preserving the intended edits. Check the
  result before retrying publication. If the second push fails, diagnose the
  actual error and fix its cause before retrying; do not repeat failing commands
  blindly. Explain the failure and your repair plan in plain language.
- After a successful publish, say the update will appear in about a minute.
  Only say it will be live at cincytables.com after the handoff and domain move
  are complete. Before then, call it an update to the replacement site.
