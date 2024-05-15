{pkgs, ...}: {
  plugin = pkgs.vimPlugins.nvim-treesitter.withAllGrammars;
  main = "nvim-treesitter.configs";
  opts = {
    auto_install = false;
    indent = {
      enable = true;
      disable = [
        "python"
        "yaml"
      ];
    };
    highlight = {
      enable = true;
      disable = [
        "yaml"
      ];
      additional_vim_regex_highlighting = true;
    };
  };
}
