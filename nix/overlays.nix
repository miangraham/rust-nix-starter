let
  sources = import ./sources.nix;
  moz-overlay = import sources.nixpkgs-mozilla;
  rust-overlay = self: super:
    let channel = (super.rustChannelOf {
          channel = "1.48.0";
          # channel = "1.51.0";
          # sha256 = "14qhjdqr2b4z7aasrcn6kxzj3l7fygx4mpa5d4s5d56l62sllhgq";
        });
    in
      {
        rustc = channel.rust;
        inherit (channel) cargo;
      };
in
[ moz-overlay rust-overlay ]
