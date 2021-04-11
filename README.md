# rust+nix starter

Basic project template for Rust development using nix.

All dependencies, including the Rust toolchain itself, are pinned for reproducibility. Development workflow uses cargo and associated tools. The release build is just a nix package.

## Prerequisites

All you need is a working [nix installation](https://nixos.org/guides/install-nix.html).

```console
$ nix --version
nix (Nix) 2.3.10
```

## Dev build

From within `nix-shell`, use `cargo` and friends as normal. For smoother entry see also: [direnv](https://nixos.wiki/wiki/Development_environment_with_nix-shell) and [lorri](https://github.com/target/lorri).

```console
$ nix-shell --pure
$ cargo build
   Compiling proc-macro2 v1.0.26
...
   Compiling rust-nix-starter v0.1.0 (/home/foo/rust-nix-starter)
    Finished dev [unoptimized + debuginfo] target(s) in 5.36s

$ cargo run
    Finished dev [unoptimized + debuginfo] target(s) in 0.00s
     Running `target/debug/rust-nix-starter`
Hello, world!
```

## Release build

Use `nix build`.

```console
$ nix build
[1 built, 0.0 MiB DL]

$ ls -l
...
lrwxrwxrwx   66 foo foo 11 Apr 21:11 -- result -> /nix/store/vp6mjkhbm9rybls8lnysndbca6k1xk35-rust-nix-starter-0.1.0
...

$ ./result/bin/rust-nix-starter
Hello, world!
```

## Reproducibility

Crate dependencies use [Cargo.lock](./Cargo.lock) as normal.

Rust toolchain versions are pinned by [./nix/rust-overlay.nix](./nix/rust-overlay.nix).

Other nix packages are version pinned by niv in [./nix/sources.json](./nix/sources.json).

## Gripes

For nix build support I'm using [naersk](https://github.com/nmattia/naersk) which requires cargo nightly as of the time of writing on 2021-04. See [naersk/issues/100](https://github.com/nmattia/naersk/issues/100) for technical details. It's possible to switch rustc alone to a stable release but cargo can't be moved along with it. I don't love this.

## License: CC0 [![License: CC0-1.0](https://licensebuttons.net/p/zero/1.0/80x15.png)](http://creativecommons.org/publicdomain/zero/1.0/)

To the extent possible under law, [M. Ian Graham](https://github.com/miangraham) has waived all copyright and related or neighboring rights to rust-nix-starter. This work is published from: Japan.
