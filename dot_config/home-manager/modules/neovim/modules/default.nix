{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./git.nix
    ./neovim
  ];

  systemd.user.startServices = "sd-switch";
  home = {
    stateVersion = "24.05";

    packages = with pkgs; [
      agenix
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
      ripgrep
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
