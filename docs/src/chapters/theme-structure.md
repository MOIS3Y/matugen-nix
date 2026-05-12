# Theme Structure

The output of the module is available at `config.matugen.theme`. It is split
into two main sections to keep generated and user-defined data organized.

## `theme.generated`

This section contains everything produced by matugen. The structure is
preserved from matugen's native output for predictability.

### `colors` (Material Design 3)
Semantic colors according to the Material You specification. Each color
contains three variants:
- `default`: Points to either `dark` or `light` based on your `matugen.mode`.
- `dark`: The dark mode version of the color.
- `light`: The light mode version of the color.

**Full list of generated colors:**

- **Primary & Secondary**
    - `primary`, `primary_container`, `on_primary`, `on_primary_container`
    - `primary_fixed`, `primary_fixed_dim`, `on_primary_fixed`,
      `on_primary_fixed_variant`
    - `secondary`, `secondary_container`, `on_secondary`,
      `on_secondary_container`
    - `secondary_fixed`, `secondary_fixed_dim`, `on_secondary_fixed`,
      `on_secondary_fixed_variant`
- **Tertiary & Error**
    - `tertiary`, `tertiary_container`, `on_tertiary`, `on_tertiary_container`
    - `tertiary_fixed`, `tertiary_fixed_dim`, `on_tertiary_fixed`,
      `on_tertiary_fixed_variant`
    - `error`, `error_container`, `on_error`, `on_error_container`
- **Surface & Background**
    - `background`, `on_background`
    - `surface`, `surface_bright`, `surface_dim`, `on_surface`,
      `surface_variant`, `on_surface_variant`, `surface_tint`
    - `surface_container`, `surface_container_low`, `surface_container_lowest`,
      `surface_container_high`, `surface_container_highest`
- **Utility**
    - `outline`, `outline_variant`
    - `inverse_surface`, `inverse_on_surface`, `inverse_primary`
    - `scrim`, `shadow`, `source_color`

### `base16`
A classic Base16 palette. Like `colors`, every base attribute (`base00` to
`base0F`) contains `default`, `dark`, and `light` variants.

**Attributes:** `base00` through `base0f`.

### `palettes`
Tonal palettes (ranges of 13 tones from 0 to 100). These are static and do
not have `dark`/`light` variants.
- Keys are strings representing tones: `"0"`, `"10"`, `"15"`, `"20"`, `"25"`,
  `"30"`, `"35"`, `"40"`, `"50"`, `"60"`, `"70"`, `"80"`, `"90"`, `"95"`,
  `"98"`, `"99"`, `"100"`.

**Available palettes:**
- `primary`, `secondary`, `tertiary`
- `error`, `neutral`, `neutral_variant`

## `theme.custom`

This section contains the data you provided in `matugen.customColors`. It is
preserved exactly as you defined it.

**Example usage**: `config.matugen.theme.custom.mySpecialAccent`

## Full Real-World Example

Below is an exhaustive example of what the module produces.

### Input Configuration

```nix
matugen = {
  enable = true;
  seedColor = "#89b4fa"; # Catppuccin Blue
  mode = "dark";
  customColors = {
    catppuccin = {
      latte = { base = "#eff1f5"; text = "#4c4f69"; };
      mocha = { base = "#1e1e2e"; text = "#cdd6f4"; };
    };
  };
};
```

### Generated Output (`config.matugen.theme`)

