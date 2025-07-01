set shell := ["pwsh.exe", "-CommandWithArgs"]
set positional-arguments

@default:
    just --choose --justfile {{ justfile() }}

winget-update:
    winget upgrade -r

wsl-update:
    wsl --update

wsl-reboot:
    #!pwsh -c
    $env:WSL_UTF8 = 1
    foreach ($distro in @(wsl --list --quiet)) {
        if (([string] $distro).Trim() -match '\S') {
        Write-Output "Terminating $distro"
        wsl --terminate "$distro"
        }
    }

update: winget-update wsl-update

pwnyup:
    tailscale ping -c 0 pwnyboy
