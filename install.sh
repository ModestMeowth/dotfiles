#!/usr/bin/env bash

set -e

printf "Dotfiles Setup\n"

if [ ! "$(command -v nix)" ]; then
    printf "Installing nix package manager\n"

    if [ "$(command -v curl)" ]; then
        sh -c "$(curl -L https://nixos.org/nix/install) --daemon"
    elif [ "$(command -v wget)" ]; then
        sh -c "$(wget -qO- https//nixos.org/nix/install) --daemon"
    else
        printf "To install you must have curl or wget installed" >&2
        exit 1
    fi

    printf "Installing dotfile from Github\n"
    if [ ! "$(command -v chezmoi)" ]; then
        nix-run --experimental-features nix-command flakes 'nixpkgs#chezmoi' -- init ModestMeowth
    else
        chezmoi init ModestMeowth
    fi
fi
