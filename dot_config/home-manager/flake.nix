{
  description = "Home manager configuration of mm";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    homeConfig = system: hostname: username: let
      overlays = {
        agenix = inputs.agenix.overlays.default;
      };
      specialArgs = inputs // {inherit system hostname overlays;};
    in
      home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          overlays = builtins.attrValues overlays;
          system = "${system}";
        };
        modules = [
          inputs.agenix.homeManagerModules.age
          ./hosts/${hostname}/${username}.nix
        ];
        extraSpecialArgs = specialArgs;
      };
  in {
    formatter = {
      x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
      aarch64-linux = nixpkgs.legacyPackages.aarch64-linux.alejandra;
    };

    homeConfigurations = {
      "mm@rocinante" = homeConfig "x86_64-linux" "rocinante" "mm";
      "mm@videodrome" = homeConfig "x86_64-linux" "videodrome" "mm";
      "mm@pwnyboy" = homeConfig "x86_64-linux" "pwnyboy" "mm";
    };
  };
}
