#!/usr/bin/env ruby
# Check generated files, including Markdown that Jekyll may have turned into HTML.
require "find"
require "pathname"

if ARGV.length != 1
  warn "Usage: ruby scripts/check-site-output.rb GENERATED_SITE_DIRECTORY"
  exit 2
end

root = Pathname.new(ARGV.fetch(0)).expand_path
unless root.directory? && root.join("index.html").file?
  warn "No generated homepage found in #{root}"
  exit 1
end

development_roots = %w[.agents .codex .preview .vscode skills scripts]
agent_directories = %w[.agents .codex]
instruction_filename = /\A(?:AGENTS(?:\.override)?|SKILL)\.(?:md|html?)\z/i
leaks = []

Find.find(root.to_s) do |path|
  next if path == root.to_s

  relative = Pathname.new(path).relative_path_from(root)
  parts = relative.each_filename.to_a
  if development_roots.include?(parts.first) ||
      parts.any? { |part| agent_directories.include?(part) } ||
      instruction_filename.match?(parts.last)
    leaks << relative.to_s
    Find.prune if File.directory?(path)
  end
end

unless leaks.empty?
  warn "Development files found in website output; do not publish this directory:"
  leaks.each { |path| warn "  #{path}" }
  exit 1
end

puts "Website output check passed: no agent, skill, or development-tooling paths."
