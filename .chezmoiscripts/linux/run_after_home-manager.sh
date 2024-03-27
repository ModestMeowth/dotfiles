#!/usr/bin/env bash

if [ "$(command -v nix)" ]; then
    printf "====[ Nix: Installed\n"

    if [ ! "$(command -v home-manager)" ]; then
        printf ">>>>[ Home Manager: Setup\n"
        nix run --extra-experimental-features flakes 'nixpkgs#home-manager' switch
    else
        printf ">>>>[ Home Manager\n"
        home-manager switch --refresh
    fi
fi
