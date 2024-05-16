{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      git
      gh
      pre-commit
      gitlint
      shellcheck
      commitizen
      lazygit
    ];
  };
}
