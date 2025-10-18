{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  imports = [
    ./configuration.nix
    ./vgpu.nix
  ];
}
