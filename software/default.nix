{ pkgs, ... }:

{
  nixpkgs.config.cudaSupport = true;

  services.flatpak.enable = true;
  services.udev.packages = [
    pkgs.android-udev-rules
  ];
  services.hardware.openrgb.enable = true;
  

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.adb.enable = true;
  programs.gamemode.enable = true;
  programs.obs-studio.enable = true;

  environment.systemPackages = with pkgs; [
    cura-appimage
    spotify
    openscad
    htop
    pciutils
    openrgb-with-all-plugins
    wget
    unzip
    xdotool
    xorg.xwininfo
    yad    
    steamtinkerlaunch
    protonup-qt
    protontricks
    gimp3-with-plugins
    evince
    git
    android-studio
    vim
    fastfetch
    kitty
    lutris
    wineWowPackages.stable
    wine
    (wine.override { wineBuild = "wine64"; })
    wine64
    wineWowPackages.staging
    winetricks
    wineWowPackages.waylandFull  
    google-chrome
  ];
}
