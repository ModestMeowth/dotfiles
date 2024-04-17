{
  disko.devices = {
    disk = {
      nvme0n1 = {
        device = "/dev/disk/by-id/nvme-eui.00000000000000000026b7785953def5";
        type = "disk";
        content = {
          type = "gpt";

          partitions = {
            ESP = {
              type = "EF00";
              size = "512M";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };

            SWAP = {
              type = "8200";
              size = "512M";
              content = {
                type = "swap";
                randomEncryption = true;
              };
            };

            ROOT = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "zroot";
              };
            };
          };
        };
      };
    };

    zpool = {
      zroot = {
        type = "zpool";
        rootFSOptions = {
          compression = "zstd";
          ashift = 12;
          acltype = "posixacl";
          autotrim = true;
          canmount = "off";
          dnodesize = "auto";
          normalization = "formD";
          relatime = "on";
          xattr = "sa";
          mountpoint = "none";
          "com.sun:auto-snapshot" = "false";
        };

        datasets = {
          "root" = {
            type = "zfs_fs";
            options.mountpoint = "/";
          };

          "home" = {
            type = "zfs_fs";
            options.mountpoint = "/home";
          };

          "home/mm" = {
            type = "zfs_fs";
            options.mountpoint = "/home/mm";
          };
        };
      };
    };
  };
}
