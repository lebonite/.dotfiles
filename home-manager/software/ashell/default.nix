{ pkgs, ... }:

{

  programs.ashell = {
    enable = true;
    settings = {
      appearance = {
        primary_color = "#8aadf4"; # Buttons etc # Buttons etc
        text_color = "#cad3f5";
        success_color = "#f5a97f";
        workspace_colors = [ "#8aadf4" "#f5a97f" ]; # workspace buttons
        special_workspace_colors = [ "#8aadf4" "#f5a97f" ];
        danger_color = "#f5a97f"; # Ex performance icon
        background_color = {
          base = "#363a4f"; # Box background color
          strong = "#1e2030"; # Mouse hover over color
          weak = "#181926"; # Greyed out button color
        };  

        secondary_color = {
          base = "#939ab7"; # slider tracks and borders
        };


        font_name = "Mononoki Nerd Font";
      };
    };
  };


  }
