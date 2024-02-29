if not set -q MY_ABBR_SET
    set -l MY_ABBR_SET true

	abbr ea 'edit-abbrs'

    if type -q apt
        if type -q nala
            abbr apti 'sudo nala install'
            abbr aptr 'sudo nala remove'
            abbr aptu 'sudo nala update'
            abbr aptug 'sudo sh -c "nala update && nala upgrade"'
        else
            abbr apti 'sudo apt install'
            abbr aptr 'sudo apt remove'
            abbr aptu 'sudo apt update'
            abbr aptug 'sudo sh -c "apt update && apt upgrade"'
        end
    end

    if type -q git
        abbr g 'git'
        abbr ga 'git add -A'
        abbr gc 'cz c'

        abbr gs 'git status'
        abbr gp 'git push'
        abbr gpl 'git pull'
        abbr gl 'git log'
        abbr gd 'git diff'
        abbr gds 'git diff --staged'
        abbr gr 'git restore .'
        abbr grs 'git restore --staged .'
    end

    if type -q chezmoi
        abbr c 'chezmoi'
        abbr ca 'chezmoi apply'
        abbr cu 'chezmoi update'
        abbr ce 'chezmoi edit'
        abbr cf 'chezmoi forget'
        abbr cs 'chezmoi status'
        abbr cc 'chezmoi cd'
        abbr cg 'chezmoi git'
        abbr cga 'chezmoi git add -- -A'

        abbr cgc 'chezmoi git cz c'

        abbr cgs 'chezmoi git status'
        abbr cgp 'chezmoi git push'
        abbr cgd 'chezmoi git diff'
        abbr cgds 'chezmoi git diff -- --staged'
        abbr cgr 'chezmoi git restore .'
        abbr cgrs 'chezmoi git restore -- --staged .'
    end

    if type -q eza
        abbr ls 'eza --icons --sort=type'
        abbr lsa 'eza -lag --icons --sort=type'
        abbr l 'eza -lag --icons --sort=type'
        abbr ll 'eza -l --icons --sort=type'
        abbr la 'eza -lag --icons --sort=type'
    end

    if type -q tailscale
        abbr ts 'tailscale'
        abbr tss 'tailscale status'
        abbr tsp 'tailscale ping'
        abbr tsn 'tailscale netcheck'
    end

    if type -q zoxide
        abbr cd 'z'
        abbr ci 'zi'
    end

    if type -q virsh
        abbr vm 'virsh -c qemu+ssh://mm@pwnyboy/system'
        abbr vme 'virsh -c qemu+ssh://mm@pwnyboy/system edit'
    end

    if type -q docker
        abbr dp 'docker ps --format "table {{.Names}}\t{{.Networks}}\t{{.Status}}\t{{.Ports}}"'
        abbr dc 'docker compose'
        abbr dls 'docker compose ls'
        abbr dcu 'docker compose up -d'
        abbr dcd 'docker compose down'
        abbr dcr 'docker compose restart'
        abbr dce 'docker compose exec'
        abbr dcl 'docker compose logs'
        abbr dcp 'docker compose pull'
        abbr dcb 'docker compose build'
    end

    abbr cpr 'cp -rf'
    abbr rmr 'rm -rf'
    abbr md 'mkdir -p'
    abbr rd 'rmdir'

    abbr -a L --position anywhere --set-cursor "% | less"
    abbr -a !! --position anywhere --function last_history_item
end
