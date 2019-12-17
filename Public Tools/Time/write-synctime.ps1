<#
.SYNOPSIS
Start-Sleep with updates

.DESCRIPTION
VSCode doesn't support write-progress in the PS Integrated terminal without modifications.
This is start-sleep with the ability to write-host at changeable intervals to report seconds left. 

.PARAMETER Seconds
How many seconds to sleep

.PARAMETER Interval
How frequent to write host, in seconds

.EXAMPLE
write-synctime -seconds 300 -interval 60
Writes time remaining every 60 seconds

#>

function write-synctime
{
    Param(
        [Parameter(Mandatory=$true, Position=0)]
        [int]$seconds,

        [Parameter(Position=1)]
        [int]$interval = 60
    )

    $time = $seconds/$interval
    $i = 0
    while ($i -lt $time) {
        $remaining = $seconds - ( $interval * $i )
        write-host "$remaining seconds remaining" -ForegroundColor Green
        Start-Sleep $interval
        $i ++
    }
}

