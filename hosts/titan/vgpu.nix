{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  hardware.nvidia.vgpu = {
    patcher = {
      enable = true;
      options.doNotForceGPLLicense = false;
      copyVGPUProfiles = {"1C02:0000" = "1B38:0";};
      # profileOverrides = {
      #   "156" = {
      #     vramAllocation = 2048;
      #     heads = 1;
      #     display.width = 1920;
      #     display.height = 1080;
      #   };
      # };
    };
  };
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.vgpu_18_0;
  hardware.nvidia.gsp.enable = false;
  programs.mdevctl = {
    enable = true;
  };
}
