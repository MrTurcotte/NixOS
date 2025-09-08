{
  description = "Optimized NixOS System Flake for Ryzen 7700";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";

    # Import nixpkgs and override stdenv for CPU optimizations
    pkgs = import nixpkgs {
      system = system;
      config = {
        allowUnfree = true;

        packageOverrides = pkgs: {
          stdenv = pkgs.stdenv.overrideAttrs (old: {
            CFLAGS = old.CFLAGS + " -O3 -march=native -mtune=native -flto -fomit-frame-pointer";
            CXXFLAGS = old.CXXFLAGS + " -O3 -march=native -mtune=native -flto -fomit-frame-pointer";
          });
        };
      };
    };
  in {
    nixosConfigurations = {
      valhalla = pkgs.lib.nixosSystem {
        system = system;
        modules = [
          ./configuration.nix

          # Inline module for Nix settings and environment variables
          {
            nix.settings = {
              use-ccache = true;
              cores = 8;       # Limit CPU usage for background builds
              max-jobs = 4;    # Limit parallel jobs to avoid RAM saturation
            };

            environment.variables = {
              CCACHE_DIR = "/var/cache/ccache";
              CCACHE_MAXSIZE = "10G";
            };
          }
        ];
      };
    };
  };
}

