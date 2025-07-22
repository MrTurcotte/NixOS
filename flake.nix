{
  description = "Basic System Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      system = system;
      config = { allowUnfree = true; };
    };
  in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = system;
        modules = [
          ./configuration.nix
        ];
      };
    };
  };
}
