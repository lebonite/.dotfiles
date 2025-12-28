{ lib, config, pkgs, ...}:

{


# Enable certain unfree software                               
    nixpkgs.config.allowUnfreePredicate = pkg:
     builtins.elem (lib.getName pkg) [
      # Add additional package names here
      "discord"
      "steam"
      "steam-original"
      "steam-run"
      "steam-unwrapped"
      "protontricks"
      "vmware-workstation"
      "unrar"
      "winbox"
    ];


}
