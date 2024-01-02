{ pkgs, config, ... }: {
  programs = {
    git = {
        enable = true;
        userName = "Daniel Eberle";
        userEmail = "dan.eberle@protonmail.com";
        extraConfig = {
            commit = {
                template = "${./gitcommit-message}";
            };
        };
    };

    gh = {
        enable = true;
    };
  };

    home = {
      packages = with pkgs; [
        commitizen
      ];
    };
}
