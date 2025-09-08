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
      valhalla = nixpkgs.lib.nixosSystem {
        system = system;
        modules = [
          ./configuration.nix
        ];
        configuration = {
          # Enable CPU optimizations for locally built packages
          nixpkgs.config = {
            packageOverrides = pkgs: {
              stdenv = pkgs.stdenv.override {
                extraBuildFlags = "-O3 -march=native -mtune=native -flto -fomit-frame-pointer";
              };
            };
          };

          # Enable ccache for local builds
          nix.settings = {
            use-ccache = true;
            cores = 8;       # adjust for background builds
            max-jobs = 4;    # adjust to avoid RAM saturation
          };

          environment.variables = {
            CCACHE_DIR = "/var/cache/ccache";
            CCACHE_MAXSIZE = "20G";
          };
        };
      };
    };
  };
}
