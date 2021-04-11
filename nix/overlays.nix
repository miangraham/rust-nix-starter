let
  sources = import ./sources.nix;
  rust-overlay = import sources.fenix;
in
[ rust-overlay ]
