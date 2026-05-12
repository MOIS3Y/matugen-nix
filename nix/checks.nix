{
  pkgs,
  lib,
  module,
}:

let
  eval = lib.evalModules {
    modules = [
      (pkgs.path + "/nixos/modules/misc/assertions.nix")
      module
      {
        config._module.args = { inherit pkgs; };
        config.matugen = {
          enable = true;
          seedColor = "#ff0000";
        };
      }
    ];
  };
in
{
  module-evaluation = pkgs.writeText "module-eval-test" (builtins.toJSON eval.config.matugen.theme);
}
