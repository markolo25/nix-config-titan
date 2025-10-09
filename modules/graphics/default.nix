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
}
