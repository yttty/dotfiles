#!/usr/bin/env bash
set -euo pipefail

source_dir="$(dirname -- "$(readlink -f -- "${BASH_SOURCE[0]}")")"
bin_dir="${HOME:?HOME must be set}/.local/bin"
applications_dir="$HOME/.local/share/applications"
desktop_dir="$HOME/Desktop"

sources=(
    "$source_dir/proxy-on.sh"
    "$source_dir/proxy-off.sh"
    "$source_dir/proxy-on.desktop"
    "$source_dir/proxy-off.desktop"
)
destinations=(
    "$bin_dir/proxy-on"
    "$bin_dir/proxy-off"
    "$applications_dir/proxy-on.desktop"
    "$applications_dir/proxy-off.desktop"
)

link_file() {
    local source_path="$1"
    local destination="$2"

    if [[ -d "$destination" && ! -L "$destination" ]]; then
        printf 'Refusing to replace directory: %s\n' "$destination" >&2
        exit 1
    fi
    if [[ -L "$destination" && "$(readlink -- "$destination")" == "$source_path" ]]; then
        printf 'Already linked: %s\n' "$destination"
        return
    fi

    # GNU ln preserves an existing file or symlink as NAME.~1~, NAME.~2~, etc.
    ln --symbolic --no-target-directory --backup=numbered -- "$source_path" "$destination"
    printf 'Linked: %s -> %s\n' "$destination" "$source_path"
}

# Validate required sources and destinations before installing them.
for i in "${!sources[@]}"; do
    source_path="${sources[i]}"
    destination="${destinations[i]}"
    if [[ ! -f "$source_path" ]]; then
        printf 'Missing source file: %s\n' "$source_path" >&2
        exit 1
    fi
    if [[ "$source_path" == *.sh && ! -x "$source_path" ]]; then
        printf 'Source script is not executable: %s\n' "$source_path" >&2
        exit 1
    fi
    if [[ -d "$destination" && ! -L "$destination" ]]; then
        printf 'Refusing to replace directory: %s\n' "$destination" >&2
        exit 1
    fi
done

mkdir -p -- "$bin_dir" "$applications_dir"

for i in "${!sources[@]}"; do
    link_file "${sources[i]}" "${destinations[i]}"
done

# Desktop entries are optional; never create the Desktop directory.
if [[ -d "$desktop_dir" ]]; then
    if ! command -v gio >/dev/null; then
        printf 'gio is required to allow launching Desktop entries.\n' >&2
        exit 1
    fi

    for name in proxy-on proxy-off; do
        destination="$desktop_dir/$name.desktop"
        link_file "$source_dir/$name.desktop" "$destination"
        chmod u+x -- "$destination"
        if ! gio set -t string "$destination" metadata::trusted true; then
            printf 'Failed to allow launching: %s\n' "$destination" >&2
            exit 1
        fi
        printf 'Allowed launching: %s\n' "$destination"
    done
else
    printf 'Skipping Desktop entries: directory does not exist: %s\n' "$desktop_dir"
fi
