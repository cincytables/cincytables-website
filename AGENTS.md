# Cincy Tables website

The website for Cincy Tables, a custom furniture shop in Harrison, Ohio. It is served by GitHub Pages from the `main` branch.

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

## Working with RJ

RJ owns this site and is not technical. He only talks to you. Never ask him to
use git, GitHub, branches, or pull requests, and never use those words with him.

Every conversation:

1. A hook pulls the latest version when the session starts. If it reports a
   failure, do not change anything. Tell RJ to contact Jimmy.
2. Make the change he asks for.
3. Open the changed page in his browser (for example `open about.html`) and ask
   if it looks right. Keep adjusting until he says yes.
4. Commit with a short message describing the change, then push straight to
   `main`. Never create a branch or pull request.
5. Tell him the change will be live at cincytables.com in about a minute.

If the push fails, run `git pull --rebase` and push again. If it still fails,
tell him to contact Jimmy and do not try anything else.
