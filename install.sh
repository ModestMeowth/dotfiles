#!/usr/bin/env bash

set -e

printf "Dotfiles Setup\n"

if [ ! "$(command -v nix)" ]; then
    printf "Nix package manager: Installing\n"

    if [ "$(command -v curl)" ]; then
        sh -c "$(curl -L https://nixos.org/nix/install) --daemon"
    elif [ "$(command -v wget)" ]; then
        sh -c "$(wget -qO- https//nixos.org/nix/install) --daemon"
    else
        printf "To install you must have curl or wget installed" >&2
        exit 1
    fi
else
    printf "Nix package manager: FOUND\n\n"
fi

if [ ! "$(command -v chezmoi)" ]; then
    printf "Chezmoi: NOT FOUND\n"
    printf "Chezmoi: Installing dotfiles using nix run\n"
    nix run --extra-experimental-features nix-command flakes 'nixpkgs#chezmoi' -- init --apply ModestMeowth
else
    printf "Chezmoi: FOUND\n"
    printf "Chezmoi: Installing dotfiles\n"
    chezmoi init ModestMeowth
fi
