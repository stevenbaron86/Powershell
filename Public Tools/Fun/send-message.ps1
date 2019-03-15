Param(
    [Parameter(Mandatory=$true, Position=0)]
    [string]$computerName,

    [Parameter(Mandatory=$true, Position=0)]
    [string]$message
)


Invoke-WmiMethod -Class Win32_Process -ComputerName $computerName -Name Create -ArgumentList "C:\Windows\System32\msg.exe * $message" | Out-Null