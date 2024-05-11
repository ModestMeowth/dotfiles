swBinPath := "/run/current-system/sw/bin"
profileBinPath := env_var("HOME") + "/.nix-profile/bin"

useNh := if path_exists(swBinPath + "/nh") == "true" {
        "true"
    } else if path_exists(profileBinPath + "/nh") == "true" {
        "true"
    } else { "false" }

useChezmoi := if path_exists(swBinPath + "/chezmoi") == "true" {
        "true"
    } else if path_exists(profileBinPath + "/chezmoi") == "true" {
        "true"
    } else { "false" }

command := if useNh == "true" { "nh os" } else { "sudo nixos-rebuild" }
flakePath := if useChezmoi == "true" { "$(chezmoi source-path)" } else { "/etc/nixos" }

fmtCommand := if useChezmoi == "true" { "nix fmt" } else { "sudo nix fmt" }

default:
    just --list

lint:
    cd "{{ flakePath }}"
    {{ fmtCommand }}

switch *FLAGS:
    {{ command }} switch {{ FLAGS }} "{{ flakePath }}"

build *FLAGS:
    {{ command }} build {{ FLAGS }} "{{ flakePath }}"

test *FLAGS:
    {{ command }} test {{ FLAGS }} "{{ flakePath }}"
