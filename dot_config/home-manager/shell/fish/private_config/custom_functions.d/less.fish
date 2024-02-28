if type -q vim
    function less --description "vim as a pager"
        /usr/share/vim/vim82/macros/less.sh $argv
    end
end
