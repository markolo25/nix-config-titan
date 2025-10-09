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
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    vscode-server,
    nvidia-patch,
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
          ./modules/graphics
          ./modules/services/nfs
          ./modules/services/samba
          ./modules/services/docker
          ./modules/services/vscode-server
          ./modules/packages
          ./hosts/titan
        ];
      };
    };
  };
}
