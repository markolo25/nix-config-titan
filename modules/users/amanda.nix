{
  config,
  lib,
  pkgs,
  ...
}: {
  users.users.amanda = {
    isNormalUser = true;
    extraGroups = ["wheel" "docker" "libvirtd" "samba_users"];
    packages = with pkgs; [firefox tree];
  };
}
