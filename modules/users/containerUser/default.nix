{
  config,
  lib,
  pkgs,
  ...
}: {
  users.users.containerUser = {
    isNormalUser = true;
    extraGroups = ["docker" "libvirtd"];
    uid = 1000;
  };
}
