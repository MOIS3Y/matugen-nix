# Installation

To use **matugen-nix**, add it to your `flake.nix` inputs.

## Adding the Input

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    matugen-nix = {
      url = "github:MOIS3Y/matugen-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, matugen-nix, ... }: {
    # NixOS
    nixosConfigurations.your-host = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        matugen-nix.nixosModules.default
        ./configuration.nix
      ];
    };

    # Home Manager
    homeConfigurations."user" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        matugen-nix.homeManagerModules.default
        ./home.nix
      ];
    };
  };
}
```

## Import from Derivation (IFD)

This module uses IFD to run `matugen` at evaluation time. In most modern Flake setups, this works out of the box. However, if you encounter issues, ensure that your Nix command has access to IFD (usually enabled by default).

> [!NOTE]
> For the best experience, ensure your wallpaper files are tracked by Git
> within your repository. This maintains the "purity" of the Flake evaluation.
