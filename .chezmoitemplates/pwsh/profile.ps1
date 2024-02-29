function bw {
    if(-not (Test-Path env:BW_SESSION) -or ($args[0] -eq "unlock")) {
        $env:BW_SESSION=(bw.exe unlock --raw)
    }

    if(-not ($args[0] -eq "unlock")) {
        Invoke-Expression ("bw.exe " + $args)
    }
}

Invoke-Expression (&starship init powershell)
