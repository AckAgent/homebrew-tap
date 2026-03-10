# Repository Guidelines

## Project Structure & Module Organization
`Formula/ackagent.rb` defines the source build formula. `Casks/ackagent.rb` defines the macOS package install path. `README.md` contains the public installation instructions.

## Build, Test, and Development Commands
- `brew audit --strict Formula/ackagent.rb`: lint the formula.
- `brew audit --strict Casks/ackagent.rb`: lint the cask.
- `brew install --build-from-source ./Formula/ackagent.rb`: verify the formula still builds locally.

## Release Coordination
This tap should follow upstream releases rather than reimplement their build logic. Keep formula URLs, versions, and checksums aligned with the published CLI release, and keep the cask aligned with the published macOS package metadata.

## Commit & Pull Request Guidelines
Keep updates tightly scoped to one release or packaging fix. Include the Homebrew commands you ran when changing formula or cask metadata.
