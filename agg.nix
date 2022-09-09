# Example at https://lantian.pub/en/article/modify-computer/nixos-packaging.lantian/
{ lib
, stdenv
, fetchFromGitHub
, pkgs
, ...
} @ args:

pkgs.rustPlatform.buildRustPackage rec {
  pname = "agg";
  version = "v1.2.0";

  src = fetchFromGitHub {
    owner = "asciinema";
    repo = pname;
    rev = version;
    sha256 = "sha256-/GVvpsxc0pa3Z+cz36seFxOGBEp9/8scGUZT17yYgdU=";
  };

  cargoSha256 = "sha256-nheN/usq/ai1iqBBhQly1rx0qhj7oOjdUeiVHTzAg2I=";

  buildInputs = (
     lib.optionals stdenv.isDarwin [
       pkgs.darwin.apple_sdk.frameworks.Security
     ]
  );

  meta = with lib; {
    description = "agg is a command-line tool for generating animated GIF files from asciicast v2 files produced by asciinema terminal recorder.";
    homepage = "https://github.com/asciinema/agg";
    license = licenses.asl20;
  };
}
