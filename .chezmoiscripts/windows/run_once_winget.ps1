$winget_progs = @(
    'gerardog.gsudo'
    'Casey.Just'
    'direnv.direnv'
    'Starship.Starship'
    'Neovim.Neovim'
    'zig.zig'
)

"--- Install programs from WinGet"

foreach ($prog in $winget_progs) {
    "`n======[ {0} ]======`n" -f $prog
    & winget install --accept-package-agreements --no-upgrade "$prog"
}

"`n--- Complete"
