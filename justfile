update:
    sudo nixos-rebuild --flake .# switch

generate *ARGS:
    #!/usr/bin/env bash
    cd ansible
    nix develop -c ansible-playbook nixos.yaml -t gen_auth_keys {{ ARGS }}
