{pkgs, ...}: {
  imports = [
    ./plugins
  ];

  programs.fish = {
    enable = true;

    plugins = with pkgs.fishPlugins; [
      {
        name = "puffer";
        src = puffer.src;
      }
    ];

    interactiveShellInit = /*fish*/ ''
      set -g fish_greeting
    '';

    shellAbbrs = {
      ssh = "mosh";
    };
  };
}
