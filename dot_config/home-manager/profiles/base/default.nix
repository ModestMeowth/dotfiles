{ config, lib, pkgs, ... }: {
    home = {
        username = "mm";
        homeDirectory = "/home/mm";

        stateVersion = "23.11";

        sessionVariables = {
            EDITOR = "vim";
        };

        packages = with pkgs; [
            just
            chezmoi
            eza
            fzf
            zoxide
            zellij
            starship
        ];
    };

    programs = {
        home-manager.enable = true;
        };

    imports = [
        ../../shell/git
        ../../shell/nix-direnv
        ../../apps/neovim
    ];
}
