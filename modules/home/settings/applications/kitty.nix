{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrains Mono Nerd Font";
      size = 14.0;
    };

    # 1. Color scheme and direct config
    settings = {
      # Background and Foreground
      cursor = "#c7c7c7";
      cursor_text_color = "#feffff";
      selection_foreground = "#3e3e3e";
      selection_background = "#c1ddff";
      foreground = "#c8c8c8";
      background = "#323232";

      # Black (ANSI 0-7)
      color0 = "#252525";
      color1 = "#be7472";
      color2 = "#709772";
      color3 = "#989772";
      color4 = "#7199bc";
      color5 = "#727399";
      color6 = "#719899";
      color7 = "#7f7f7f";

      # Bright Black (ANSI 8-15)
      color8 = "#555555";
      color9 = "#ff9900";
      color10 = "#97bb98";
      color11 = "#fefdbc";
      color12 = "#9fbdde";
      color13 = "#989abc";
      color14 = "#6fbbbc";
      color15 = "#feffff";

      # Other settings
      window_padding_width = "4";
    };
  };
}
