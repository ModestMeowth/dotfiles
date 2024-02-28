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
        ];
    };

    programs = {
        home-manager.enable = true;
    };

    


    imports = [
        ../../shell/fish
        ../../shell/git
        ../../shell/nix-direnv
        ../../shell/zellij
        ../../apps/neovim
    ];
}
