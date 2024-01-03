#!/usr/bin/env bash

set -e

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
else
    if [ ! "$(command -v chezmoi)" ]; then
        printf "Installing dotfile from Github\n"
        nix-run --experimental-features nix-command flakes 'nixpkgs#chezmoi' -- init ModestMeowth
    else
        printf "Installing dotfile from Github\n"
        chezmoi init ModestMeowth
    fi
fi
