{
  inputs = {
    agg.url = github:a-h/nix-asciinema-agg;
    # For local development, use this instead.
    #agg.url = "path:../";
    flake-utils.url = "github:numtide/flake-utils";
    flake-utils.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, agg, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
          pkgs = import nixpkgs {
            system = system;
          };
      in
      {
        # Access this by `nix shell`
        defaultPackage = agg.outputs.packages.${system};
        # Access this via `nix develop`
        devShell = pkgs.mkShell {
          packages = [
            agg.outputs.packages.${system}
            pkgs.cowsay
          ];
        };
      }
    );
}
