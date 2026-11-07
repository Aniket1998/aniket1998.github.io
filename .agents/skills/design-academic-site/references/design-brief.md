# Academic website design brief

## Purpose

Refresh Aniket Das's academic website so visitors can quickly understand his research, find his publications and CV, and reach relevant resources. Keep ongoing content updates straightforward.

## Settled requirements

- Keep the portrait modest in size; it should support the introduction without dominating the page. Do not put a role or university caption below it. Show the email address in a bold sans-serif font directly beneath the portrait, then the office address from the CV on the next line, followed by the icon row.
- Do not create a news page or a Service section. Do not show a theme/framework credit footer.
- Label the homepage section Selected and Recent Papers and the top navigation link Papers. Place a concise View all papers link directly below the Selected and Recent Papers heading and before the first paper, pointing to `/papers/`. Render the complete list with the same paper format.
- Show links only for resources that exist, such as Paper, Code, Slides, or BibTeX. The available resources can differ between publications.
- Present available talk Slides and Video links as buttons. Use the supplied CV for talk titles, venues, dates, and resource URLs.
- Place the SVGD paper's Spotlight distinction before its Paper link.
- Separate individual publications with spacing, not horizontal divider lines.
- Use a soft ivory `#FAF9F6` background in light mode. Use locally hosted Source Sans 3 for the biography at 18px regular weight and 1.65 line spacing. Use the earlier Source Serif 4 styling for the name: 44px, weight 500, line-height 1.2, and -0.8px letter spacing on desktop; 36px on mobile.
- Use a viridian green palette throughout the site, including badges, links, buttons, heading accents, hover states, selection, and focus outlines. Coordinate the neutral text and dark-mode background with that palette. Use all-capital technical monospace lettering for Selected and Recent Papers, All Papers, and Talks, with near-black text in light mode. Place a thick two-tone viridian accent just below each heading: a pronounced 6px lighter viridian band above a strongly contrasting 4px dark viridian bottom edge, with a very small gap so it comes close to the letters without overlapping them. Keep the accent consistent with the overall palette and retain readable light text in dark mode.
- Link every coauthor in the selected/recent list to their research website, preserving name order and the coauthor font family. Style linked names in near-black with the same font family as the surrounding coauthor text and a stronger weight, without underlines or a colored accent. Keep them readable in dark mode and retain visible keyboard focus. Store verified URLs in `_data/collaborators.yml`; use the supplied Google Research page for Praneeth Netrapalli. Reuse these URLs for matching names in the complete list.
- Style links in the introduction with a stronger font weight rather than a default colored underline; retain clear hover and keyboard-focus cues.
- Present each publication venue and year as a compact colored badge, such as `NeurIPS'24`, followed by a neutral-colored, underlined Paper link with a decorative ↗ arrow. A venue label without a destination is not an interactive button.
- Use dark filled icons with accessible names in this order: email, CV (PDF), Google Scholar, LinkedIn. Do not show a Twitter link.
- Keep the top navigation bold and dark, with decorative centered dots between the links.
- Use a condensed 1RSB cluster mark only for the browser-tab favicon, not beside the name or elsewhere in the webpage header. The SVG disks and frame adapt to the reported color scheme: charcoal (#333333) in light mode and ivory (#FAF9F6) in dark mode, with a transparent background. Use viridian (#2F755D) for the SVG's base color and the PNG fallback so browsers that ignore SVG media queries or SVG favicons still get a visible colored mark. This follows the browser/system preference rather than detecting an arbitrary tab background. The reference is the fourth panel of Figure 2 in Krzakala, Montanari, Ricci-Tersenghi, Semerjian, and Zdeborová (2007), “Gibbs states and the set of solutions of random constraint satisfaction problems.” Keep one level of separated, unequal clusters with tiny satellites inside a square phase-space frame, and simplify the smallest favicon sizes. Keep the text-only name in Source Serif 4 as specified above.
- Preserve the distinction between selected work and the complete publication list. Selection is editorial and must not be inferred from venue or recency.
- Exclude the streaming heavy-tailed Clipped SGD paper, the DDPM Auto Speculation paper, and Sampling without Replacement from the selected/recent homepage list. Keep all three on the complete papers page. Remove the two COLT talks; keep the streaming-statistics talk and the remaining COLT papers. These display choices do not change the CV.
- The supplied CV is stored at `assets/files/cv.pdf` and linked from the site. Its twelve papers and available talk resources have been reconciled; the biography remains separately authored.
- Include both Tensor PCA papers with Tselil Schramm and Parallel Sampling in the selected/recent list. Only the two Tensor PCA papers have Preprint badges. Parallel Sampling has RANDOM'26 and Diffusion Models has ICML'25 on the complete list, matching the CV. Retain their source venue and year metadata in the shared data.
- The user is comfortable replacing Minimal Light. No framework migration has been chosen, so current work should fit the existing Jekyll project unless that decision changes.

## Proposed visual direction

Use readable typography, generous but purposeful spacing, restrained color accents, and clear heading hierarchy. Favor compact navigation and publication entries whose titles, coauthors, venue information, and resource links remain legible on small screens. These are starting points for implementation, not fixed visual specifications.

The portrait can sit alongside the introduction on a wide screen and move into the reading flow on mobile. Its crop, shape, and exact dimensions should be decided by reviewing the actual image in context.

## Choices still open

- Font family, type scale, colors, content width, and exact spacing.
- Portrait dimensions, crop, shape, and placement.
- Navigation labels, page routes, and the division of content between the homepage and other pages.
- Placement of talks.
- Exact badge colors and the presentation of awards or presentation distinctions.
- Future changes to paper selection and biographical details.

## Content and implementation boundaries

The current site has biography, selected/recent papers, talks, a complete papers page, and a linked CV. Service and the theme credit footer were removed at the user's request. Treat those as existing content to preserve or reorganize within the requested change, not as evidence that the future page structure is settled.

Both paper views use `_data/papers.yml` and `_includes/paper-list.html`. Preserve this shared source so titles, coauthors, badges, distinctions, and links stay consistent. Selection is controlled by explicit flags.

Evaluate the design using real academic content: long paper titles, multiple authors, publications with different resource counts, and clear access to the full publication list and CV. A successful refresh should remain comfortable to read and navigate on both desktop and mobile.
