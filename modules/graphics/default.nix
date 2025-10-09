{
  pkgs,
  lib,
  config,
  ...
}: {
  # Import all submodules
  imports = [
    ./nvidia.nix
  ];
  
  graphics.nvidia.enable =
    lib.mkDefault false;
}