# SureForgeTech Homebrew tap

Install SureForge tools with [Homebrew](https://brew.sh) on macOS.

```sh
brew install sureforgetech/tap/<name>
```

| Name | What it is | Kind |
| --- | --- | --- |
| `sureforge-capture` | SureForge Capture (BugNarrator): narrate macOS testing sessions and turn them into bug reports | App (Apple silicon, macOS 14+) |
| `sureforge-terminal` | SureForge Terminal: local-first SSH client with sessions, SFTP, snippets and port forwards | App (Apple silicon, macOS 13+) |
| `sureforge-cfr` | Self-hosted Title 38 CFR index with an MCP server and HTTP API (command: `cfr-free`) | Command-line tool (needs Node.js, installed automatically) |

The apps are signed and notarized by Apple. Each entry installs the latest published release of its
project; versions follow each project's own release numbers.

## Reporting problems

Open an issue in the project's own repository (linked from `brew info <name>`). For an install problem
with this tap, open an issue here. Security problems: see the
[security policy](https://github.com/SureForgeTech/.github/blob/main/SECURITY.md).

## License

The tap's own files are licensed under Apache-2.0. Each project keeps its own licence.
