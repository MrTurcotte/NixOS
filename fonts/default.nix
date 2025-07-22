{ config, pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [ 
      font-awesome
      redhat-official-fonts
#      nerd-fonts
      ubuntu_font_family
      liberation_ttf
    # Persian Font
      vazir-fonts
    ];

#  fontconfig = {
#    defaultFonts = {
#      serif = [  "Liberation Serif" "Vazirmatn" ];
#      sansSerif = [ "Ubuntu" "Vazirmatn" ];
#      monospace = [ "Ubuntu Mono" ];
#    };
#  };
  };

}
