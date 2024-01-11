function Prompt {
    $Env:COMPUTERNAME + "\\" + (Get-Location) + "> "
}

function bw {
    if(-not (Test-Path env:BW_Session ) -or ($args[0] -eq "unlock")) {
        $env:BW_SESSION=(bw.exe unlock --raw)
    }

    if(-not ($args[0] -eq "unlock")) {
        Invoke-Expression("bw.exe " + $args)
    }
}

function ln ($target, $link) {
    if ($null -eq $link) {
       $link = (Get-Item $target).Basename
    }
}

function lns ($target, $link) {
    if ($null -eq $link) {
       $link = (Get-Item $target).Basename
    }

    New-Item -Path $link -ItemType SymbolicLink -Value $target
}
function lnh ($target, $link) {
    if ($null -eq $link) {
       $link = (Get-Item $target).Basename
    }

    New-Item -Path $link -ItemType HardLink -Value $target
}
function lnj ($target, $link) {
    if ($null -eq $link) {
       $link = (Get-Item $target).Basename
    }
    New-Item -Path $link -ItemType Junction -Value $target
}

Invoke-Expression (&starship init powershell)