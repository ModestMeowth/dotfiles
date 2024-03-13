$Env:DIRENV_CONFIG = "$Env:LOCALAPPDATA\direnv"
$Env:XDG_CACHE_HOME = "$Env:USERPROFILE\.local\cache"
$Env:XDG_DATA_HOME = "$Env:USERPROFILE\.local\share"

$PSStyle.FileInfo.Directory = "`e[34m"

Set-Alias -Name vi -Value nvim
Set-Alias -Name vim -Value nvim

function ca { chezmoi apply }
function cu { chezmoi update }
function cc { chezmoi cd }
function ce { chezmoi edit }

function ga { git add -A }
function cg { git commit }
function gs { git status }
function gp { git push }
function gl { git log }
function gd { git diff }
function gds { git diff --staged }
function gr { git restore . }
function grs { git restore --staged . }

function cga { chezmoi git add -- -A }
function cgc { chezmoi git commit }
function cgs { chezmoi git status }
function cgp { chezmoi git push }
function cgl { chezmoi git log }
function cgd { chezmoi git diff }
function cgds { chezmoi git diff -- --staged }
function cgr { chezmoi git restore -- . }
function cgrs { chezmoi git restore -- --staged . }

function tss { tailscale status }
function tsp { tailcale ping }
function tsn { tailscale netcheck }

function bw {
    if(-not (Test-Path env:BW_SESSION) -or ($args[0] -eq "unlock")) {
        $env:BW_SESSION=(bw.exe unlock --raw)
    }

    if(-not ($args[0] -eq "unlock")) {
        Invoke-Expression ("bw.exe " + $args)
    }
}

Invoke-Expression (&starship init powershell)
