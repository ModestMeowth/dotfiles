set shell := ["pwsh.exe", "-c"]

@default:
    just --choose --justfile {{ justfile() }}

winget-update:
    winget upgrade -r

choco-update:
    sudo choco upgrade -y all

wsl-update:
    wsl --update

nvidia-update:
    sudo choco upgrade -y nvidia-display-driver

update: winget-update choco-update wsl-update

pwnyup:
    tailscale ping -c 0 pwnyboy
