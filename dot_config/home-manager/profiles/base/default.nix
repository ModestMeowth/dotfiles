{ config, lib, pkgs, ... }: {
    home = {
        sessionVariables = {
            EDITOR = "vim";
        };

        packages = with pkgs; [
            just
            chezmoi
            eza
            fzf
            zoxide
            starship
            zellij
        ];
    };

    programs = {
        home-manager.enable = true;
    };

    imports = [
        ../../shell/git
        ../../shell/nix-direnv
        ../../apps/mosh
        ../../apps/neovim
    ];
}
