{
  outputs = { self, nixpkgs }:
    let 
      pkgs = import nixpkgs {
        system = "aarch64-darwin";
      };
      agg = pkgs.callPackage ./agg.nix {};
    in
    {
      packages.aarch64-darwin.default = agg;
      packages.aarch64-darwin.agg = agg;
    };
}
