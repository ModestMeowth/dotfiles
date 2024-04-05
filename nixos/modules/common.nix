{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.05";
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  time.timeZone = "America/Chicago";

  programs = {
    command-not-found.enable = false;
    nix-index.enable = true;
    vim.defaultEditor = true;
    tmux.enable = true;
  };

  environment.systemPackages = with pkgs; [
    pciutils
    git
    curl
    age
    direnv
  ];

  fonts = {
    fontconfig.enable = true;
    enableDefaultPackages = true;
    packages = with pkgs; [nerdfonts];
  };

  security = {
    sudo = {
      enable = true;
      wheelNeedsPassword = true;
    };
    doas.enable = false;
  };

  services = {
    tailscale.enable = true;
  };
}
