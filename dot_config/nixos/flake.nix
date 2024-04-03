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
  };

  outputs = {
    nixpkgs,
    nix-db,
    lanzaboote,
    ...
  }: let
    genPkgs = system:
      import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    nixosSystem = system: hostname: username: let
      pkgs = genPkgs system;
    in
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit pkgs;};
        modules = [
          lanzaboote.nixosModules.lanzaboote
          nix-db.nixosModules.nix-index
          ./hosts/${hostname}
          ./users/${username}
        ];
      };
  in {
    formatter = {
      x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
    };

    nixosConfigurations = {
      think = nixosSystem "x86_64-linux" "think" "mm";
    };
  };
}
