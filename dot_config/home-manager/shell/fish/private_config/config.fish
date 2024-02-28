if string match -q /mnt/c/Users/$USER $PWD
    cd $HOME
end

if status is-interactive
    set -ga fish_function_path $HOME/.nix-profile/share/fish/vendor_functions.d
    set -ga fish_complete_path $HOME/.nix-profile/share/fish/vendor_completions.d
    set -ga fish_conf_path $HOME/.nix-profile/share/fish/vendor_conf.d

    for file in $__fish_config_dir/custom.d/*.fish
        source $file
    end

    starship init fish | source
    zoxide init fish | source
    direnv hook fish | source

    set ZELLIJ_AUTO_ATTACH true
    set ZELLIJ_AUTO_EXIT true

    if not string match -q "vscode" $TERM_PROGRAM
        eval "$(zellij setup --generate-auto-start fish)"
    end
end
