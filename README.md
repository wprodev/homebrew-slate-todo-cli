# Slate CLI

Command-line client for [Slate](https://slatetodo.com) — manage your todos
and shared spaces from the terminal.

## Install

### Homebrew (macOS / Linux)

```bash
brew tap wprodev/slate-todo-cli
brew install slate-cli
```

### One-line installer

```bash
curl -fsSL https://cli.slatetodo.com/download/install.sh | sh
```

The installer downloads a release tarball, verifies its SHA-256, and installs
to `~/.local/share/slate-cli/` with a wrapper script in `~/.local/bin/slate`.
Requires Node.js ≥ 20 on `$PATH`.

To pin a specific version:

```bash
SLATE_VERSION=0.1.0 curl -fsSL https://cli.slatetodo.com/download/install.sh | sh
```

## First-time setup

1. Sign in to [slatetodo.com](https://slatetodo.com) in your browser.
2. Open **Settings → API keys**, click **New API key**, copy it (shown once).
3. Run `slate login` and paste the key when prompted.

The key is stored locally at `~/.config/slate/config.json` with `0600`
permissions. The CLI cannot create accounts — sign-up happens in the browser.

## Usage

```
$ slate help
slate 0.1.0 — command line client

  slate login                Sign in by pasting an API key
  slate logout               Forget the saved key
  slate spaces               List your spaces
  slate use <space>          Set the default space (id, prefix, or name)
  slate ls [space]           List todos in a space (default if omitted)
  slate add <title> [...]    Add a todo
                             Options: --space <id>, --deadline <YYYY-MM-DD>
  slate done <id>            Toggle a todo done/undone
  slate rm <id>              Delete a todo
  slate version              Print the CLI version
```

### Examples

```bash
slate spaces                          # list spaces (* marks default)
slate use Work                        # set default space by name
slate ls                              # todos in default space
slate add "Submit expenses" --deadline 2026-05-20
slate add "Sync with Bob" --space Work
slate done 5f1a098a                   # id prefix is enough
slate rm 5f1a098a
```

## Security notes

- An API key authenticates to your Slate account, with the same scope as the
  CLI itself: read/write todos and spaces. Keys **cannot** delete your
  account, change your password, manage 2FA, or create more keys — those
  actions require a real session in the browser.
- Per-key rate limit: 120 requests / minute.
- Revoke leaked keys from **Settings → API keys** in the web app. `slate
  logout` only forgets the local copy; it does not revoke server-side.
- Treat each key like a long-lived password. One key per device makes
  individual revocation easy.

## Uninstall

```bash
# Homebrew
brew uninstall slate-cli
brew untap wprodev/slate-todo-cli

# Manual install
rm -rf ~/.local/share/slate-cli ~/.local/bin/slate ~/.config/slate
```

## License

[MIT](./LICENSE)
