self: super:
  { rustc = (super.rustChannelOf {
      channel = "nightly";
      date = "2021-03-25";
      sha256 = "0pd74f1wc5mf8psrq3mr3xdzwynqil7wizaqq8s7kqfgxx4c4l7w";
    }).rust.override {
      extensions = [ "rust-src" ];
    };
  }
