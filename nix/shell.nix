{ pkgs }:

pkgs.mkShell {
  packages = [ pkgs.mdbook ];
}
