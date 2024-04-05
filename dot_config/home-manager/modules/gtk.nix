{pkgs, ...}: {
    home = {
        packages = with pkgs; [
            dracula-theme
            dracula-icon-theme
        ]
        ++ (with gnomeExtensions; [
            gsconnect
            forge
        ]);
    };

    gtk = {
        theme.name = "Dracula";
        iconTheme.name = "Dracula";
    };
}
