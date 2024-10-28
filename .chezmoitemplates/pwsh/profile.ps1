$Env:DIRENV_CONFIG = "$Env:LOCALAPPDATA\direnv"
$Env:XDG_CACHE_HOME = "$Env:USERPROFILE\.local\cache"
$Env:XDG_DATA_HOME = "$Env:USERPROFILE\.local\share"

$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}

function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function la { Get-ChildItem -Force }

function justup {
    winget pin remove -e Casey.Just
    winget upgrade -e Casey.Just
    winget pin add -e Casey.Just
}

Remove-Alias -Name ls

function ls { eza.exe --icons --sort=type }

function ll { eza.exe -l --icons --sort=type }

function la { eza.exe -la --icons --sort=type }

function tree { eza.exe -T --icons --sort=type }

Set-Alias -Name cd -Value __zoxide_z -Option AllScope -Scope Global -Force
Set-Alias -Name ci -Value __zoxide_zi -Option AllScope -Scope Global -Force

Set-Alias -Name grep -Value findstr

Set-Alias -Name vi -Value nvim
Set-Alias -Name vim -Value nvim

Set-Alias -Name j -Value just

Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell | Out-String) })
