{ config, pkgsStable, pkgs, lib, inputs, ... }:

{

  
   
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "lebonite";
  home.homeDirectory = "/home/lebonite";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.


  imports = [ 
              ./software/hyprtoolkit/.
              ./software/hyprland/.
              ./software/hyprlauncher/.
              ./software/unfreeList/. 
              ./pw-link/.
            ];
  
   # programs.ags = {
   # enable = true;

    # null or path, leave as null if you don't want hm to manage the config
    #configDir = /home/lebonite/.dotfiles/ags;

    # additional packages to add to gjs's runtime
   # extraPackages = with pkgs; [
    #  gtksourceview
    #  webkitgtk
    #  accountsservice
   # ];
  #};
  
  services.dunst.enable = true;


  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ vimwiki ];
    settings = { ignorecase = true; };
    extraConfig = ''
      set mouse=a
    '';
  };



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


  # defalt appl
    xdg.mimeApps = {
      enable = true;

      associations.added = {
      "inode/directory" = ["org.kde.dolphin.desktop"];  
      };

      defaultApplications = {
        "inode/directory" = ["org.kde.dolphin.desktop"];
      };
    };
 
 
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
      pkgs.sg3_utils
      pkgs.anki
      pkgs.cava 
      pkgs.cmus
      pkgs.celluloid
      pkgs.discord
      pkgs.dmenu
      pkgs.easyeffects
      pkgs.ffmpeg
      pkgs.firefox 
      pkgs.guitarix
      pkgs.hsetroot
      pkgs.jdk17
      pkgs.kid3
      pkgs.kitty
      pkgs.libreoffice
      pkgs.lutris
      pkgs.motrix
      pkgs.ncdu
      pkgs.nextcloud-client
      pkgs.nicotine-plus
      pkgs.openvpn
      pkgs.prismlauncher
      pkgs.protonup-ng
      pkgs.protontricks
      pkgs.python3
      pkgs.p7zip
      pkgs.helvum
      pkgs.ranger
      pkgs.rpcs3
      pkgs.st
      pkgs.tigervnc
      pkgs.unrar 
      pkgs.wineWowPackages.stable
      pkgs.winetricks
      pkgs.winbox
      pkgs.nerd-fonts.mononoki







  (pkgs.writeShellScriptBin "wake-thunderdrive" ''
    sg_raw /dev/sr0 EA 00 00 00 00 00 01
    '')                                               










  ];  
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello
  
                 
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
     
  # enable insecure software

    #nixpkgs.config.permittedInsecurePackages = [
    #            "python-2.7.18.8"
    #          ];

    


  # fonts

  fonts.fontconfig.enable = true;

   
 

  
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
        ".xinitrc".source = ./.xinitrc; 
       
        ".config/ranger/rifle.conf".source = ./rifle.conf;
        ".config/ranger/rc.conf".source = ./rc.conf;
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/lebonite/etc/profile.d/hm-session-vars.sh
  #




  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}









