{ config, pkgs, lib, ... }:

{



    programs.kitty = {
      enable = true;
      themeFile = "Catppuccin-Macchiato";
      font = {
        name = "Mononoki Nerd Font";
        size = 12;
      };
    };
    wayland.windowManager.hyprland.enable = true;

 



  # Hyprland settings
    wayland.windowManager.hyprland.settings = {




#¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸# 


# '||    ||'  ..|''||   '|.   '|' '||' |''||''|  ..|''||   '||''|.    .|'''.|
#  |||  |||  .|'    ||   |'|   |   ||     ||    .|'    ||   ||   ||   ||..  '
#  |'|..'||  ||      ||  | '|. |   ||     ||    ||      ||  ||''|'     ''|||.
#  | '|' ||  '|.     ||  |   |||   ||     ||    '|.     ||  ||   |.  .     '||
# .|. | .||.  ''|...|'  .|.   '|  .||.   .||.    ''|...|'  .||.  '|' |'....|'



      monitor = [
                  "DP-2, 3440x1440@144, 0x0, 1.0"
                  "DP-1, 3440x1440@144, 0x0, 1.0" 
                  "DP-3, 3440x1440@144, 0x0, 1.0"
                ];

#¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸#a


# '||' '|.   '|' '||''|.  '||'  '|' |''||''|
#  ||   |'|   |   ||   ||  ||    |     ||
#  ||   | '|. |   ||...|'  ||    |     ||
#  ||   |   |||   ||       ||    |     ||
# .||. .|.   '|  .||.       '|..'     .||.



    input = { 
      kb_layout = "se";
      follow_mouse = 1;
      mouse_refocus = false;
    };

    
    "$mod" = "SUPER";
    bind = 
      [
        "$mod, F, exec, librewolf"
        "$mod, X, exec, kitty"
        "$mod, Q, killactive"
        "$mod, V, togglefloating"	
	"bind = $mod, M, exit"
        "bind = $mod, R, exec, hyprlauncher"
	"bind = $mod, E, exec, $fileManager"
	"bind = $mod, R, exec, $menu"
	"bind = $mod, P, pseudo" # dwindle
        # does not exist ap"bind = $mod, J, togglesplit" # dwindle
        "$mod, 1 , exec, hyprctl dispatch workspace 1"
        "$mod, 2 , workspace, 2"
        "$mod, 3 , workspace, 3"
        "$mod, 4 , workspace, 4"
        "$mod, 5 , workspace, 5"
        "$mod, 6 , workspace, 6"
        "$mod, 7 , workspace, 7"
        "$mod, 8 , workspace, 8"
        "$mod, 9 , workspace, 9"
        "$mod, 10 , workspace, 10"
        
        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "bind = $mod SHIFT, 1, movetoworkspace, 1"
        "bind = $mod SHIFT, 2, movetoworkspace, 2"
        "bind = $mod SHIFT, 3, movetoworkspace, 3"
        "bind = $mod SHIFT, 4, movetoworkspace, 4"
        "bind = $mod SHIFT, 5, movetoworkspace, 5"
        "bind = $mod SHIFT, 6, movetoworkspace, 6"
        "bind = $mod SHIFT, 7, movetoworkspace, 7"
        "bind = $mod SHIFT, 8, movetoworkspace, 8"
        "bind = $mod SHIFT, 9, movetoworkspace, 9"
        "bind = $mod SHIFT, 0, movetoworkspace, 10"
        
        # move/resize windows with mainmod + lmb/rmb and dragging
        "bindm = $mod, mouse:272, movewindow"
        "bindm = $mod, mouse:273, resizewindowpixel"
	
	
        # Move focus with mainMod + arrow keys
        "bind = $mod, left, movefocus, l"
        "bind = $mod, right, movefocus, r"
        "bind = $mod, up, movefocus, u"
        "bind = $mod, down, movefocus, d"	

        # Window behaviour
        "bind = $mod, V, togglefloating"
        "bind = $mod SHIFT, F, fullscreen"
        
         # Ags
         "bind = $mod SHIFT, T,exec, ags run ~/.config/ags/app.ts"
       ]; 
    bindm = [
      "$mod, mouse:273, resizewindow"
      "$mod, mouse:272, movewindow"
    ];
 

#¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸#


#     |     '|.   '|' '||' '||    ||'     |     |''||''| '||'  ..|''||   '|.   '|'  .|'''.|
#    |||     |'|   |   ||   |||  |||     |||       ||     ||  .|'    ||   |'|   |   ||..  '
#   |  ||    | '|. |   ||   |'|..'||    |  ||      ||     ||  ||      ||  | '|. |    ''|||.
#  .''''|.   |   |||   ||   | '|' ||   .''''|.     ||     ||  '|.     ||  |   |||  .     '||
# .|.  .||. .|.   '|  .||. .|. | .||. .|.  .||.   .||.   .||.  ''|...|'  .|.   '|  |'....|'



      animations = {
        enabled = true;

         bezier = [
           "easeOutQuint,0.23,1,0.32,1"
           "easeInOutCubic,0.65,0.05,0.36,1"
           "linear,0,0,1,1"
           "almostLinear,0.5,0.5,0.75,1.0"
           "quick,0.15,0,0.1,1"
         ];
         animation = [
           "global, 1, 10, default"
           "border, 1, 5.39, easeOutQuint"
           "windows, 1, 4.79, easeOutQuint"
           "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
           "windowsOut, 1, 1.49, linear, popin 87%"
           "fadeIn, 1, 1.73, almostLinear"
           "fadeOut, 1, 1.46, almostLinear"
           "fade, 1, 3.03, quick"
           "layers, 1, 3.81, easeOutQuint"
           "layersIn, 1, 4, easeOutQuint, fade"
           "layersOut, 1, 1.5, linear, fade"
           "fadeLayersIn, 1, 1.79, almostLinear"
           "fadeLayersOut, 1, 1.39, almostLinear"
           "workspaces, 1, 1.94, almostLinear, fade"
           "workspacesIn, 1, 1.21, almostLinear, fade"
           "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      }; 

#¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸#


#  ..|'''.|  '||''''|  '|.   '|' '||''''|  '||''|.       |     '||'
# .|'     '   ||  .     |'|   |   ||  .     ||   ||     |||     ||
# ||    ....  ||''|     | '|. |   ||''|     ||''|'     |  ||    ||
# '|.    ||   ||        |   |||   ||        ||   |.   .''''|.   ||
#  ''|...'|  .||.....| .|.   '|  .||.....| .||.  '|' .|.  .||. .||.....|


     general = { 
       gaps_in = 10;
       gaps_out = 20;
       env = "WLR_DRM_NO_ATOMIC,1"; 
       allow_tearing = true;
       resize_on_border = true;

       border_size = 2;




       "col.active_border" = "rgb(8caaee) rgb(8caaee) rgb(f4b8e4) rgb(8caaee) rgb(8caaee) 90deg";
       "col.inactive_border" = "rgba(4145597e)";


     }; 


#¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸#


# '||''|.   '||''''|    ..|'''.|  ..|''||   '||''|.       |     |''||''| '||'  ..|''||   '|.   '|'
#  ||   ||   ||  .    .|'     '  .|'    ||   ||   ||     |||       ||     ||  .|'    ||   |'|   |
#  ||    ||  ||''|    ||         ||      ||  ||''|'     |  ||      ||     ||  ||      ||  | '|. |
#  ||    ||  ||       '|.      . '|.     ||  ||   |.   .''''|.     ||     ||  '|.     ||  |   |||
# .||...|'  .||.....|  ''|....'   ''|...|'  .||.  '|' .|.  .||.   .||.   .||.  ''|...|'  .|.   '|


     decoration = {
       blur =  {
         enabled = true;
         size = 3;
         passes = 1;
       };
       shadow = {
         enabled = true;
         range = 12;
         render_power = 3;
         color = "rgba(f4b8e47e)";
       };
       rounding = 10;
       rounding_power = 2;
     };

#¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸
     # does not exist ap dwindle = {
     #  pseudotile = true; 
     #  preserve_split = true;
     #};
     master = {
       new_status = "master";
     };
       
#¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸#


# '||    ||' '||'  .|'''.|    ..|'''.|
#  |||  |||   ||   ||..  '  .|'     ' 
#  |'|..'||   ||    ''|||.  ||        
#  | '|' ||   ||  .     '|| '|.      .
# .|. | .||. .||. |'....|'   ''|....' 

  misc = {

    force_default_wallpaper = 2;
  };  
       






#¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸#


#     |     '||'  '|' |''||''|  ..|''||    .|'''.|  |''||''|     |     '||''|.   |''||''|
#    |||     ||    |     ||    .|'    ||   ||..  '     ||       |||     ||   ||     ||
#   |  ||    ||    |     ||    ||      ||   ''|||.     ||      |  ||    ||''|'      ||
#  .''''|.   ||    |     ||    '|.     || .     '||    ||     .''''|.   ||   |.     ||
# .|.  .||.   '|..'     .||.    ''|...|'  |'....|'    .||.   .|.  .||. .||.  '|'   .||.

    exec-once = [ "ashell" "hyprlauncher -d" "systemctl start --user polkit-gnome-authentication-agent-1" ]; 
    



     
     #windowrule = "opacity 1.0 override 0.5 override 0.8 override, kitty";
   };
} 
