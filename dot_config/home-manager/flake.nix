{
  description = "Home manager configuration of mm";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;

    lib = nixpkgs.lib // home-manager.lib;

    systems = [
      "x86_64-linux"
      "aarch64-linux"
    ];

    forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});

    pkgsFor = lib.genAttrs systems (system:
      import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      });
  in {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;

    nixosConfigurations = {
      telescreen = lib.nixosSystem {
        system = "x86_64-linux";
      };

      pwnyboy = lib.nixosSystem {
        system = "x86_64-linux";
      };

      nixos = lib.nixosSystem {
        system = "aarch64-linux";
      };
    };

    homeConfigurations = {
      "mm@think" = lib.homeManagerConfiguration {
        modules = [./hosts/telescreen];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
      };

      "mm@telescreen" = lib.homeManagerConfiguration {
        modules = [./hosts/telescreen];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
      };

      "mm@videodrome" = lib.homeManagerConfiguration {
        modules = [./hosts/telescreen];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
      };

      "mm@pwnyboy" = lib.homeManagerConfiguration {
        modules = [./hosts/pwnyboy];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
      };

      "mm@nixos" = lib.homeManagerConfiguration {
        modules = [./hosts/nixos];
        pkgs = pkgsFor.aarch64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
      };
    };
  };
}
