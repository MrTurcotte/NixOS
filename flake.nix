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
      {
        # CPU optimizations for local builds
        nixpkgs.config = {
          packageOverrides = pkgs: {
            stdenv = pkgs.stdenv.override {
              extraBuildFlags = "-O3 -march=native -mtune=native -flto -fomit-frame-pointer";
            };
          };
        };

        # ccache
        nix.settings = {
          use-ccache = true;
          cores = 8;
          max-jobs = 4;
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
