{
  description = "Optimized NixOS System Flake for Ryzen 7700";

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
      valhalla = nixpkgs.lib.nixosSystem {
        system = system;

        modules = [
          ./configuration.nix

          # Inline module for optimizations and ccache
          {
            # CPU optimizations for locally-built packages
            nixpkgs.config = {
              packageOverrides = pkgs: {
                stdenv = pkgs.stdenv.override {
                  extraBuildFlags = "-O3 -march=native -mtune=native -flto -fomit-frame-pointer";
                };
              };
            };

            # ccache configuration
            nix.settings = {
              use-ccache = true;
              cores = 8;       # Adjust to leave system responsive
              max-jobs = 4;    # Adjust to avoid RAM saturation
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

