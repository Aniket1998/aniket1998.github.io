# Working on this academic website

## Current project

This is Aniket Das's Jekyll website, configured for GitHub Pages. A framework
migration has not been chosen. The design can change without changing frameworks.

- `index.md`: biography, selected/recent paper section, and talks.
- `papers.md`: complete paper list at `/papers/`.
- `_data/papers.yml`: all paper facts, links, badges, and explicit `selected` flags;
  `_includes/paper-list.html` renders both paper lists in the same format.
- `_data/collaborators.yml`: verified research website URLs keyed by coauthor name;
  the shared paper list links names when a URL is available.
- `_config.yml`: profile details, links, site metadata, theme, and build exclusions.
- `_layouts/default.html`: shared page structure and navigation;
  `_layouts/homepage.html`: homepage profile; `_sass/academic.scss`: active styles.
  `_sass/minimal-light.scss` remains an unused copy of the original theme styles.
- `assets/css/style.scss`: Sass entry point; `assets/`: images, scripts, and CV.
- `_includes/publications.md` and `_includes/services.md`: unused theme examples,
  not the source of the current academic content.

Use the user's supplied material for factual updates. The current paper list and
talk resources were reconciled with the supplied CV at `assets/files/cv.pdf`.
The homepage is curated using `selected` flags; do not automatically select all
new papers. Only the two Tensor PCA papers with Tselil use `Preprint` badges;
other papers display the venue and year from the CV. The biography remains
separately authored in `index.md`.

## Task guidance

Load the relevant skill when the task needs its workflow:

- [Design academic site](.agents/skills/design-academic-site/SKILL.md): visual
  redesigns, layouts, and publication presentation. Its linked design brief owns
  the visual requirements and distinguishes them from open choices.
- [Update academic content](.agents/skills/update-academic-content/SKILL.md):
  reconciling CV details, publications, or academic information across pages.
- [Verify academic site](.agents/skills/verify-academic-site/SKILL.md): substantial
  changes, build/deployment configuration changes, and publication preparation.

Handle a simple wording correction directly; do not expand it into a redesign
or a full audit. Preserve accurate titles, author order, venues, dates, and status.
Keep local edits local unless the user's request authorizes publishing; honor
authorization already given in the conversation.

## Build and preview

Run commands from the repository root:

```bash
./scripts/setup-preview.sh           # one-time local setup
./scripts/preview.sh                 # live preview on 127.0.0.1:4000
./scripts/preview.sh build           # preview configuration -> _site/
./scripts/preview.sh build-production # publication configuration -> .preview/production-site/
```

See [README.md](README.md) for VS Code shortcuts and setup details. The scripts
use the isolated `.preview/` runtime and gems when available. Local preview uses
`_config.preview.yml` to disable remote-theme downloads; a successful preview
build alone does not prove that the publication configuration builds.

## Website publication boundary

Agent instructions and skills may be tracked on GitHub but must not be served
by the website. Keep `AGENTS.md`, `.agents/`, `.codex/`, skills, and local tooling
excluded in `_config.yml`. Do not place workflow material in public assets or
include it in a page template.

The build commands run `scripts/check-site-output.rb` against their output.
When adding a new workflow location, update both the exclusions and that check.
Publish only the intended generated site directory. Never publish the repository
root or the whole `.preview/` directory. Inspect the actual deployment artifact
if publishing uses a different build command or configuration.
