# Usage Examples

Here are some practical examples of how to use the generated colors, split into basic and advanced usage.

## Basic Usage

The simplest way to use generated colors is through direct attribute access or Nix string interpolation.

### Shortening Attribute Paths

> [!TIP]
> To avoid writing long paths like `config.matugen.theme.generated.colors` repeatedly, it is highly recommended to use the `let ... in` pattern with `inherit`.

```nix
{ config, ... }:
let
  # Inherit the parts you need for brevity
  inherit (config.matugen.theme.generated) colors;
  inherit (config.matugen.theme.custom) my-colors;
in {
  # Now you can use 'colors' directly instead of the full path
  programs.kitty.settings.background = colors.background.default;
  programs.kitty.settings.foreground = colors.on_background.default;
}
```

### Using Custom Colors (Alacritty)

If you have defined custom themes (like Catppuccin) in `matugen.customColors`, you can use them alongside generated colors.

```nix
{ config, ... }:
let
  inherit (config.matugen.theme.generated) colors;
  # Accessing custom Catppuccin mocha theme
  inherit (config.matugen.theme.custom.catppuccin) mocha;
in {
  programs.alacritty.settings.colors = {
    primary = {
      background = colors.background.default; # Use generated background
      foreground = mocha.text;                # Use custom text color
    };
    normal = {
      black   = mocha.surface1;
      red     = mocha.red;
      green   = mocha.green;
      yellow  = mocha.yellow;
      blue    = mocha.blue;
      magenta = mocha.mauve;
      cyan    = mocha.sky;
      white   = mocha.subtext1;
    };
  };
}
```

### String Interpolation (CSS/Waybar)

For tools that take configuration as a string (like CSS files or Waybar's `style.css`), you can use Nix string interpolation.

> [!IMPORTANT]
> When using interpolation in multiline strings (`'' ... ''`), remember that `${ ... }` is evaluated by Nix at build time.

```nix
programs.waybar.style = let
  inherit (config.matugen.theme.generated) colors;
in ''
  window#waybar {
    background-color: ${colors.surface.default};
    color: ${colors.on_surface.default};
    border-bottom: 2px solid ${colors.primary.default};
  }
'';
```

---

## Advanced Usage

These examples show more complex patterns, including helper functions and dynamic integration.

> [!TIP]
> You can use the `dark` or `light` variants explicitly even if your global
> mode is different, which is useful for bar widgets or specific apps.

### Appending Alpha (Opacity)

Many Wayland tools like **Hyprland** or **Waybar** expect colors in hex format, sometimes with an alpha channel. You can easily create a helper for this.

```nix
{ config, ... }:
let
  inherit (config.matugen.theme.generated) colors;
  
  # Helper: take a hex color and append alpha value (00-ff)
  withAlpha = color: alpha: "${color}${alpha}";
in {
  wayland.windowManager.hyprland.settings = {
    "general:col.active_border" = withAlpha colors.primary.default "cc"; # 80% opacity
    "general:col.inactive_border" = withAlpha colors.surface_variant.default "aa";
  };
}
```

### Extracting Color Lists (Fuzzel/Rofi)

Some tools expect a list of colors or specific base16 indices. You can extract them into a list for easier mapping.

```nix
{ config, lib, ... }:
let
  inherit (config.matugen.theme.generated) base16;
  
  # Get all base16 colors as a sorted list of values
  # Useful for fuzzel, rofi, or custom scripts
  colorList = lib.mapAttrsToList (name: value: value.default) base16;
in {
  # Example: using base16 colors for a launcher
  programs.fuzzel.settings.colors = {
    background = "${base16.base00.default}ff";
    text = "${base16.base05.default}ff";
    selection = "${base16.base02.default}ff";
  };
}
```

### Dynamic Theme Picking

You can create a function to switch between dark and light variants of a color dynamically, regardless of the global `matugen.mode`.

```nix
let
  inherit (config.matugen.theme.generated) colors;
  
  # Variant picker helper
  pick = variant: color: color.${variant};
  
  # Your custom logic (e.g. based on time)
  theme = "dark"; 
in {
  services.polybar.settings."colors" = {
    background = pick theme colors.background;
    foreground = pick theme colors.on_background;
  };
}
```

### Exporting to CSS Variables

If you have external CSS files, you can generate a shared variables file.

```nix
{ config, lib, ... }:
let
  inherit (config.matugen.theme.generated) colors;
  
  toCSS = attrs: lib.concatStringsSep "\n" (
    lib.mapAttrsToList (name: value: "  --${name}: ${value.default};") attrs
  );
in {
  home.file.".config/style/colors.css".text = ''
    :root {
    ${toCSS colors}
    }
  '';
}
```

### JSON Export for External Scripts

Exporting the entire theme allows non-Nix scripts to access your colors via `jq`.

```nix
{ config, ... }:
{
  home.file.".cache/matugen-theme.json".text = 
    builtins.toJSON config.matugen.theme;
}
```
