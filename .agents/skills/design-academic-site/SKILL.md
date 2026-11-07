---
name: design-academic-site
description: Design or revise this academic website's layouts, typography, navigation, portrait treatment, and publication presentation. Use for visual or structural changes, not isolated factual edits or typo corrections.
---

# Design the academic site

Read [the design brief](references/design-brief.md) before proposing or implementing visual changes. It separates settled requirements from choices still open; update it when the user makes a lasting design decision. New user instructions take precedence.

Use the source map in the root `AGENTS.md` to trace the active page, layout, and styles before editing. The repository still uses Jekyll. Replacing the theme and migrating the framework are separate decisions; neither is a prerequisite for a visual refresh.

## Implementation decisions

- Make publication titles, authors, venues, and resource links easy to scan. Treat long titles and multiple coauthors as normal content, not exceptional cases.
- Resource buttons navigate to actual documents or URLs, so use links with clear labels and visible keyboard focus. Omit unavailable resources; do not add disabled or placeholder buttons.
- Keep the portrait subordinate to the biography and research content. Judge its size in the rendered desktop and mobile layouts rather than treating an arbitrary pixel value as an agreed requirement.
- Preserve academic facts and existing curation during layout work. Use `update-academic-content` when the task also requires reconciling new source material.
- When introducing additional pages, check asset and internal-link paths from those pages; paths that work at the homepage may fail on a nested route.

Use the documented local preview to inspect the affected pages at narrow and desktop widths, including long publication entries, navigation, and keyboard focus. If changing color rules, check both light and dark appearance wherever the site supports them. Apply the relevant checks from `verify-academic-site` before treating the change as ready.
