let
  sources = import ./sources.nix;
  moz-overlay = import sources.nixpkgs-mozilla;
  rust-overlay = self: super:
    let channel = (super.rustChannelOf {
          channel = "1.51.0";
        });
    in
      {
        rustc = channel.rust;
        inherit (channel) cargo;
      };
in
[ moz-overlay rust-overlay ]
