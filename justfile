update:
    sudo nixos-rebuild --flake .# switch

upgrade:
    sudo -v
    sudo nix flake update .
    @just update

generate *ARGS:
    #!/usr/bin/env bash
    cd ansible
    nix develop -c ansible-playbook nixos.yaml -t gen_auth_keys {{ ARGS }}
