{
  config,
  lib,
  pkgs,
  ...
}: {
  users.users.containerUser = {
    isNormalUser = true;
    extraGroups = ["wheel" "docker" "libvirtd" "samba_users"];
    packages = with pkgs; [firefox tree];
  };
}
