{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.printing.enable = true;
  services.printing.browsed.enable = true;

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services.printing.drivers = [
#    pkgs.brlaser
    pkgs.brgenml1lpr
    pkgs.brgenml1cupswrapper
    pkgs.cups-brother-hl3170cdw
  ];

}
