{
  imports = [./plugins];
  programs = {
    xenon = {
      enable = true;
      aliases = ["nvim" "vim" "vi"];
      initFiles = [
        ./init.lua
        ./keymap.lua
      ];
    };
  };
}
