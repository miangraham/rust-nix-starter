let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs {};
in
pkgs.mkShell {
  buildInputs =
    builtins.attrValues {
      inherit (pkgs)
        # Standard rust tools
        rustc
        cargo

        # Needed for release build, generates Cargo.nix
        crate2nix

        # Optional dev tools as desired
        cargo-edit
        cargo-license
        cargo-outdated
        cargo-release
        clippy
        rustfmt
        rust-analyzer
      ;
    };
}
