with import <nixpkgs> {};
let
  agg = callPackage ./agg.nix {};
in
stdenv.mkDerivation rec {
  name = "agg-shell";
  buildInputs = [ agg ];
}
