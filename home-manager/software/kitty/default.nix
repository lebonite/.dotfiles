{ pkgs, ... }:

{

  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Macchiato";
    font = {
      name = "Mononoki Nerd Font";
      size = 13;
    };
  };

}
