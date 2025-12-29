{ pkgs, inputs, ... }:

  {
    home.packages = [
      inputs.hyprtoolkit.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];



  }