```nix
{
  generated = {
    colors = {
      # Primary & Secondary
      primary = { dark = "#aac7ff"; default = "#aac7ff"; light = "#3f5f90"; };
      on_primary = { dark = "#0a305f"; default = "#0a305f"; light = "#ffffff"; };
      primary_container = { dark = "#284777"; default = "#284777"; light = "#d6e3ff"; };
      on_primary_container = { dark = "#d6e3ff"; default = "#d6e3ff"; light = "#001b3e"; };
      primary_fixed = { dark = "#d6e3ff"; default = "#d6e3ff"; light = "#d6e3ff"; };
      primary_fixed_dim = { dark = "#aac7ff"; default = "#aac7ff"; light = "#aac7ff"; };
      on_primary_fixed = { dark = "#001b3e"; default = "#001b3e"; light = "#001b3e"; };
      on_primary_fixed_variant = { dark = "#284777"; default = "#284777"; light = "#284777"; };
      secondary = { dark = "#bec6dc"; default = "#bec6dc"; light = "#565e71"; };
      on_secondary = { dark = "#283041"; default = "#283041"; light = "#ffffff"; };
      secondary_container = { dark = "#3e4759"; default = "#3e4759"; light = "#dae2f9"; };
      on_secondary_container = { dark = "#dae2f9"; default = "#dae2f9"; light = "#131c2b"; };
      secondary_fixed = { dark = "#dae2f9"; default = "#dae2f9"; light = "#dae2f9"; };
      secondary_fixed_dim = { dark = "#bec6dc"; default = "#bec6dc"; light = "#bec6dc"; };
      on_secondary_fixed = { dark = "#131c2b"; default = "#131c2b"; light = "#131c2b"; };
      on_secondary_fixed_variant = { dark = "#3e4759"; default = "#3e4759"; light = "#3e4759"; };

      # Tertiary & Error
      tertiary = { dark = "#ddbbda"; default = "#ddbbda"; light = "#705571"; };
      on_tertiary = { dark = "#3f2841"; default = "#3f2841"; light = "#ffffff"; };
      tertiary_container = { dark = "#573e58"; default = "#573e58"; light = "#f7d8f7"; };
      on_tertiary_container = { dark = "#f7d8f7"; default = "#f7d8f7"; light = "#29132b"; };
      tertiary_fixed = { dark = "#f7d8f7"; default = "#f7d8f7"; light = "#f7d8f7"; };
      tertiary_fixed_dim = { dark = "#ddbbda"; default = "#ddbbda"; light = "#ddbbda"; };
      on_tertiary_fixed = { dark = "#29132b"; default = "#29132b"; light = "#29132b"; };
      on_tertiary_fixed_variant = { dark = "#573e58"; default = "#573e58"; light = "#573e58"; };
      error = { dark = "#ffb4ab"; default = "#ffb4ab"; light = "#ba1a1a"; };
      on_error = { dark = "#690005"; default = "#690005"; light = "#ffffff"; };
      error_container = { dark = "#93000a"; default = "#93000a"; light = "#ffdad6"; };
      on_error_container = { dark = "#ffdad6"; default = "#ffdad6"; light = "#410002"; };

      # Surface & Background
      background = { dark = "#111318"; default = "#111318"; light = "#f9f9ff"; };
      on_background = { dark = "#e2e2e9"; default = "#e2e2e9"; light = "#191c20"; };
      surface = { dark = "#111318"; default = "#111318"; light = "#f9f9ff"; };
      on_surface = { dark = "#e2e2e9"; default = "#e2e2e9"; light = "#191c20"; };
      surface_variant = { dark = "#44474e"; default = "#44474e"; light = "#e0e2ec"; };
      on_surface_variant = { dark = "#c4c6d0"; default = "#c4c6d0"; light = "#44474e"; };
      surface_bright = { dark = "#37393e"; default = "#37393e"; light = "#f9f9ff"; };
      surface_dim = { dark = "#111318"; default = "#111318"; light = "#d9d9e0"; };
      surface_tint = { dark = "#aac7ff"; default = "#aac7ff"; light = "#3f5f90"; };
      surface_container = { dark = "#1d2024"; default = "#1d2024"; light = "#f3f3fa"; };
      surface_container_high = { dark = "#282a2f"; default = "#282a2f"; light = "#edeef5"; };
      surface_container_highest = { dark = "#33353a"; default = "#33353a"; light = "#e7e8ee"; };
      surface_container_low = { dark = "#191c20"; default = "#191c20"; light = "#f9f9ff"; };
      surface_container_lowest = { dark = "#0c0e13"; default = "#0c0e13"; light = "#ffffff"; };

      # Utility
      outline = { dark = "#8e9099"; default = "#8e9099"; light = "#74777f"; };
      outline_variant = { dark = "#44474e"; default = "#44474e"; light = "#c4c6d0"; };
      inverse_surface = { dark = "#e2e2e9"; default = "#e2e2e9"; light = "#2e3036"; };
      inverse_on_surface = { dark = "#2e3036"; default = "#2e3036"; light = "#f1f0f7"; };
      inverse_primary = { dark = "#3f5f90"; default = "#3f5f90"; light = "#aac7ff"; };
      scrim = { dark = "#000000"; default = "#000000"; light = "#000000"; };
      shadow = { dark = "#000000"; default = "#000000"; light = "#000000"; };
      source_color = { dark = "#89b4fa"; default = "#89b4fa"; light = "#89b4fa"; };
    };

    base16 = {
      base00 = { dark = "#111318"; default = "#111318"; light = "#f9f9ff"; };
      base01 = { dark = "#1d2024"; default = "#1d2024"; light = "#f3f3fa"; };
      base02 = { dark = "#282a2f"; default = "#282a2f"; light = "#edeef5"; };
      base03 = { dark = "#33353a"; default = "#33353a"; light = "#e7e8ee"; };
      base04 = { dark = "#44474e"; default = "#44474e"; light = "#c4c6d0"; };
      base05 = { dark = "#8e9099"; default = "#8e9099"; light = "#74777f"; };
      base06 = { dark = "#c4c6d0"; default = "#c4c6d0"; light = "#44474e"; };
      base07 = { dark = "#e2e2e9"; default = "#e2e2e9"; light = "#191c20"; };
      base08 = { dark = "#ffb4ab"; default = "#ffb4ab"; light = "#ba1a1a"; };
      base09 = { dark = "#ffb4ab"; default = "#ffb4ab"; light = "#ba1a1a"; };
      base0a = { dark = "#ffb4ab"; default = "#ffb4ab"; light = "#ba1a1a"; };
      base0b = { dark = "#aac7ff"; default = "#aac7ff"; light = "#3f5f90"; };
      base0c = { dark = "#aac7ff"; default = "#aac7ff"; light = "#3f5f90"; };
      base0d = { dark = "#aac7ff"; default = "#aac7ff"; light = "#3f5f90"; };
      base0e = { dark = "#ddbbda"; default = "#ddbbda"; light = "#705571"; };
      base0f = { dark = "#ddbbda"; default = "#ddbbda"; light = "#705571"; };
    };

    palettes = {
      primary = {
        "0" = "#000000"; "10" = "#001b3e"; "20" = "#0a305f"; "25" = "#193b6b";
        "30" = "#284777"; "35" = "#355284"; "40" = "#425e91"; "5" = "#000f28";
        "50" = "#5b77ab"; "60" = "#7491c6"; "70" = "#8faae2"; "80" = "#aac7ff";
        "90" = "#d6e3ff"; "95" = "#ecf0ff"; "98" = "#f9f9ff"; "99" = "#fdfbff";
        "100" = "#ffffff";
      };
      secondary = {
        "0" = "#000000"; "10" = "#131c2b"; "20" = "#283041"; "25" = "#333b4c";
        "30" = "#3e4759"; "35" = "#4a5265"; "40" = "#565e71"; "5" = "#09111f";
        "50" = "#6f778a"; "60" = "#8891a5"; "70" = "#a3abc0"; "80" = "#bec6dc";
        "90" = "#dae2f9"; "95" = "#e9f0ff"; "98" = "#f9f9ff"; "99" = "#fdfbff";
        "100" = "#ffffff";
      };
      # ... (other tonal palettes)
    };
  };
  custom = {
    catppuccin = {
      latte = { base = "#eff1f5"; text = "#4c4f69"; };
      mocha = { base = "#1e1e2e"; text = "#cdd6f4"; };
    };
  };
}
```
