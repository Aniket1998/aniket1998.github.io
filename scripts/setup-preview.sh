#!/usr/bin/env bash
set -euo pipefail

project_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$project_dir"

if [[ ! -x .preview/ruby/bin/ruby ]] && ! ruby -e 'exit(Gem::Version.new(RUBY_VERSION) >= Gem::Version.new("3.3") ? 0 : 1)' 2>/dev/null; then
  if [[ "$(uname -s)" != Darwin || "$(uname -m)" != arm64 ]]; then
    echo "Install Ruby 3.3 or newer, then run this script again." >&2
    exit 1
  fi

  # Mise's portable Ruby bundles its libraries and does not alter shell settings.
  ruby_version="3.3.13"
  archive_sha256="a00568d60b0613259acf188bbb7f3bb0ca6509281c436b03a4e180bc9544d45b"
  download_dir="$(mktemp -d)"
  trap 'rm -rf "$download_dir"' EXIT
  archive="$download_dir/ruby.tar.gz"
  echo "Installing portable Ruby $ruby_version in .preview/ruby..."
  curl --fail --location --show-error \
    "https://github.com/jdx/ruby/releases/download/$ruby_version-1/ruby-$ruby_version.macos.tar.gz" \
    --output "$archive"
  actual_sha256="$(shasum -a 256 "$archive" | awk '{print $1}')"
  if [[ "$actual_sha256" != "$archive_sha256" ]]; then
    echo "Ruby archive checksum did not match; nothing was installed." >&2
    exit 1
  fi
  mkdir -p .preview/ruby
  tar -xzf "$archive" -C .preview/ruby --strip-components=1
fi

"$project_dir/scripts/preview.sh" install
