{ pkgs, config, ... }: {
  home = {
    packages = with pkgs; [
      ansible
      ansible-lint
    ];
  };
}
