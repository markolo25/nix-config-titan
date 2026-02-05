# Where 'inputs' is the inputs attribute of your flake
{ inputs, ... }: {
    imports = [ inputs.jnsgruk.nixosModules.scrutiny ];
    nixpkgs.overlays = [ inputs.jnsgruk.overlays.additions ];
    services.scrutiny.enable = true;
}
