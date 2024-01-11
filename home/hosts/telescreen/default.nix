{ pkgs, config, ... }: {
    home = {
        username = "mm";
        homeDirectory = "/home/mm";

        stateVersion = "23.11";

        packages = with pkgs; [
            just
            chezmoi
            ripgrep
            eza
            fzf
            zoxide
            zellij
            starship
        ];
    };

    programs = {
        home-manager.enable = true;
    };

    dconf.settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = [
          "qemu+ssh://mm@pwnyboy/system"
        ];
        uris = [
          "qemu+ssh://mm@pwnyboy/system"
        ];
      };
    };

    imports = [
        ../../shell/git
        ../../shell/nix-direnv
    ];
}
