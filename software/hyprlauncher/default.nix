{ pkgs, inputs, ... }:

  {
    home.packages = [
      inputs.hyprlauncher.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

  }
