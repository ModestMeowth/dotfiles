for i in .local/bin .bin bin .emacs.d/bin go/bin
    if test -d /home/mm/$i
        fish_add_path /home/mm/$i
    end
end
