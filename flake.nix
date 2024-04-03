{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nix-db = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nix-db,
    lanzaboote,
    wsl,
    ...
  }: let
    genPkgs = system:
      import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [(import ./nixos/overlays/systemd-wslfix.nix)];
      };
    nixosSystem = system: hostname: username: let
      pkgs = genPkgs system;
    in
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit pkgs;};
        modules = [
          lanzaboote.nixosModules.lanzaboote
          wsl.nixosModules.wsl
          nix-db.nixosModules.nix-index
          ./nixos/hosts/${hostname}
          ./nixos/users/${username}
        ];
      };
  in {
    formatter = {
      x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
    };

    nixosConfigurations = {
      think = nixosSystem "x86_64-linux" "think" "mm";
      videodrome = nixosSystem "x86_64-linux" "videodrome" "mm";
    };
  };
}