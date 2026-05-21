#Stationär

{ config, lib, pkgs, pkgsStable, inputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./virtualisation/.
    ];

    boot = {
      loader.systemd-boot.enable = true;
      loader.efi.canTouchEfiVariables = true;
      kernelParams = [ "video=DP-1:1280x960@90" ];
      supportedFilesystems = [ "ntfs" ]; 
      initrd.kernelModules = [ "amdgpu" ];
    };
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    networking.hostName = "GurkTornet"; # Define your hostname. 
    networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
    networking.wireguard.enable = true;

    #-----------------RGB------------------------#
    services.hardware.openrgb = {
      enable = true;
    };

    #-----------------locale mm------------------#
    time.timeZone = "Europe/Stockholm"; 
  
    i18n.defaultLocale = "en_US.UTF-8";
    console = {
      font = "Lat2-Terminus16";
       keyMap = "sv-latin1";
   
    };
    

    #i18n.inputMethod = {
     # enabled = "ibus";
      #ibus.engines = with pkgs.ibus-engines; [ anthy ];
    #};

    # foonts

    fonts.fontDir.enable = true;
    
    #------------------Ljud----------------------#
    security.rtkit.enable = true;
    services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
};
    

    #-----------------------Grafik---------------#
    hardware.graphics = {
      enable = true; 
      enable32Bit = true;  
#      extraPackages = [ pkgs.amdvlk ];
#      extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];
    }; 
  
    #-----------------------polkit-----------------#
security.polkit.enable = true;

  systemd = {
  user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
  };
};
    #-----------------------Användare--------------#





         
         




    users.users.lebonite = {
     isNormalUser = true;
     extraGroups = [ "input" "wheel" "adbusers" ]; # Enable ‘sudo’ for the user.
      packages = with pkgs; [
        librewolf 
        tree
        #polkit
        polkit
        lm_sensors
        polkit_gnome
      ];
    };
  #--------------home-manager----------------#

  programs.hyprland.enable = true;

  home-manager = {
    extraSpecialArgs = { inherit inputs pkgsStable; };
    users = { 
      "lebonite" = import ./home.nix;
    };
  };
    
  #--------------windowmanagers--------------#

  # Xorg
    services.xserver.enable = true;
    services.xserver.displayManager.lightdm.enable = false;
    services.xserver.displayManager.startx.enable = true;
    services.xserver.defaultDepth = 24;
    
    services.displayManager.autoLogin.enable = true;
    services.displayManager.autoLogin.user = "lebonite";

    services.xserver.displayManager.sessionCommands = ''
      xset s off
      xset s noblank
      xset -dpms
    '';

 
  # Enable DWM
    services.xserver.windowManager.dwm.enable = true; 
  # Enable Plasma 6!
    services.desktopManager.plasma6.enable = true;  
   








  #---------------------Fonts--------------------------#
  
  



  #-------------------systempacket----------------------#   
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment = {
    systemPackages = with pkgs; [
    # xdg-desktop-portal-gtk 
     git
     ifuse
     libimobiledevice
     librewolf
     libnatpmp
     pciutils
     qemu
     vim
     vimPlugins.vimwiki
     wget
     grim
     slurp
     grimblast
     gimp
     openrgb
        
     

   ];
 }; 


  # unfree software
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "steam"
      "steam-original"
      "steam-run"
      "steam-unwrapped"
      "lutris"
  ];

  # Steam 
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
}; 
  #------------------------------------------------------#
  
  #-------------------Virtualisering---------------------#

  virtualisation.libvirtd = {
    enable = true;
    qemu.swtpm.enable = true;
  };
  programs.virt-manager.enable = true;

  #------------------------------------------------------#

  nixpkgs.config.allowUnfree = true;





  #-------------IOS-support-------------#
  services.usbmuxd.enable = true;
  #-------------Udev-rules--------------#


  #---------------discord breaking update fix--------------------#

  #nixpkgs.overlays = [(self: super: { discord = super.discord.overrideAttrs (_: { src = builtins.fetchTarball <link-to-tarball>; });})];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
   services.tailscale = { 
     enable = true;
   };
  # Enable the OpenSSH daemon.
   services.openssh.enable = true;
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
    networking.firewall = {
      enable = true;

    };
  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # Not supported with flakes
    system.copySystemConfiguration = false;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?

}

