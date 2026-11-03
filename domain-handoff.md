# Moving cincytables.com to the new site

This points cincytables.com at the new website. The domain stays registered
with Wix, and your email stays on Google. You only change where the website
part of the domain points.

Most of this happens in your web browser. One step at the end is a prompt you
paste into Codex.

## Before you start

1. Log in to your GitHub account and your Wix account in the same browser.
2. Find your GitHub username. Click your profile picture in the top right of
   GitHub. Your username is shown at the top of the menu. You'll need it in step 11.
3. In Wix, go to **Domains**, click the **⋯** next to cincytables.com, and
   choose **Manage DNS Records**. Take a screenshot of the whole page. If
   anything goes wrong, this shows how it was set up before.

## Step 1: Prove to GitHub that you own the domain

4. In GitHub, click your profile picture → **Settings** → **Pages** (in the
   left sidebar) → **Add a domain**.
5. Type `cincytables.com` and click **Add domain**.
6. GitHub shows a TXT record with a **name** that starts with
   `_github-pages-challenge-` and a **value**. Leave this tab open.
7. In the Wix DNS page, find the **TXT** section and click **+ Add Record**.
   - **Host Name:** the part of GitHub's name before `.cincytables.com`
   - **Value:** GitHub's value

   Click **Save**, then **Save Changes**.
8. Back in GitHub, click **Verify**. If it says it failed, wait 10 minutes and
   click **Verify** again.

## Step 2: Tell the website it lives at cincytables.com

9. In GitHub, open the **cincytables-website** repository → **Settings** →
   **Pages**.
10. Under **Custom domain**, type `cincytables.com` and click **Save**. It will
    say the DNS check failed. That's expected until you finish Step 3.

## Step 3: Point the domain at the new site in Wix

11. In the Wix DNS page, change only these records:

    | Section | What to do |
    |---|---|
    | **A (Host)** | Click **+ Add Record** four times. Leave **Host Name** blank. Use these four values, one per record: `185.199.108.153`, `185.199.109.153`, `185.199.110.153`, `185.199.111.153` |
    | **A (Host)** | Delete the three old records, `185.230.63.107`, `185.230.63.171` and `185.230.63.186`, using **⋯** → **Delete** on each |
    | **CNAME (Aliases)** | Change the `www` record's value from `cdn3.wixdns.net` to `YOUR-GITHUB-USERNAME.github.io` |

    Click **Save Changes** when you're done.

12. **Do not touch anything else.** These records run your email:
    - every **MX** record (they point to `google.com`)
    - the TXT record that starts with `v=spf1`
    - the TXT record that starts with `google-site-verification`
    - the `google._domainkey` record

## Step 4: Wait

13. Give it about an hour. It can take up to 48 hours in rare cases. You can
    keep using the old site and your email while you wait.

## Step 5: Have Codex finish and check everything

14. Open Codex in the website folder and paste this prompt:

```text
I just pointed cincytables.com at this site. I added the domain in GitHub Pages and changed the Wix DNS records. Please check everything and finish the setup:

1. Confirm cincytables.com has GitHub's four A records (185.199.108.153, 185.199.109.153, 185.199.110.153, 185.199.111.153) and that www.cincytables.com points to my github.io address.
2. Confirm the MX records for cincytables.com still point to Google, so my email still works.
3. Confirm GitHub Pages shows cincytables.com as the custom domain and the DNS check passes.
4. Turn on Enforce HTTPS for the site.
5. Confirm https://cincytables.com and https://www.cincytables.com both load the new site.

If any check fails, or HTTPS isn't available yet, tell me in plain words what's wrong and when to try again, and stop here without changing anything else.

If everything checks out, publish the following without asking me again:
Update repo to say site is now live at cincytables.com. then delete domain-handoff.md
```

## Step 6: Final checks

15. From a different email account, send a test email to ryan@cincytables.com
    and make sure it arrives.
16. Go to cincytables.com/contact.html and send yourself a test quote request.
    The first time, you'll get an email from FormSubmit asking you to activate
    the form. Click the link in it. Quote requests arrive normally after that.

## One week later

17. If the new site has been working all week, cancel the **website plan** in
    Wix. Keep the **domain** subscription. If you pay for Google Workspace
    through Wix, keep that too.
