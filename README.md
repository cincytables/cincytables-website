# Cincy Tables

Website for Cincy Tables, a custom furniture shop in Harrison, Ohio.

This is the replacement website in preparation for handoff to RJ. It is not
currently the live site at cincytables.com. After Jimmy transfers the site to RJ
and RJ moves the domain over, cincytables.com will serve this website.

## Preview

When RJ starts or resumes a chat in this project, the startup hook prepares a
local preview. The assistant opens it in the browser and refreshes it after
edits. No installation or build step is needed for the website.

The preview runs only on this computer. Changes stay local until RJ explicitly
says **"Publish these changes"** (or an equivalent request). Closing the chat or
saying "looks good" does not publish anything.

## RJ's workflow

1. Ask for a change in chat.
2. Review the local preview and ask for any adjustments.
3. Say **"Publish these changes"** when ready.

The assistant handles saving and publishing. Until the handoff and domain move,
publishing updates the replacement site, not the current cincytables.com site.

## Setup and maintenance for Jimmy

- Install Python 3.9 or newer and make `python3` available to Codex before handoff.
- Set up repository access and verify the startup hook runs in RJ's environment.
  Hook changes should be checked in a new or resumed chat.
- `.codex/hooks.json` has only a SessionStart hook. There is no automatic
  end-of-reply publishing hook.
- Startup fast-forwards a clean checkout. If there is unfinished or unpublished
  work, it preserves it and fetches updates without changing the draft.
- `.codex/hooks/preview.py` starts a detached server bound to `127.0.0.1`, reuses
  an existing preview for this folder, and tries ports 8000–8009 if needed. It
  serves site pages and images, excludes repository internals, and disables
  caching so refreshing shows current edits. It stays running between chats and
  restarts on the next startup after a reboot.
- To start the preview manually, run `python3 .codex/hooks/preview.py` from the
  project folder. Open the URL it prints. RJ should never need this command.

## Files

- `index.html` — home page, featured work, and process.
- `about.html` — the maker and the shop.
- `contact.html` — project inquiries and quote form.
- `style.css` — shared styles, with colors and fonts in `:root`.
- `script.js` — mobile menu and project photo viewer.
- `images/` — project and shop photos.

## Common updates

- **Text:** Edit the relevant HTML page.
- **Shared layout:** Update the header, navigation, or footer in all three pages.
- **Featured work:** Copy an existing `<article class="piece">` in `index.html`,
  update its text and image, list its photos in `data-photos`, and renumber
  `piece-num`.
- **Photos:** Save JPEGs in `images/`, no wider than 2000 pixels. Use names such
  as `project-name-1.jpg` and give each image a short `alt` description. Convert
  iPhone HEIC photos to JPEG before adding them.

Keep the current design and reuse existing styles. The quote form sends requests
to `ryan@cincytables.com`; keep its existing form action unchanged.
