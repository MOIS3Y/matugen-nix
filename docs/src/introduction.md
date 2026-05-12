# Introduction

**matugen-nix** is a NixOS and Home Manager module designed to bridge the gap
between dynamic color generation and Nix configuration.

By leveraging [matugen](https://github.com/InioX/matugen), this project allows
you to generate complete, harmonious color palettes based on your wallpaper or
a seed color, and use them directly in your Nix code as standard attribute sets.

## Key Concepts

- **[Import From Derivation (IFD)](
  https://nix.dev/manual/nix/2.23/language/import-from-derivation)**: The
  module runs `matugen` during the evaluation of your Nix configuration. This
  means your colors are available as strings (e.g., `#ff0000`) at evaluation
  time, making them compatible with all Home Manager and NixOS options.
- **Pure Flakes Support**: Despite using IFD, the module remains "pure" as long
  as your assets (wallpapers) are part of your flake's git tree.
- **Clean Separation**: Generated colors and your custom/static color
  definitions are kept in separate namespaces to prevent conflicts.
