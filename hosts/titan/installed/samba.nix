{ config, lib, pkgs, ... }: {

  services.samba = {
    enable = true;
    openFirewall = true;
    settings = {
      "global" = {
        "workgroup" = "WORKGROUP";
        "server string" = "titan";
        "netbios name" = "titan";
        "security" = "user";
        "use sendfile" = "yes";
        "#max protocol" = "smb2";
        "#hosts allow" = "192.168.0. 127.0.0.1 localhost";
        "#hosts deny" = "0.0.0.0/0";
        "guest account" = "nobody";
        "map to guest" = "bad user";
      };
      "amanda" = {
        "path" = "/mnt/hermes/amanda";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0644";
        "directory mask" = "0755";
        "valid users" = "amanda";
      };
      "mark" = {
        "path" = "/mnt/athena/mark";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0644";
        "directory mask" = "0755";
        "valid users" = "markolo25";
      };
      "pwmanager" = {
        "path" = "/mnt/hermes/pwmanager";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0644";
        "directory mask" = "0755";
        "valid users" = "markolo25";
      };
      "trunk" = {
        "path" = "/mnt/athena/trunk";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "yes";
      };
      "share" = {
        "path" = "/mnt/athena/share";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "yes";
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
