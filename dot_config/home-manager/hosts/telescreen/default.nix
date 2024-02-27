{ pkgs, config, ... }: {
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
