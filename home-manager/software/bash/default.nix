{ config, ... }:

{
  programs.bash = {
    enable = true;
    bashrcExtra = ''  
      PS1="\[\033[0;32m\]ʕっ•ᴥ•ʔっ\[\033[0m\]> " 
      [ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"
    '';
  };
}
