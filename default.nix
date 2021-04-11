let
  sources = import ./nix/sources.nix;
  overlays = import ./nix/overlays.nix;
  pkgs = import sources.nixpkgs {
    inherit overlays;
  };
  naersk = (pkgs.callPackage sources.naersk {}).override {
    rustc = pkgs.rustc;
    cargo = pkgs.rustc;
  };
in
naersk.buildPackage {
  root = ./.;
}
