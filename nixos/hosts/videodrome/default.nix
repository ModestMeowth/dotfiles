{
  imports = [
    ./hardware.nix
    ../../modules/wsl.nix
  ];

  wsl.wslConf = {
    network = {
      hostname = "videodrome";
      generateHosts = false;
      generateResolvConf = false;
    };
    user.default = "mm";
  };

  networking = {
    nameservers = [
      "100.100.100.100"
    ];
    search = [
      "cat-alkaline.ts.net"
    ];
  };
}
