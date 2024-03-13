if not set -q TMUX

    if test "$TMUX_AUTO_ATTACH" = "true"
        tmux new -As0
    else
        tmux
    end

    if test "$TMUX_AUTO_EXIT" = "true"
        kill $fish_pid
    end

end
