# Proxifier

Manage proxy environment variables in the current shell and global Git proxy settings. Does not change GNOME proxy settings.

## Setup

Requires Bash, curl, Git, and a proxy supporting HTTP and SOCKS5. Run from this directory:

```bash
./setup-proxifier.sh
```

Downloads `proxifier.sh` to `~/.plugins/proxifier/`. Rerun to update the installed copy.
The repository's `.zshrc` loads it when installed; restart Zsh after setup.

## Usage

With the default alias in `.zshrc`:

```bash
proxifier set    # Enable shell and Git proxy settings
proxifier unset  # Remove shell and Git proxy settings
proxifier echo   # Show addresses and proxy variables
```

The default endpoint is `127.0.0.1:7890`. For WSL, switch to the `proxifier wsl` alias in `.zshrc` to use the default gateway instead.
Edit `~/.plugins/proxifier/proxifier.sh` to change the port or bypass list, then restart Zsh. Rerunning setup replaces it with the upstream version.
