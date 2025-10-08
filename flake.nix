{
  description = "Basic System Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
#    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        system = system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations = {
        valhalla = nixpkgs.lib.nixosSystem {
          system = system;
          modules = [
            ./configuration.nix
          ];
        };
      };
    };
}
