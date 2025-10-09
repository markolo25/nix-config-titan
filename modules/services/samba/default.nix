{
  config,
  lib,
  pkgs,
  ...
}: {
  services.samba = {
    enable = true;
    openFirewall = true;
    settings = {
      "global" = {
        "workgroup" = "WORKGROUP";
        "server string" = "${config.networking.hostName}";
        "netbios name" = "${config.networking.hostName}";
        "security" = "user";
        "use sendfile" = "yes";
        "#max protocol" = "smb2";
        "#hosts allow" = "192.168.0. 127.0.0.1 localhost";
        "#hosts deny" = "0.0.0.0/0";
        "guest account" = "nobody";
        "map to guest" = "bad user";
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
