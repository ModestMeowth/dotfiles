{pkgs, ...}: {
  imports = [
    ./git.nix
    ./fish.nix
    ./neovim.nix
  ];

  home = {
    stateVersion = "24.05";

    packages = with pkgs; [
      chezmoi
      bat
      htop
      just
      eza
      fd
      fzf
      zoxide
      starship
      zellij
      mosh
      bitwarden-cli
    ];
  };

  programs = {
    home-manager.enable = true;
  };
}
