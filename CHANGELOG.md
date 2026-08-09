# Changelog

[![SemVer 2.0.0][📌semver-img]][📌semver] [![Keep-A-Changelog 1.0.0][📗keep-changelog-img]][📗keep-changelog]

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog][📗keep-changelog],
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html),
and [yes][📌major-versions-not-sacred], platform and engine support are part of the [public API][📌semver-breaking].
Please file a bug if you notice a violation of semantic versioning.

[📌semver]: https://semver.org/spec/v2.0.0.html
[📌semver-img]: https://img.shields.io/badge/semver-2.0.0-FFDD67.svg?style=flat
[📌semver-breaking]: https://github.com/semver/semver/issues/716#issuecomment-869336139
[📌major-versions-not-sacred]: https://tom.preston-werner.com/2022/05/23/major-version-numbers-are-not-sacred.html
[📗keep-changelog]: https://keepachangelog.com/en/1.0.0/
[📗keep-changelog-img]: https://img.shields.io/badge/keep--a--changelog-1.0.0-FFDD67.svg?style=flat

## [Unreleased]

### Added

### Changed

### Deprecated

### Removed

### Fixed

### Security

## [3.0.0] - 2026-08-09

- TAG: [v3.0.0][3.0.0t]
- COVERAGE: 95.97% -- 119/124 lines in 7 files
- BRANCH COVERAGE: 86.21% -- 25/29 branches in 7 files
- 44.83% documented

### Changed

- Drop support for Ruby versions older than 3.1 and use the modern gemspec version-loading pattern.

### Fixed

- Fix Active Support logger loading across Ruby versions by preserving the active_support/logger feature path.

- Fix Ruby 2.7 and 3.0 Active Support logger load-order compatibility.

- Load Logger before evaluating the gemspec version namespace.

- Load the gemspec version before runtime dependencies are installed.

- Preserve thread-isolated execution state across enumerators on JRuby.

- Restore cross-gem README links for the Active Support logging family.

- Move gemspec version loading out of the Active Support logger class hierarchy.

## [2.0.4] - 2026-08-08

- TAG: [v2.0.4][2.0.4t]
- COVERAGE: 95.58% -- 108/113 lines in 7 files
- BRANCH COVERAGE: 84.00% -- 21/25 branches in 7 files
- 51.72% documented

### Added

- kettle-jem-template-20260720-005 - README Support & Community links now
  include RubyForum.
- kettle-jem-template-20260726-001 - Projects now include YARD lint
  configuration and documentation dependencies so documentation issues fail
  before generated docs are refreshed.
- kettle-jem-template-20260727-001 - Spec harness documentation now lists the
  RSpec helpers provided by `kettle-test`.

### Changed

- kettle-jem-template-20260716-002 - Gemspecs now ship fewer repository-only
  files, reducing package noise for downstream packagers.
- kettle-jem-template-20260720-002 - Development Gemfiles now use the released
  `tree_sitter_language_pack` gem 1.13.3 or newer by default.
- kettle-jem-template-20260725-002 - Version specs now use `anonymous_loader` to
  cover `version.rb` without redefining constants, or are removed when version
  specs are not managed for the project.
- kettle-jem-template-20260728-001 - Generated Ruby workflows now use clearer
  setup-ruby-flash planning and can prepare appraisal-only jobs without
  installing the main Gemfile bundle.
- kettle-jem-template-20260801-001 - Generated README gem dashboard links now
  use ClickGems instead of BestGems.

### Fixed

- kettle-jem-template-20260720-003 - StructuredMerge Git diff driver config now
  uses the installed `smorg-rb` driver command.
- kettle-jem-template-20260725-001 - Release pull request branches beginning
  with `feature/release` now run JRuby and TruffleRuby workflows.
- kettle-jem-template-20260726-002 - Generated version files now document their
  version namespace and constants, reducing warning-only YARD lint output.
- kettle-jem-template-20260726-003 - Coverage upload steps now treat Coveralls,
  QLTY, and Codecov as optional, so provider outages do not fail CI when local
  coverage thresholds still pass.
- kettle-jem-template-20260728-002 - Generated RuboCop configs now ignore the
  same `gemfiles/vendor/bundle` tree as `.gitignore`, so vendored dependency
  installs are not reported as project lint debt.
- kettle-jem-template-20260728-005 - VersionGem bootstrap now creates the
  missing canonical version spec when a project only has shim namespace version
  specs.
