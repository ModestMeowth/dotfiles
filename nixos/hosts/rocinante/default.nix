{
  config,
  lib,
  modulesPath,
  pkgs,
  ...
}: {
  networking.hostName = "rocinante";

  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./disks.nix
    ./../../modules
    ./../../modules/secureboot.nix
    ./../../modules/gpu.nix
    ./../../modules/pipewire.nix
    ./../../modules/ssh.nix
    ./../../modules/gnome.nix
  ];

  services = {
    fwupd.enable = true;
  };

  environment.systemPackages = with pkgs; [
    firefox
    dig
    nmap
  ];

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
    initrd.availableKernelModules = [
      "nvme"
      "xhci_pci"
      "usb_storage"
      "sd_mod"
    ];
    initrd.kernelModules = ["amdgpu"];
    kernelModules = [
      "acpi_call"
      "kvm-amd"
    ];
    extraModulePackages =
      [
      ]
      ++ (with config.boot.kernelPackages; [
        acpi_call
      ]);

    kernelParams = [
      "quiet"
    ];
    consoleLogLevel = 0;

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
}
