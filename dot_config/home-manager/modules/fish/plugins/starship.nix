{inputs, pkgs, ...}: {
  programs.starship = {
    enable = true;
    enableTransience = true;
  };

  xdg.configFile."starship.toml".source = "${inputs.dotfiles}/dot_config/starship.toml.tmpl";
}
