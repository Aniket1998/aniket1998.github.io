---
name: verify-academic-site
description: Verify this academic website after substantial content or layout changes, changes to build or publishing configuration, or before publication. Check the relevant rendered pages, links, and exclusion of agent files from output; ordinary typo fixes do not need this full workflow.
---

# Verify Academic Site

Choose checks according to the change. Read the root `AGENTS.md` for the current
source map and `README.md` only when setup or editor instructions are needed.

## Build the relevant output

From the repository root, use `./scripts/preview.sh build` for a preview build
in `_site/`. Before publication or after changes to exclusions, theme, or build
configuration, also run `./scripts/preview.sh build-production`. That builds into
`.preview/production-site/` using `_config.yml` without the preview override.
It may fetch the remote theme. If the production build is blocked, report that
limit separately from any successful local preview; do not claim equivalence.

Both commands run `scripts/check-site-output.rb` and fail if protected file or
directory names appear in generated output, including rendered `AGENTS.html`
and `SKILL.html` variants. If the actual deployment uses another directory or
configuration, build that artifact and check it directly:

```bash
ruby scripts/check-site-output.rb path/to/generated/site
```

Inspect the output for accidental inclusion of workflow content in normal pages
as well; a path check cannot detect a template that embeds instructions into
`index.html`. Keep new workflow directories covered by both `_config.yml` and
the output check. Do not publish the repository root or all of `.preview/`.

## Check the affected experience

- For visual changes, use `./scripts/preview.sh` and inspect the changed pages
  at a desktop width and a narrow phone width. Check overflow, the portrait,
  publication wrapping, focus visibility, and navigation by keyboard. Inspect
  light and dark appearance if the changed styles support both.
- For content changes, compare rendered titles, author order, venues, dates,
  and status with the supplied source. Inspect the actual CV when it changes.
- Resolve affected local links and fragment targets against the generated site.
  Check changed external destinations when access is available; distinguish an
  access restriction from a confirmed broken link.
- Once separate selected/full publication views exist, verify that selected
  entries match their full-list counterparts and that the full-list link works.
  Do not treat these proposed views as existing features before implementation.

For an exclusion change, inspect the built files as well as HTTP responses from
that output. A 404 for a filename that was never present in the source is not
evidence that the exclusion works. Use the real instruction and skill files or
an isolated fixture; keep temporary fixtures out of the project content.

Finish with a concise account of what was checked and any unresolved limits.
Verification does not itself authorize a push or deployment; follow the user's
current request and any authorization already established in the conversation.