- kettle-jem-template-20260730-001 - Gemspec package file enumeration now runs
  relative to the gemspec directory, so release package contents stay correct
  even when the gemspec is loaded from another working directory.
- kettle-jem-template-20260801-002 - Generated RSpec helpers now normalize
  managed configuration block bindings structurally, preventing mixed block
  parameter names from producing invalid configuration after a merge.
- kettle-jem-template-20260801-003 - Generated project metadata and
  documentation now normalize configured underscore hostnames to valid
  hyphenated hostnames.
- kettle-jem-template-20260801-004 - Generated organization README logos now
  use GitHub's stable organization avatar endpoint instead of assuming a
  matching Galtzo-hosted asset exists.

- kettle-jem-template-20260728-003 - Generated dep-heads workflows now run
  TruffleRuby jobs with current RubyGems and Bundler, avoiding setup failures
  before the test suite starts.
- kettle-jem-template-20260728-004 - Generated dep-heads workflows now use the
  setup-ruby Bundler install path for direct appraisal Gemfiles, avoiding rv
  lockfile parser failures on Git and path dependencies.
- kettle-jem-template-20260729-001 - Generated JRuby 9.4 workflows now use the
  legacy manual bundle install path, avoiding setup-time Bundler full-index
  failures against `gem.coop`.

- kettle-jem-template-20260802-001 - Devcontainer JSON files now merge as JSONC,
  preserving comments and trailing commas during template updates.

- Preserve the Activesupport::Logger version namespace when loading beside Rails

- Restore ActiveSupport logger version namespaces after templating.

- Fix cross-gem README Markdown references before release.

- Synchronize LICENSE copyright years with README.md for release validation.

## [2.0.3] - 2024-11-22

- COVERAGE:  95.50% -- 106/111 lines in 6 files
- BRANCH COVERAGE:  84.00% -- 21/25 branches in 6 files
- 44.83% documented

### Removed

- rdoc as runtime dependency

### Changed

- upgrade activesupport-broadcast_logger v2.0.2

## [2.0.2] - 2024-11-22

- COVERAGE:  95.50% -- 106/111 lines in 6 files
- BRANCH COVERAGE:  84.00% -- 21/25 branches in 6 files
- 44.83% documented

### Added

- rdoc as development dependency

### Changed

- upgrade activesupport-broadcast_logger v2.0.1

## [2.0.1] - 2024-11-21

- COVERAGE:  95.50% -- 106/111 lines in 6 files
- BRANCH COVERAGE:  84.00% -- 21/25 branches in 6 files
- 44.83% documented

### Added

- More tests lifted from Rails v8.0 test suite

### Fixed

- Compatibility with ActiveSupport
  - Many libraries do `require "active_support"`

## [2.0.0] - 2024-11-21

- COVERAGE:  95.50% -- 106/111 lines in 6 files
- BRANCH COVERAGE:  84.00% -- 21/25 branches in 6 files
- 44.83% documented

### Added

- Tests lifted from Rails v8.0 test suite
- `ActiveSupport::LoggerSilence`
- `ActiveSupport::IsolatedExecutionState`

### Changed

- Now loads even in Rails 8
  - fully replaced logging tooling that ships with all versions of Rails >= v5.2 on Ruby 2.7+

### Fixed

- Compatibility with Rails > v5.2 and < v7.1
  - proved by Appraisals-based CI matrix covering all supported versions of Rails & Ruby

## [1.0.1] - 2024-10-10

- COVERAGE:  51.32% -- 39/76 lines in 6 files
- BRANCH COVERAGE:   5.56% -- 1/18 branches in 6 files
- 55.56% documented

### Fixed

- Typo in internal file name (non-breaking, just annoying/confusing)

## [1.0.0] - 2024-10-10

- COVERAGE:  51.32% -- 39/76 lines in 6 files
- BRANCH COVERAGE:   5.56% -- 1/18 branches in 6 files
- 55.56% documented

### Added

- Initial release

[Unreleased]: https://github.com/galtzo-floss/activesupport-logger/compare/v3.0.0...HEAD
[3.0.0]: https://github.com/galtzo-floss/activesupport-logger/compare/v2.0.4...v3.0.0
[3.0.0t]: https://github.com/galtzo-floss/activesupport-logger/releases/tag/v3.0.0
[2.0.4]: https://github.com/galtzo-floss/activesupport-logger/compare/v2.0.3...v2.0.4
[2.0.4t]: https://github.com/galtzo-floss/activesupport-logger/releases/tag/v2.0.4
