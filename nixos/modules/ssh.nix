{
  services.openssh = {
    enable = true;

    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };

    extraConfig = ''
      AcceptEnv ZELLIJ TMUX
    '';
  };
}
