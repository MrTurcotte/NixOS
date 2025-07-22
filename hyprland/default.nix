{ config, pkgs, ... }:

{
  programs.hyprland.enable = true;
  services.hypridle.enable = true;
  environment.systemPackages = with pkgs; [
    hyprlock
    hyprpanel
    hyprnotify
    hyprland-protocols
    xdg-desktop-portal-hyprland
    networkmanagerapplet
    hyprpolkitagent
    wofi
    swww
    sxiv
    hyprshot
    waybar
    blueberry
    pavucontrol
  ];
}
