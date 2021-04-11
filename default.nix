let
  sources = import ./nix/sources.nix;
  overlays = import ./nix/overlays.nix;
  pkgs = import sources.nixpkgs {
    inherit overlays;
  };
  rust = pkgs.rust-nightly.complete;
  naersk = (pkgs.callPackage sources.naersk {}).override {
    inherit (rust) rustc cargo;
  };
in
naersk.buildPackage {
  root = ./.;
}
