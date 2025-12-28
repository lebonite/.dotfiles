{ nixpkgs, ...}:

 {

   # Hyprland
    wayland.windowManager.hyprland.enable = true;
 
  # Hyprland settings

    wayland.windowManager.hyprland.settings = {
 



    misc = {
      force_default_wallpaper = 2;
      disable_hyprland_logo = false;

      font_family = "Mononoki Nerd Font";
    };


    input = { 
      kb_layout = "se";

      touchpad = {
        natural_scroll = true;
      };
    };



    device = {
      name = "epic-mouse-v1";
    };
    
    "$mod" = "SUPER";
    bind = 
      [
        "$mod, F, exec, librewolf"
        "$mod, X, exec, kitty"






        "$mod, Q, killactive"
        "$mod, V, togglefloating"
        "$mod, 1 , workspace, 1"
        "$mod, 2 , workspace, 2"
        "$mod, 3 , workspace, 3"
        "$mod, 4 , workspace, 4"
        "$mod, 5 , workspace, 5"
        "$mod, 6 , workspace, 6"
        "$mod, 7 , workspace, 7"
        "$mod, 8 , workspace, 8"
        "$mod, 9 , workspace, 9"
        "$mod, 10 , workspace, 10"


        "$mod, mouse;272, movewindow"

      ];  
      


    general = { 
       gaps_in = 5;
       gaps_out = 5;
       env = "WLR_DRM_NO_ATOMIC,1"; 
       resize_on_border = true;
       monitor = "eDP-1, 1920x1080@60, 0x0, 1.0";

       allow_tearing = true;
    }; 

       
  }; 


 }
