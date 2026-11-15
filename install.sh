#!/bin/sh
# Links this keymap into GNOME Builder's user config. Builder reloads it live.
set -eu
here=$(cd "$(dirname "$0")" && pwd)
config="${XDG_CONFIG_HOME:-$HOME/.config}/gnome-builder"
target="$config/keybindings.json"

mkdir -p "$config"
if [ -e "$target" ] && [ ! -L "$target" ]; then
    mv "$target" "$target.bak"
    echo "Backed up existing keybindings to $target.bak"
fi
ln -sfn "$here/keybindings.json" "$target"
echo "Installed: $target -> $here/keybindings.json"
