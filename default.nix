let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs {};
  cargo_nix = pkgs.callPackage ./Cargo.nix { inherit pkgs; };
in
cargo_nix.rootCrate.build
