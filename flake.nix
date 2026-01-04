{
  description = "Home Manager configuration of hedwig";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgsStable.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";

    };
    hyprlauncher.url = "github:hyprwm/hyprlauncher";
    hyprtoolkit.url = "github:hyprwm/hyprtoolkit";
            



    
  };

  outputs =
    { nixpkgs, nixpkgsStable, home-manager, ... } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgsStable = nixpkgsStable.legacyPackages.${system};
    in
    {
    

      nixosConfigurations.flutterLap = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs pkgsStable; };
        modules = [
          ./configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };

    };
}
