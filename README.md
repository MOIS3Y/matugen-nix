<div align="center">

# matugen-nix

[![NixOS](https://img.shields.io/badge/NixOS-unstable-blue.svg?style=for-the-badge&logo=nixos&logoColor=white&labelColor=1e1e2e&color=89b4fa)](https://nixos.org)
[![Material Design 3](https://img.shields.io/badge/Material-Design_3-blue.svg?style=for-the-badge&logo=materialdesign&logoColor=white&labelColor=1e1e2e&color=cba6f7)](https://m3.material.io)
[![Dynamic Palette](https://img.shields.io/badge/Dynamic-Palette-blue.svg?style=for-the-badge&logo=palette&logoColor=white&labelColor=1e1e2e&color=fab387)](#)
[![Documentation](https://img.shields.io/badge/Documentation-mdBook-blue.svg?style=for-the-badge&logo=bookstack&logoColor=white&labelColor=1e1e2e&color=a6e3a1)](https://mois3y.github.io/matugen-nix/)
[![License](https://img.shields.io/github/license/MOIS3Y/matugen-nix?style=for-the-badge&labelColor=1e1e2e&color=f38ba8)](./LICENSE)

**A NixOS and Home Manager module for seamless Material Design 3 color generation via Matugen.**

</div>

## Overview

**matugen-nix** brings the power of [matugen](https://github.com/InioX/matugen) to your Nix configuration. It allows you to generate harmonious color palettes from wallpapers or seed colors at evaluation time using **Import From Derivation (IFD)**.

The generated colors are available as native Nix attribute sets, making them easy to use across your entire system—from terminal emulators to Wayland compositors.

## Features

- **Material You in Nix**: Full support for Material Design 3 semantic colors.
- **Base16 Compatibility**: Automatically generates Base16 palettes for classic Nix setups.
- **IFD Driven**: Colors are available as strings during evaluation, ensuring compatibility with all Nix options.
- **Hybrid Support**: Mix generated colors with your own custom static palettes.
- **Flake-ready**: Works out of the box with Nix Flakes for both NixOS and Home Manager.

## Quick Start

Add the input to your `flake.nix`:

```nix
{
  inputs.matugen-nix.url = "github:MOIS3Y/matugen-nix";
  
  outputs = { self, matugen-nix, ... }: {
    nixosConfigurations.my-host = nixpkgs.lib.nixosSystem {
      modules = [
        matugen-nix.nixosModules.default
        {
          matugen = {
            enable = true;
            wallpaper = ./background.png;
          };
        }
      ];
    };
  };
}
```

Then use the colors in your configuration:

```nix
{ config, ... }:
let
  inherit (config.matugen.theme.generated) colors;
in {
  programs.kitty.settings.background = colors.background.default;
}
```

> [!NOTE]
> Detailed installation guides, configuration options, and advanced usage examples are available in the **[Documentation](https://mois3y.github.io/matugen-nix/)**.

## Related Projects

- **[Matugen](https://github.com/InioX/matugen)**: The engine behind this module. A fast Material Design 3 color generator.
- **[nix-colors](https://github.com/Misterio77/nix-colors)**: For over two years, this project was a cornerstone of my NixOS configuration, providing an excellent way to handle declarative color schemes. However, since it was archived on **April 24, 2026**, I needed a modern solution. **matugen-nix** is my attempt to go further—combining the declarative simplicity I loved in `nix-colors` with the dynamic power of Material You.

## License

This project is licensed under the [MIT License](./LICENSE).
