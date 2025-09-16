{pkg, config, lib, ...}:

{
  boot.loader.systemd-boot.configurationLimit = 3;
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "daily";
    interval = { Hour = 1; Minute = 30; };
    options = "--delete-older-than 7d";
  };
}
