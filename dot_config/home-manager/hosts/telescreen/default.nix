{ pkgs, config, ... }: {
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
            ripgrep
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
    ];
}
