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

    dotfiles = {
      url = "github:ModestMeowth/dotfiles";
      flake = false;
    };

    dracula-sublime = {
      url = "github:dracula/sublime";
      flake = false;
    };

    dracula-zellij = {
      url = "github:dracula/zellij";
      flake = false;
    };

    dracula-wezterm = {
      url = "github:dracula/wezterm";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    homeConfig = system: hostname: username: let
      inherit (self) outputs;
      overlays = {
        agenix = inputs.agenix.overlays.default;
      };
      specialArgs = inputs // {inherit system hostname overlays inputs outputs;};
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
