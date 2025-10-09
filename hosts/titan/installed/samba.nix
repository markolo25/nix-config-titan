{
  config,
  lib,
  pkgs,
  ...
}: {
  services.samba = {
    settings = {
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
}
