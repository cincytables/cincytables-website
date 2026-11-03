# Cincy Tables

Website for Cincy Tables, a custom furniture shop in Harrison, Ohio.

This is the replacement website in preparation for handoff to RJ. It is not
currently the live site at cincytables.com. After Jimmy transfers the site to RJ
and RJ moves the domain over, cincytables.com will serve this website.

## Preview

Open `index.html` in a browser. No installation or build step is needed.

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
