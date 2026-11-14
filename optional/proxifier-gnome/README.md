# GNOME Proxy

Toggle GNOME proxy settings and systemd user proxy environment variables with **Proxy On / Proxy Off**.
Requires a proxy supporting both HTTP and SOCKS5 at `127.0.0.1:7890` by default.

## Setup

Run from this directory in your GNOME session terminal:

```bash
./setup-proxifier-gnome.sh
```

- Symlinks scripts into `~/.local/bin` and launchers into `~/.local/share/applications`.
- If `~/Desktop` exists, also symlinks launchers there and enables **Allow Launching**. Never creates the directory.
- Safe to rerun. Existing files or conflicting symlinks receive numbered backups such as `filename.~1~`.

Requires Bash, GNU coreutils, `gsettings`, and a systemd user manager. Desktop launchers also require `gio` and desktop icon support in GNOME.
The `.desktop` files currently use `/home/tim/.local/bin/...` in `Exec`; adjust for other users.

## Usage and configuration

Click **Proxy On / Proxy Off**, or run `~/.local/bin/proxy-on` / `~/.local/bin/proxy-off`.

Edit `proxy_host`, `proxy_port`, and `bypass_hosts` at the top of `proxy-on.sh`. Changes apply on the next run; no reinstall is needed.

Environment changes affect processes subsequently started by the systemd user manager. Existing terminals and applications retain their environment.
