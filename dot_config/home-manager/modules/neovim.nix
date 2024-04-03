{
  config,
  lib,
  pkgs,
  ...
}: {
  programs = {
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
    };
  };

  home.packages = with pkgs;
    [
      ripgrep
      zig
      nil
      lua-language-server
      yaml-language-server
      taplo
      marksman
      terraform-ls
      ansible-language-server
      dockerfile-language-server-nodejs
      rust-analyzer
      gopls
      zls
      clang-tools
      ltex-ls
      htmx-lsp
      tailwindcss-language-server
    ]
    ++ (with nodePackages; [
      vim-language-server
      bash-language-server
      typescript-language-server
      pyright
      vscode-json-languageserver
      vscode-html-languageserver-bin
      vscode-css-languageserver-bin
    ]);
}
