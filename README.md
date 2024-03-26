# :house: DOTFILES managed by CHEZMOI
## :wrench: INSTALLATION

### NixOs
``` sh
nix run --experimental-features nix-command flakes 'nixpkg#chezmoi' -- init --apply ModestMeowth
```

### Any OS with Nix Support (will install nix standalone)

#### via curl
``` sh
sh -c "$(curl -L https://raw.githubusercontent.com/ModestMeowth/dotfiles/main/install.sh)"
```
#### via wget
```
sh -c "$(curl -qO- https://raw.githubusercontent.com/ModestMeowth/dotfiles/main/install.sh)"
```
