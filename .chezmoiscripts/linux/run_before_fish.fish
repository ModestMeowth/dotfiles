#!/usr/bin/env fish

printf "====[ Fish Plugins\n"

if not type -q fisher
    printf ">>>>[ Install Fisher\n"
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
end

printf ">>>>[ Updating Fisher\n"
fisher update

printf "====[ Fish Completions\n"

if not test -d "$__fish_config_dir/completions"
    mkdir -p "$__fish_config_dir/completions"
end

if type -q chezmoi
    printf ">>>>[ Chezmoi\n"
    chezmoi completion fish --output="$__fish_config_dir/completions/chezmoi.fish"
end

if type -q zellij
    printf ">>>>[ Zellij\n"
    zellij setup --generate-completion fish > "$__fish_config_dir/completions/chezmoi.fish"
end

printf "====[ Fish Complete\n"
