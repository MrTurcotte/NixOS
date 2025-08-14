{ pkgs, ... }:

{
  nixpkgs.config.cudaSupport = true;

  hardware.keyboard.qmk.enable = true;

  services.flatpak.enable = true;
  services.udev.packages = [
    pkgs.android-udev-rules
    pkgs.via
  ];
  services.hardware.openrgb.enable = true;

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.adb.enable = true;
  programs.gamemode.enable = true;
  programs.obs-studio.enable = true;
  programs.appimage = {
    enable = true;
    binfmt = true;
    package = [
      (pkgs.appimage-run.override {
        extraPkgs = pkgs: [ 
          pkgs.ffmpeg 
          pkgs.imagemagick 
          pkgs.libidn2
          pkgs.libepoxy 
        ];
      });
    ];
  };

  environment.systemPackages = with pkgs; [
#    libidn2
#    appimage-run
#    digikam
    bc
    ghostscript
    pdfsandwich
    kdePackages.skanlite
    nh
    python3
    neovim
    via
    gparted
#    lynx
    geany
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
    sxiv
    mpv
    vlc
  ];
}
