{ config, pkgs, ... }:
  {
    home.packages = [
      pkgs.putty
    ];
}
