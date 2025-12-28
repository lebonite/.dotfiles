{ pkgs, ... }:

let
  audioLinkScript = ''
    #!${pkgs.bash}/bin/bash

    until ${pkgs.pipewire}/bin/pw-link -l | grep -q "Waydroid:output_FL" && \
          ${pkgs.pipewire}/bin/pw-link -l | grep -q "audacity.*input_FL"; do
      sleep 1
    done

    ${pkgs.pipewire}/bin/pw-link "Waydroid:output_FL" "alsa_capture..audacity-wrapped:input_FL"
    ${pkgs.pipewire}/bin/pw-link "Waydroid:output_FR" "alsa_capture..audacity-wrapped:input_FR"
  '';
in {
  # Make the script available to the user
  home.file.".local/bin/link-audio.sh" = {
    text = audioLinkScript;
    executable = true;
  };

  # Systemd user service to auto-run it
  systemd.user.services.pipewire-linker = {
    Unit = {
      Description = "Auto-link Firefox to Audacity via PipeWire";
      After = [ "graphical-session.target" "pipewire.service" ];
      Requires = [ "pipewire.service" ];
    };
    Service = {
      ExecStart = "${pkgs.bash}/bin/bash %h/.local/bin/link-audio.sh";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
