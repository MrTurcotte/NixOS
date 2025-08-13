 { config, pkgs, ... }:
 {
    virtualisation.docker.enable = true;

    virtualisation.oci-containers = {
      backend = "docker";
      containers = {
        stirling = {
          image = "frooodle/s-pdf:latest";
          ports = ["8080:8080"];
          cmd = [
          ];
          autoStart = false;
        };
      };
    };
 }
