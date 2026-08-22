{
  pkgs,
  lib,
  module,
}:

let
  evalModule =
    matugen:
    lib.evalModules {
      modules = [
        (pkgs.path + "/nixos/modules/misc/assertions.nix")
        module
        {
          config._module.args = { inherit pkgs; };
          config.matugen = matugen;
        }
      ];
    };

  seedColorEval = evalModule {
    enable = true;
    seedColor = "#ff0000";
  };

  ambiguousWallpaper =
    pkgs.runCommand "ambiguous-wallpaper.png"
      {
        nativeBuildInputs = [ pkgs.imagemagick ];
      }
      ''
        magick \
          \( -size 50x50 xc:'#63b3f4' \) \
          \( -size 50x50 xc:'#68a33a' \) \
          \( -size 50x50 xc:'#97e5fe' \) \
          \( -size 50x50 xc:'#266664' \) \
          +append $out
      '';

  wallpaperEval = evalModule {
    enable = true;
    wallpaper = ambiguousWallpaper;
    prefer = "saturation";
  };
in
{
  module-evaluation = pkgs.writeText "module-eval-test" (
    builtins.toJSON seedColorEval.config.matugen.theme
  );

  ambiguous-wallpaper = pkgs.writeText "ambiguous-wallpaper-test" (
    builtins.toJSON wallpaperEval.config.matugen.theme
  );
}
