{
  pkgs,
  lib,
  ...
}: {
  programs.fish.enable = true;

  users.users.mm = {
    isNormalUser = true;
    uid = lib.mkForce 1001;
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    initialHashedPassword = "$y$j9T$xgIkUu0jxDn.E27xw3HIP0$AxOebMJ322FjxN2ncCvz8g0HWhdn3Om.d9HyWyV35K0";
    openssh.authorizedKeys.keys = let
      authorizedKeys = pkgs.fetchurl {
        url = "https://github.com/ModestMeowth.keys";
        sha256 = "ffa4f4debd8b935f187d8f5217d1ad5c04c923edb1de9683d5227f3f7588a935";
      };
    in
      pkgs.lib.splitString "\n" (builtins.readFile authorizedKeys);
  };
  age.secrets.postgres_pass.file = /home/mm/secrets/postgres_pass.age;
}
