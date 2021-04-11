let
  sources = import ./nix/sources.nix;
  overlays = import ./nix/overlays.nix;
  pkgs = import sources.nixpkgs {
    inherit overlays;
  };
  rust = pkgs.rust-nightly.complete.withComponents [
    "cargo"
    "clippy-preview"
    "rust-src"
    "rust-std"
    "rustc"
    "rustfmt-preview"
  ];
  rust-analyzer = pkgs.rust-analyzer-nightly;
in
pkgs.mkShell {
  buildInputs =
    builtins.attrValues {
      inherit rust;
      inherit rust-analyzer;

      inherit (pkgs)
        cargo-edit
        cargo-license
        cargo-outdated
        cargo-release
      ;
    };
}
