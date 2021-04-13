let
  sources = import ./nix/sources.nix;
  overlays = import ./nix/overlays.nix;
  pkgs = import sources.nixpkgs {
    inherit overlays;
  };
  rust = pkgs.rust-nightly.complete;
in
pkgs.mkShell {
  buildInputs =
    builtins.attrValues {
      inherit (rust)
        rustc
        cargo
        clippy-preview
        rustfmt-preview
      ;

      inherit (pkgs)
        cargo-edit
        cargo-license
        cargo-outdated
        cargo-release

        # rust-analyzer-nightly builds from source.
        # This adds ~8m to CI nix-shell usage so leaving it out, but this is how you pull it in.
        # rust-analyer-nightly
      ;
    };
}
