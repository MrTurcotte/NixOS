{pkg, config, lib, ...}:

{
  boot.loader.systemd-boot.configurationLimit = 3;
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };
}
