{pkgs, ...}: {
  imports = [
    ./git.nix
    ./fish.nix
    ./neovim.nix
  ];

  home = {
    stateVersion = "24.05";

    packages = with pkgs; [
      bat
      just
      chezmoi
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
