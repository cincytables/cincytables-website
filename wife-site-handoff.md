# A new website for RJ's wife

RJ wants a new website for his wife to replace the one she has now. Build it
the same way as this Cincy Tables site, in its own folder and its own GitHub
repository in RJ's account. RJ maintains it, not her. RJ gave you this file,
so he is asking you to do every step below.

Everything in `AGENTS.md` about working with RJ still applies. Do all of this
yourself, never ask him to run a command, and never use the words git, GitHub,
branch, or pull request with him.

## 1. Ask RJ two things

Ask him in one short message, then wait for his answer:

- the address of her current website
- anything she wants different on the new site

## 2. Create her folder and repository

1. Pick a site name from her domain, lowercase with dashes, ending in
   `-website`. `example.com` becomes `example-website`.
2. From the folder that holds this Cincy Tables folder, run:

   ```bash
   gh repo create SITE-NAME --public --add-readme --clone
   ```

   `--add-readme` gives the repository a `main` branch right away, which the
   startup hook needs. It has to be public for GitHub Pages.
3. Turn on GitHub Pages from `main` at the root. RJ's GitHub username is
   `cincytables`.

   ```bash
   gh api -X POST repos/cincytables/SITE-NAME/pages -f "source[branch]=main" -f "source[path]=/"
   ```

## 3. Copy this site's setup

Copy these from this folder into hers:

- `.codex/`, the startup hook and the local preview
- `.nojekyll`. Without it GitHub Pages runs Jekyll on the files instead of
  serving them as they are.

Don't copy `CNAME`. It claims cincytables.com.

Then change what is specific to Cincy Tables:

- In `.codex/hooks/preview.py`, set `allowed` to her site's top-level pages,
  CSS, and JS files, and rename `HEALTH_PATH`.
- Write her own `AGENTS.md` and `README.md` modeled on this site's. Keep the
  rules for working with RJ, the preview, and publishing only when asked.
  Replace the Cincy Tables facts with hers: what the site is, its pages, its
  photos, and her current website address. Say that RJ maintains the site and
  is the person you work with, not her. Until her domain moves, a publish
  updates the new site, not the one at her domain.
- Add one rule to her `AGENTS.md`. Her domain still points at her old website.
  When RJ asks to move it, write a `domain-handoff.md` for her domain modeled
  on the one in https://github.com/cincytables/cincytables-website (in its
  history if it has been deleted). Find where her domain is registered and
  where her email runs first, and list every email record he must not touch.

## 4. Build the first version

- Build it from her current website with her text and photos, and the same
  pages unless RJ asked for different ones. Then make the changes he asked
  for.
- Plain HTML, CSS, and JavaScript with no build step, like this site. One
  `style.css` with colors and fonts in `:root`.
- Photos go in `images/` as JPEG, no wider than 2000px, each with a short
  `alt`.
- If her site is on Wix, its page source shows only the first 3 photos of each
  gallery. The full photo lists are in the page JSON on
  siteassets.parastorage.com.
- If her site has a contact form, post it to formsubmit.co with her email, like
  this site's quote form. Tell RJ the first test submission sends her an
  activation email, and messages arrive only after she clicks the link in it.

## 5. Show RJ the preview

From her folder, run `python3 .codex/hooks/preview.py` and open the URL it
prints. Nothing is published yet. Ask RJ to look it over.

## 6. Move RJ to her project

Tell RJ, in plain words, to:

1. Add her folder as a new project in Codex. Give him its full path.
2. Set it to **Approve for me**.
3. Make sure **This computer** is checked.
4. Use GPT-6.1 Sol on Medium.
5. Start a new chat there and approve the hooks when Codex asks.

From then on he works on her site in that project the same way he works on
this one. He asks for changes, checks the preview, and says **"Publish these
changes"** when it's ready. After the first publish her new site is at
`https://cincytables.github.io/SITE-NAME/`. Her current website stays up until
he moves her domain.

## 7. Clean up here

Delete this file from the Cincy Tables folder and publish that deletion without
asking RJ again. Publish nothing else here.
