update:
    nh os switch .

upgrade:
    nix flake update .
    @just update

generate *ARGS:
    #!/usr/bin/env bash
    cd ansible
    nix develop -c ansible-playbook nixos.yml -t gen_auth_keys {{ ARGS }}
