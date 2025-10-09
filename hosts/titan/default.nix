{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  imports = [./configuration.nix];

  graphics.nvidia.enable = true;
}
