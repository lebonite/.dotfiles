{ pkgs, config, lib, ...}:
  {
    home.packages = [
      pkgs.prismlauncher
    ];
  }
