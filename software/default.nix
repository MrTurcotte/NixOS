{ pkgs, ... }:

{
#  nixpkgs.config.cudaSupport = true;
  nixpkgs.config.nvidia.acceptLicense = true;

#  hardware.keyboard.qmk.enable = true;

  services.flatpak.enable = true;
  services.udev.packages = [
    pkgs.android-udev-rules
    pkgs.via
  ];
  services.hardware.openrgb.enable = true;

#  programs.zoom-us.enable = true;
  programs.nix-required-mounts.presets.nvidia-gpu.enable = true;
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.adb.enable = true;
  programs.gamemode.enable = true;
  programs.ccache.enable = true;
  programs.firefox.enable = true;
#  programs.obs-studio = {
#    enable = true;
#    enableVirtualCamera = true;
#    plugins = with pkgs.obs-studio-plugins; [
#      droidcam-obs
#    ];
#  };
#  programs.appimage = {
#    enable = true;
#    binfmt = true;
#    package = pkgs.appimage-run.override {
#      extraPkgs = pkgs: [ 
#        pkgs.ffmpeg 
#        pkgs.imagemagick 
#        pkgs.libidn2
#        pkgs.libepoxy 
#      ];
#    };
#  };

#  environment.variables = {
#    CUDAToolkit_ROOT = "${pkgs.cudatoolkit}";
#    CUDATOOLKIT_ROOT = "${pkgs.cudatoolkit}";
#  };

  environment.systemPackages = with pkgs; [
#    signal-cli
#    cmake
#    opencv
#    cudaPackages.markForCudatoolkitRootHook
#    cudaPackages.cudatoolkit
#    cudaPackages.cuda_nvcc
#    libidn2
#    appimage-run
#    digikam
nixfmt-rfc-style
    discord-ptb
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
#    cura-appimage
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
