{ config, lib, pkgs, ... }: {
    programs = {
        neovim = {
            enable = true;
            viAlias = true;
            vimAlias = true;
        };
    };

    home.packages = with pkgs; [
        ripgrep
    ];
}
