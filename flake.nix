{
  description = "Basic System Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      system = system;
      config = { 
        allowUnfree = true; 
        packageOverrides = self: super: {
          stdenv = super.stdenv.overrideAttrs (oldAttrs: {
            CFLAGS = oldAttrs.CFLAGS + " -O3 -march=native -mtune=native -flto -fomit-frame-pointer";
            CXXFLAGS = oldAttrs.CXXFLAGS + " -O3 -march=native -mtune=native -flto -fomit-frame-pointer";
        });
        };

      };
    };
  in {
    nixosConfigurations = {
      valhalla = nixpkgs.lib.nixosSystem {
        system = system;
        modules = [
          ./configuration.nix
        ];
        pkgs = pkgs;
      };
    };
  };
}
