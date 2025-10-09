{ config, lib, pkgs, ... }:
{
  users.users.markolo25 = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "libvirtd" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [ firefox tree ];
  };
}