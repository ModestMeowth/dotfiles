{ pkgs, config, ... }: {
    home = {
        username = "mm";
        homeDirectory = "/home/mm";

        stateVersion = "23.11";
    };
#    dconf.settings = {
#      "org/virt-manager/virt-manager/connections" = {
#        autoconnect = [
#          "qemu+ssh://mm@pwnyboy/system"
#        ];
#        uris = [
#          "qemu+ssh://mm@pwnyboy/system"
#        ];
#      };
#    };

    imports = [
        ../../profiles/base
    ];
}
