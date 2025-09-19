{ config, pkgs, ... }:
{
  virtualisation.docker.enable = true;

  virtualisation.oci-containers = {
    backend = "docker";
    containers = {
      stirling = {
        image = "stirlingtools/stirling-pdf:latest-fat";
        ports = [ "8080:8080" ];
        cmd = [
        ];
        autoStart = true;
      };
    };
  };
}
