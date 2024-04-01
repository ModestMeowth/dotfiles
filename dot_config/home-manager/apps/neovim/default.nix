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
        zig
        nil
        lua-language-server
        yaml-language-server
        nodePackages.vscode-json-languageserver
        taplo
        marksman
        terraform-ls
        ansible-language-server
        dockerfile-language-server-nodejs
        rust-analyzer
        gopls
        zls
        clang-tools
        nodePackages.vim-language-server
        nodePackages.bash-language-server
        nodePackages.typescript-language-server
        nodePackages.pyright
        ltex-ls
        nodePackages.vscode-html-languageserver-bin
        nodePackages.vscode-css-languageserver-bin
        tailwindcss-language-server
        htmx-lsp
    ];
}
