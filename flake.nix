{
  description = "davidnuon's NixOS configuration";
  inputs = {
    #nixos general hw
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    #nvidia encoder/decoder limit patch
    nvidia-patch = {
      url = "github:icewind1991/nvidia-patch-nixos/";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #vscode-server
    vscode-server.url = "github:nix-community/nixos-vscode-server";

    home-manager-2505.url = "https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz";
    nixpkgs-2505.url = "github:NixOS/nixpkgs/nixos-25.05";

    flake-compat.url = "https://flakehub.com/f/edolstra/flake-compat/1.tar.gz";

    nixos-nvidia-vgpu = {
      url = "github:Yeshey/nixos-nvidia-vgpu/535.129";

      # comment this line and a specific older revision
      # of nixpkgs known to work will be used
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixos-hardware,
    nixpkgs,
    vscode-server,
    nvidia-patch,
    nixos-nvidia-vgpu,
    ...
  }: {
    devShells."x86_64-linux".default = let
      pkgs = import inputs.nixpkgs-2505 {system = "x86_64-linux";};
    in
      pkgs.mkShell {
        NIX_CONFIG = "extra-experimental-features = nix-command";
        nativeBuildInputs = with pkgs; [
          screen
          htop
          wget
          curl
          nixfmt-classic
          git
          cpufrequtils
          gnumake
          nvme-cli
          ipmitool
        ];
      };

    nixosConfigurations = {
      titan = inputs.nixpkgs-2505.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          vscode-server.nixosModules.default
          (import ./modules/users/markolo25.nix)
          (import ./modules/users/amanda.nix)
          ./modules/users/containerUser
          ./modules/graphics
          ./modules/services/nfs
          ./modules/services/samba
          ./modules/services/docker
          ./modules/services/vscode-server
          ./modules/services/libvrtd
          ./modules/packages
          ./hosts/titan
          nixos-hardware.nixosModules.common-cpu-amd
          nixos-hardware.nixosModules.common-cpu-pstate
          nixos-hardware.nixosModules.common-cpu-zenpower
          nixos-nvidia-vgpu.nixosModules.default
          {
            hardware.nvidia.vgpu = {
              enable = true; # Install NVIDIA KVM vGPU + GRID driver + Activates required systemd services
              vgpu_driver_src.sha256 = "sha256-tFgDf7ZSIZRkvImO+9YglrLimGJMZ/fz25gjUT0TfDo=";
              pinKernel = false; # pins and installs a specific version of the 6.1 Kernel, recommended only if experiencing problems
              fastapi-dls = {
                # License server for unrestricted use of the vgpu driver in guests
                enable = true;
                #local_ipv4 = "192.168.1.109"; # Hostname is autodetected, use this setting to override
                #timezone = "Europe/Lisbon"; # detected automatically (needs to be the same as the tz in the VM)
                #docker-directory = "/mnt/dockers"; # default is "/opt/docker"
              };
            };
          }
        ];
      };
    };
  };
}
