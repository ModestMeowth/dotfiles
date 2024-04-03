{
  pkgs,
  lib,
  ...
}: {
  security = {
    sudo = {
      enable = true;
      wheelNeedsPassword = true;
    };
    doas.enable = false;
  };

  environment.systemPackages = with pkgs; [
    sbctl
  ];

  boot.loader.systemd-boot.enable = lib.mkForce false;

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/etc/secureboot";
  };
}
