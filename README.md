# matugen-nix

> ⚠️ **WORK IN PROGRESS (WIP)**

A NixOS and Home Manager module for dynamic color theme generation using
[matugen](https://github.com/InioX/matugen).

This module uses [Import From Derivation (IFD)](
https://nix.dev/manual/nix/2.23/language/import-from-derivation) to run
`matugen` during configuration evaluation, generating a structured
attribute set of colors for your NixOS or Home Manager configurations.

## Features

- **Dynamic Generation:** Create themes from images or hex colors on the fly.
- **Multiple Variants:** Every attribute contains `default`, `dark`, and
  `light` variants.
- **Custom Data:** Keep your own color sets separate in `theme.custom`.
- **Pure Flakes:** Works in pure mode if assets are within the git tree.
