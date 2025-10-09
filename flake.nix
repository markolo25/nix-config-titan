{
  description = "davidnuon's NixOS configuration";
  inputs = {
    #nixos general hw
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    #nvidia encoder/decoder limit patch
    nvidia-patch.url = "github:icewind1991/nvidia-patch-nixos";
    nvidia-patch.inputs.nixpkgs.follows = "nixpkgs";

    #vscode-server
    inputs.vscode-server.url = "github:nix-community/nixos-vscode-server";

    home-manager-2505.url =
      "https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz";
    nixpkgs-2505.url = "github:NixOS/nixpkgs/nixos-25.05";

    flake-compat.url = "https://flakehub.com/f/edolstra/flake-compat/1.tar.gz";
  };

  outputs = inputs@{ self, nixpkgs, ... }: {
    devShells."x86_64-linux".default =
      let pkgs = import inputs.nixpkgs-2311 { system = "x86_64-linux"; };
      in pkgs.mkShell {
        NIX_CONFIG = "extra-experimental-features = nix-command";
        nativeBuildInputs = with pkgs; [
          screen
          htop
          wget
          curl
          nixfmt-classic
          git
          cpufrequtils
          nvme-cli
          ipmitool
        ];
      };

    nixosConfigurations = {
      titan = inputs.nixpkgs-2211.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;
        modules = [
          ./hosts/titan

          (import "${inputs.home-manager-2505}/nixos")
          (import ./modules/users/markolo25.nix { stateVersion = "25.05"; })
          (import ./modules/users/amanda.nix { stateVersion = "25.05"; })

          ./mixins/base
          ./mixins/tailscale
          ./mixins/flatpak
          ./mixins/virtualization
        ];
      };
    };
  };
}
