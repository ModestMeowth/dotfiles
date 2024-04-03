{pkgs, ...}: {
    imports = [
        ../../modules/wsl.nix
    ];

    wsl = {
        wslConf = {
            network = {
                hostname = "videodrome";
                generateHosts = false;
            };
        };
        defaultUser = "mm";
    };
}
