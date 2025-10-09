{ config, lib, pkgs, ... }:
{
    users.users.amanda = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "libvirtd" ];
    packages = with pkgs; [ firefox tree ];
  };

}