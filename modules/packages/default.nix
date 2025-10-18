{
  config,
  pkgs,
  ...
}: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    screen
    htop
    wget
    curl
    alejandra
    git
    cpufrequtils
    nvme-cli
    ipmitool
    unzip
    nvitop
    pciutils
  ];
}
