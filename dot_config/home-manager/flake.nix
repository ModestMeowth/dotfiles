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
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    homeConfig = system: hostname: username: let
      specialArgs = inputs // {inherit system hostname;};
    in
      home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {system = "${system}";};
        modules = [
          ./hosts/${hostname}/${username}.nix
        ];
        extraSpecialArgs = specialArgs;
      };
  in {
    formatter = {
      x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
      x86_64-darwin = nixpkgs.legacyPackages.x86_64-darwin.alejandra;
      aarch64-linux = nixpkgs.legacyPackages.aarch64-linux.alejandra;
      aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.alejandra;
    };

    homeConfigurations = {
      "mm@rocinante" = homeConfig "x86_64-linux" "rocinante" "mm";
      "mm@videodrome" = homeConfig "x86_64-linux" "videodrome" "mm";
      "mm@pwnyboy" = homeConfig "x86_64-linux" "pwnyboy" "mm";
    };
  };
}
