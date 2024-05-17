{pkgs, ...}: {
  imports = [
    ../../modules
    ../../modules/gtk
    ../../modules/neovim/plugins/lsp
    ../../modules/term/wezterm
  ];

  home = {
    username = "mm";
    homeDirectory = "/home/mm";

    packages = with pkgs; [
      wezterm
    ];
  };
  age = {
    identityPaths = [
      "/home/mm/.ssh/id_ed25519"
    ];
  };
}
