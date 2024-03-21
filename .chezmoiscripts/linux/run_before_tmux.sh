#!/usr/bin/env bash

PLUGIN_PATH="$HOME/.config/tmux/plugins"

printf "====[ TMUX Plugin Manager\n"

mkdir -p "$PLUGIN_PATH"

if [ ! -d "$PLUGIN_PATH/tpm" ]; then
    printf ">>>>Installing TPM\n"
    git clone https://github.com/tmux-plugins/tpm "$PLUGIN_PATH/tpm"
else
    printf ">>>>Updating TPM\n"
    git -C "$PLUGIN_PATH/tpm" pull
fi
