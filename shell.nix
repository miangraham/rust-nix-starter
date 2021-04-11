let
  sources = import ./nix/sources.nix;
  overlays = import ./nix/overlays.nix;
  pkgs = import sources.nixpkgs {
    inherit overlays;
  };
in
pkgs.mkShell {
  buildInputs =
    builtins.attrValues {
      rust = pkgs.rustc;

      inherit (pkgs)
        cargo-edit
        cargo-license
        cargo-outdated
        cargo-release
      ;
    };
}
