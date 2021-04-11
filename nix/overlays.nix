let
  sources = import ./sources.nix;
  moz-overlay = import sources.nixpkgs-mozilla;
  rust-overlay = import ./rust-overlay.nix;
in
[ moz-overlay rust-overlay ]
