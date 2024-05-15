{pkgs, ...} @ args: let
  importPlugins = plugins: (map (path: import path args) plugins);

  plugins =
    (importPlugins [
      ./telescope.nix
      ./treesitter.nix
      ./lspconfig.nix
      ./cmp.nix
      ./cloak.nix
      ./fidget.nix
      ./trouble.nix
    ])
    ++ (with pkgs.nvimPlugins; [
      {plugin = suda;}
      {plugin = undotree;}
      {plugin = dracula;}
    ]);
in {
  programs.xenon.plugins = plugins;
}
