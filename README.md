# githooks

A collection of reusable [git hooks](https://git-scm.com/docs/githooks) for everyday development.

## Hooks

| Hook | What it does |
|------|--------------|
| _coming soon_ | |

## Installation

```bash
git clone <this-repo-url> ~/githooks
cd ~/githooks

./install.sh /path/to/your/repo   # one repository
./install.sh --global             # every repository on this machine
./install.sh --uninstall /path/to/your/repo
```

Installation sets git's `core.hooksPath` to this repo's `hooks/` directory, so
pulling updates here updates the hooks everywhere they're installed.

To skip hooks for a single command: `git commit --no-verify`.

## Adding a hook

1. Create an executable file in `hooks/` named after the git hook it implements
   (e.g. `hooks/pre-commit`, `hooks/commit-msg`).
2. Start it with a shebang (`#!/usr/bin/env bash`) and `set -euo pipefail`.
3. Exit non-zero to block the git action.
4. Add a row to the table above.

## Development

Scripts are linted with [ShellCheck](https://www.shellcheck.net/) in CI on every push and pull request.

## License

[MIT](LICENSE)
