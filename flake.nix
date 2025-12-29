{

	description = "My flake";


        inputs = {
          nixpkgs = {
            url = "github:NixOS/nixpkgs/nixos-unstable";
           };
            home-manager.url = "github:nix-community/home-manager";
            home-manager.inputs.nixpkgs.follows = "nixpkgs";
            nixpkgsStable.url = "github:nixos/nixpkgs/nixos-25.05";

            hyprlauncher.url = "github:hyprwm/hyprlauncher";
            hyprtoolkit.url = "github:hyprwm/hyprtoolkit";
            
        };
        
        
 

        outputs = { self, nixpkgs, nixpkgsStable, home-manager, ... }@inputs:
          let
            lib = nixpkgs.lib;
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
            pkgsStable = nixpkgsStable.legacyPackages.${system};
            
          in {
          nixosConfigurations.GurkTornet = nixpkgs.lib.nixosSystem {
            specialArgs = { inherit inputs pkgsStable; };
              modules = [
                ./configuration.nix
                inputs.home-manager.nixosModules.default
              ];
            };
            
           # GurkTornet = lib.nixosSystem {
            # inherit system;
            # modules = [ ./configuration.nix ];          
            #};
          };
          #homeConfigurations = {
            #lebonite = home-manager.lib.homeManagerConfiguration {
             # inherit pkgs;
             # extraSpecialArgs = { inherit inputs; };
            #  modules = [ ./home.nix ]; 
           #  };
          #};
             #};


}
