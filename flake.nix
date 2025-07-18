{
  description = "A very lightweight system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    #determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
    # Determinate Nix unaccsessable in Russia :(
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: 

    let
      system = "x86_64-linux";
    in {
      # workstation is your hostname
      nixosConfigurations.workstation = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs system;
        };
        modules = [
          ./systems/workstation/configuration.nix
          inputs.stylix.nixosModules.stylix
          #determinate.nixosModules.default
        ];
      };

      homeConfigurations.itzkodee = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [
          ./home/itzkodee/home.nix
          inputs.stylix.homeModules.stylix
        ];
      };

  };
}
