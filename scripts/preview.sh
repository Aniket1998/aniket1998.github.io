#!/usr/bin/env bash
set -euo pipefail

project_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$project_dir"

mode="${1:-serve}"
case "$mode" in
  serve|build|build-production|install) ;;
  *) echo "Usage: $0 [serve|build|build-production|install]" >&2; exit 2 ;;
esac

# Prefer the isolated runtime; otherwise use a user-installed Ruby.
if [[ -x "$project_dir/.preview/ruby/bin/ruby" ]]; then
  export PATH="$project_dir/.preview/ruby/bin:$PATH"
fi
if ! command -v ruby >/dev/null || ! ruby -e 'exit(Gem::Version.new(RUBY_VERSION) >= Gem::Version.new("3.3") ? 0 : 1)'; then
  echo "Run ./scripts/setup-preview.sh once to install the preview dependencies." >&2
  exit 1
fi

# Keep downloaded gems and Bundler state out of system Ruby and the website.
export GEM_HOME="$project_dir/.preview/bootstrap-gems"
export GEM_PATH="$GEM_HOME:$(ruby -e 'puts Gem.default_dir')"
export PATH="$GEM_HOME/bin:$PATH"
export BUNDLE_PATH="$project_dir/.preview/gems"
export BUNDLE_APP_CONFIG="$project_dir/.preview/bundle"
export BUNDLE_USER_HOME="$project_dir/.preview/bundler"
export PKG_CONFIG_PATH="$(ruby -rrbconfig -e 'puts RbConfig::CONFIG["libdir"]')/pkgconfig${PKG_CONFIG_PATH:+:$PKG_CONFIG_PATH}"

if ! ruby -S bundle check >/dev/null 2>&1; then
  echo "Installing the site's Ruby dependencies (first run or changed Gemfile)..."
  ruby -S bundle install
fi

if [[ "$mode" == install ]]; then
  echo "Preview dependencies are ready. Run ./scripts/preview.sh to start the site."
  exit 0
fi

destination="$project_dir/_site"
jekyll_args=("$mode" --config _config.yml,_config.preview.yml --baseurl "")
if [[ "$mode" == build-production ]]; then
  destination="$project_dir/.preview/production-site"
  jekyll_args=(build --config _config.yml)
fi
jekyll_args+=(--destination "$destination")
if [[ "$mode" == serve ]]; then
  echo "Preview: http://127.0.0.1:4000 — press Ctrl+C in this terminal to stop."
  jekyll_args+=(--host 127.0.0.1 --port 4000 --livereload)
  exec ruby -S bundle exec jekyll "${jekyll_args[@]}"
fi

ruby -S bundle exec jekyll "${jekyll_args[@]}"
ruby scripts/check-site-output.rb "$destination"
