function reload-abbrs --description 'clears and reloads abbreviations'
    for abbr_name in (abbr -l)
        abbr -e $abbr_name
    end

    set -q MY_ABBR_SET && set -e MY_ABBR_SET
    printf "Reloading fish abbreviations\n"
    source "$__fish_config_dir/abbrs.fish"
end
