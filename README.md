# aiyoplane/homebrew-tap

Homebrew tap for [Aiyoplane, Inc.](https://aiyoplane.com) command-line tools.

## Install

```sh
brew tap aiyoplane/tap
brew install aiyo
```

Or in one command:

```sh
brew install aiyoplane/tap/aiyo
```

## What you get

**`aiyo-verify`** — Offline Ed25519 verifier for Aiyo execution receipts. Wraps the [`@aiyoplane/verify`](https://www.npmjs.com/package/@aiyoplane/verify) npm package as a native macOS command. Homebrew pulls Node as a dependency, so you don't need to install Node yourself.

Usage:

```sh
aiyo-verify path/to/receipt.txt
aiyo-verify --json path/to/receipt.txt
aiyo-verify --receipt "v2.eyJ...abc"
cat receipt.txt | aiyo-verify -
aiyo-verify --help
```

## Upgrade

```sh
brew update
brew upgrade aiyo
```

## Uninstall

```sh
brew uninstall aiyo
brew untap aiyoplane/tap
```

## Repository layout

```
homebrew-tap/
├── Formula/
│   └── aiyo.rb        # The Homebrew formula
└── README.md          # This file
```

Homebrew taps are just Git repositories named `homebrew-<tapname>` under a GitHub org or user account. Formulas live in a `Formula/` directory at the repo root.

## About Aiyo

Aiyo is the settlement-verified Economic Execution Authorization plane for autonomous systems. **Verify First. Execute Second.** [aiyoplane.com](https://aiyoplane.com)

## License

Apache License 2.0 © 2026 Aiyoplane, Inc.
