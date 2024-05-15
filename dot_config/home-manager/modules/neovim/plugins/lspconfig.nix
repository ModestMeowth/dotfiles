{pkgs, ...}: {
  plugin = pkgs.nvimPlugins.nvim-lspconfig;
  configFile = ./lspconfig.lua;
  dependencies = [
    pkgs.nvimPlugins.schemastore
  ];
  extraPackages = with pkgs;
    [
      alejandra
      clang-tools
      gopls
      htmx-lsp
      ltex-ls
      lua-language-server
      nil
      marksman
      rust-analyzer
      tailwindcss-language-server
      taplo
      terraform-ls
      tflint
      yaml-language-server
      zls
    ]
    ++ (with pkgs.nodePackages; [
      bash-language-server
      dockerfile-language-server-nodejs
      prettier
      pyright
      typescript-language-server
      vim-language-server
      vscode-langservers-extracted
    ]);
}
