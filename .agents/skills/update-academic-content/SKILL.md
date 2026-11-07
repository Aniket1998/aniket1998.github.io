---
name: update-academic-content
description: Reconcile a supplied CV or new academic source material with this site's biography, publications, talks, service, and CV link. Use for substantive academic content updates; handle isolated typos and wording corrections directly.
---

# Update academic content

Use the source map in the root `AGENTS.md` and trace the active renderer before editing. Theme examples and unused includes are not authoritative content. Update the source that actually renders the requested page.

## Reconcile the evidence

- Use the user's supplied material and explicit instructions for the requested update. Consult primary publication sources when additional verification is needed; distinguish verified changes from unresolved discrepancies.
- Preserve exact paper titles, author order, coauthor names, venue and year, publication status, and documented distinctions. Do not silently standardize away meaningful title spelling or change preprint status to accepted or published.
- Recognize preprint and conference versions of the same work before adding an entry. Use identifiers or source evidence to avoid accidental duplicates while preserving useful version links.
- Do not infer current academic year, affiliation, position, awards, or dates from elapsed time. Flag stale wording for resolution when a fresh source is missing.
- If sources conflict in a way that affects the update, ask a focused question and continue independent changes that are supported. Do not invent missing facts to finish a page.

## Publications and resources

Preserve the existing selected-paper set unless the user specifies changes. Adding a publication to a full list does not automatically make it selected, and a new CV alone does not establish a new curation.

Retain working resource links. Add Paper, Code, Slides, BibTeX, or similar buttons only when an actual target is available; do not guess repository URLs or fabricate citation metadata. Keep labels consistent with what the target provides.

When a full publications page and selected view coexist, keep metadata consistent between them. Inspect the current storage first: a shared publication data file is an optional future refactor, not an assumed feature. Introduce it only when the requested work benefits from that change.

## CV and related content

Leave the existing CV in place until a replacement is provided. When replacing it, verify that the supplied file is readable, update its served location or configured link as needed, and confirm that the website link opens that document. Apply supported CV changes to the relevant biography, publications, talks, or service content within the requested scope. Update any repository guidance that still describes the replacement CV as pending.

Scale verification to the edit: review the rendered entries and changed links for a content update; use `verify-academic-site` for the applicable build, route, and output checks when adding pages or changing assets and configuration. A typo correction does not require a redesign or an unrelated full-site workflow.
