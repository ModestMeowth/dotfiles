{pkgs, ...}: {
  plugin = pkgs.nvimPlugins.telescope;
  extraPackages = with pkgs; [
    ripgrep
    fd
  ];
  dependencies = with pkgs; [
    nvimPlugins.plenary
  ];
  opts = {
    defaults.layout_config.horizontal.width = 0.9;
  };
  postConfig = /* lua */ ''
    local builtin = require "telescope.builtin"
    vim.keymap.set("n", "<leader>pf", builtin.find_files)
    vim.keymap.set("n", "<C-p>", builtin.git_files)
    vim.keymap.set("n", "<leader>vh", builtin.help_tags)
  '';
}
