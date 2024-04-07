{
  config,
  lib,
  modulesPath,
  pkgs,
  ...
}: {
  imports = [(modulesPath + "/installer/scan/not-detected.nix")];

  hardware = {
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    opengl = {
      enable = true;
      extraPackages = with pkgs; [
        amdvlk
        rocmPackages.clr.icd
      ];
    };
  };

  services.xserver.videoDrivers = ["amdgpu"];

  boot = {
    initrd.availableKernelModules = ["nvme" "xhci_pci" "usb_storage" "sd_mod"];
    initrd.kernelModules = ["amdgpu"];
    kernelModules = ["kvm-amd"];
    extraModulePackages = [];

    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub.enable = lib.mkForce false;
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
      timeout = 3;
    };
  };

  fileSystems."/" = {
    device = "zroot/root";
    fsType = "zfs";
  };

  fileSystems."/home" = {
    device = "zroot/home";
    fsType = "zfs";
  };

  fileSystems."/home/mm" = {
    device = "zroot/home/mm";
    fsType = "zfs";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/3ACB-5C91";
    fsType = "vfat";
  };

  swapDevices = [
    {
      device = "/dev/disk/by-partlabel/SWAP";
      randomEncryption.enable = true;
    }
  ];
}
