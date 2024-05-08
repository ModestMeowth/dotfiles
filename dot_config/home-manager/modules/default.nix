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
    };
  };
}
