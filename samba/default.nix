{
  config,
  pkgs,
  lib,
  ...
}:

{

  services.samba = {
    enable = true;
    securityType = "user";
    openFirewall = true;
    settings = {
      global = {
        "workgroup" = "WORKGROUP";
        "server string" = "smbnix";
        "netbios name" = "smbnix";
        "security" = "user";
        #"use sendfile" = "yes";
        #"max protocol" = "smb2";
        # note: localhost is the ipv6 localhost ::1
        "hosts allow" = "192.168.2.0/24 127.0.0.1/32 localhost";
        "hosts deny" = "0.0.0.0/0";
        "guest account" = "nobody";
        "map to guest" = "bad user";
      };
      #    "public" = {
      #      "path" = "/mnt/Shares/Public";
      #      "browseable" = "yes";
      #      "read only" = "no";
      #      "guest ok" = "yes";
      #      "create mask" = "0644";
      #      "directory mask" = "0755";
      #      "force user" = "username";
      #      "force group" = "groupname";
      #    };
      "private" = {
        "path" = "/home/dave/Share";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "dave";
        "force group" = "users";
      };
    };
  };

  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };

  networking.firewall.enable = true;
  networking.firewall.allowPing = true;

}
