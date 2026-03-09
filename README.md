# Homebrew Tap for AckAgent

This is the official Homebrew tap for [AckAgent](https://github.com/AckAgent/cli).

## Installation

```bash
brew install ackagent/tap/ackagent
```

Or add the tap first:

```bash
brew tap ackagent/tap
brew install ackagent
```

This builds from source and installs:
- `ackagent` — CLI for SSH, GPG, age, and PAM signing
- `age-plugin-ackagent` — age encryption plugin
- `libackagent-sk` — SSH SecurityKeyProvider (software keys)
- `libackagent-pkcs11` — SSH PKCS#11 provider (hardware keys)

## Usage

After installation, authenticate with your iOS device:

```bash
ackagent login
```

See the [CLI repository](https://github.com/AckAgent/cli) for full documentation.
