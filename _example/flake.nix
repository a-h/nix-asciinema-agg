{
  inputs = {
    agg.url = github:a-h/nix-asciinema-agg;
    # For local development, use this instead.
    #agg.url = "path:../";
  };

  outputs = { self, nixpkgs, agg, ... }:
  let
      pkgs = import nixpkgs {
        system = "aarch64-darwin";
      };
  in
  {
    # Access this by `nix shell`
    defaultPackage.aarch64-darwin = agg.outputs.packages.aarch64-darwin.agg;
    # Access this via `nix develop`
    devShell.aarch64-darwin = pkgs.mkShell {
      packages = [
        agg.outputs.packages.aarch64-darwin.agg
        pkgs.cowsay
      ];
    };
  };
}
