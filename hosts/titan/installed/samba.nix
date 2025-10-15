{
  config,
  lib,
  pkgs,
  ...
}: {
  services.samba = {
    settings = {
      "amanda" = {
        "path" = "/mnt/athena/amanda";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0644";
        "directory mask" = "0755";
        "valid users" = "amanda";
        "force user" = "amanda";
        "force group" = "users";
      };
      "markolo25" = {
        "path" = "/mnt/athena/mark";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0644";
        "directory mask" = "0755";
        "valid users" = "markolo25";
        "force user" = "markolo25";
        "force group" = "users";
      };
      "pwmanager" = {
        "path" = "/mnt/hermes/pwmanager";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0644";
        "directory mask" = "0755";
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
