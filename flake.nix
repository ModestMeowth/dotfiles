{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko";
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

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixdb = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sshKeysMM = {
      url = "https://github.com/ModestMeowth.keys";
      flake = false;
    };
  };

  outputs = {
    nixpkgs,
    nixdb,
    ...
  } @ inputs: let
    genPkgs = system: overlays:
      import nixpkgs {
        inherit system overlays;
        config.allowUnfree = true;
      };
    nixosSystem = system: hostname: username: let
      overlays = [
        inputs.agenix.overlays.default
      ];
      pkgs = genPkgs system overlays;
    in
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs pkgs system;};
        modules = [
          inputs.agenix.nixosModules.default
          inputs.nixdb.nixosModules.nix-index
          ./nixos/hosts/${hostname}
          ./nixos/users/${username}
        ];
      };
  in {
    formatter = {
      x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
      aarch64-linux = nixpkgs.legacyPackages.aarch64-linux.alejandra;
    };

    nixosConfigurations = {
      rocinante = nixosSystem "x86_64-linux" "rocinante" "mm";
      videodrome = nixosSystem "x86_64-linux" "videodrome" "mm";
    };
  };
}
