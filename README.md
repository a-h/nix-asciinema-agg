# Flake for agg

# Running - locally

If you've downloaded this code, you can run this by using `nix shell` in the current directory.

```sh
nix shell
```

# Running - remotely

If you haven't got the flake on disk, you can use it remotely like this.

```
nix shell github:a-h/nix-asciinema-agg
```

# Using the flake

If you want to use this flake, but add your own stuff to the shell, you can create your own flake that imports this one.

See `_example/flake.nix`.

```nix
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
```
