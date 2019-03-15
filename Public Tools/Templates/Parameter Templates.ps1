[cmdletbinding()]

#mandatory parm
Param(
    [Parameter(Mandatory=$true, Position=0)]
    [string]$computerName
)

#switch example
param(
    [string]$Switch1, 
    [switch]$Switch2)

if ($switch2) { Write-Host $switch1 }