{
  description = "Arduino Uno D13 blinker in Rust with Nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = { self, nixpkgs, ... } @ inputs:
    {
      devShells."x86_64-linux".default = let
        overlays = [ inputs.rust-overlay.overlays.default ];
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          inherit overlays;
        };
        avr = with pkgs.pkgsCross.avr.buildPackages; [
          binutils
          gcc
          avrdude
          ravedude
          simavr
        ];
      in pkgs.mkShell {
        name = "arduino_blink_rs_shell";
        buildInputs = avr ++ [
          (pkgs.rust-bin.selectLatestNightlyWith (toolchain: toolchain.default.override {
            extensions = [ "rust-src" ];
          }))
        ];
      };
    };
}
