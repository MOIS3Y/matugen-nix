{
  description = "A NixOS and Home Manager module for matugen color generation";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in
    {
      nixosModules.default = import ./nix/module.nix;
      nixosModules.matugen = self.nixosModules.default;

      homeManagerModules.default = import ./nix/module.nix;
      homeManagerModules.matugen = self.homeManagerModules.default;

      checks = forAllSystems (
        system:
        import ./nix/checks.nix {
          pkgs = nixpkgs.legacyPackages.${system};
          lib = nixpkgs.lib;
          module = ./nix/module.nix;
        }
      );

      devShells = forAllSystems (system: {
        default = import ./nix/shell.nix {
          pkgs = nixpkgs.legacyPackages.${system};
        };
      });
    };
}
