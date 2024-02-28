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
            zellij
            starship
        ];
    };

    programs = {
        home-manager.enable = true;
    };

    imports = [
        ../../shell/fish
        ../../shell/git
        ../../shell/nix-direnv
        ../../apps/neovim
    ];
}
