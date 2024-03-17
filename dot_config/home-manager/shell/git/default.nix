{ pkgs, config, ... }: {
  programs = {
    git = {
      enable = true;

      userName = "Daniel Eberle";
      userEmail = "dan.eberle@protonmail.com";

      extraConfig = {
        init = {
          defaultBranch = "main";
        };

        core = {
          editor = "vim.nox";
        };

        color = {
          ui = "auto";

          branch = {
            current = "yellow reverse";
            local = "yellow";
            remote = "green";
          };

          diff = {
            meta = "yellow bold";
            frag = "magenta bold";
            old = "red";
            new = "green";
          };

          status = {
            added = "yellow";
            changed = "green";
            untracked = "cyan";
          };

        };
      };
    };

    gh = {
        enable = true;

        settings = {
          editor = "vim.nox";
        };
    };
  };

    home = {
      packages = with pkgs; [
        pre-commit
        gitlint
        shellcheck
        commitizen
        lazygit
      ];
    };
}
