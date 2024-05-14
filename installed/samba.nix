{ config, lib, pkgs, ... }: {

  services.samba = {
    enable = true;
    securityType = "user";
    openFirewall = true;
    extraConfig = ''
      workgroup = WORKGROUP
      server string = titan
      netbios name = titan
      security = user
      use sendfile = yes
      #max protocol = smb2
      # note: localhost is the ipv6 localhost ::1
      #hosts allow = 192.168.0. 127.0.0.1 localhost
      #hosts deny = 0.0.0.0/0
      guest account = nobody
      map to guest = bad user
    '';
    shares = {
      Amanda = {
        path = /mnt/athena/Amanda;
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0644";
        "directory mask" = "0755";
        "valid users" = "amanda";
      };
      Mark = {
        path = /mnt/athena/Mark;
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0644";
        "directory mask" = "0755";
        "valid users" = "markolo25";
      };
      pwmanager = {
        path = /mnt/athena/pwmanager;
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0644";
        "directory mask" = "0755";
        "valid users" = "markolo25";
      };
      torrentclient = {
        path = /mnt/athena/torrentclient;
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "yes";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "username";
        "force group" = "groupname";
      };
      Downloads = {
        path = /mnt/athena/Downloads;
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "yes";
      };
      Share = {
        path = /mnt/athena/Share;
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "yes";
      };
      Video = {
        path = /mnt/athena/Share;
        browseable = "yes";
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
