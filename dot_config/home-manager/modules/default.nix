{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./git.nix
    ./neovim.nix
  ];

  home = {
    stateVersion = "24.05";

    packages = with pkgs; [
      chezmoi
      direnv
      eza
      fd
      fzf
      just
      mosh
      ncdu
      nmap
      starship
      zellij
      zoxide
    ];
  };

  programs = {
    home-manager.enable = true;

    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batman
        batdiff
        prettybat
      ];
      themes = {
        dracula = {
          src = pkgs.fetchFromGitHub {
            owner = "dracula";
            repo = "sublime";
            rev = "456d3289827964a6cb503a3b0a6448f4326f291b";
            hash = "sha256-8mCovVSrBjtFi5q+XQdqAaqOt3Q+Fo29eIDwECOViro=";
          };
          file = "Dracula.tmTheme";
        };
      };
    };
  };
}
