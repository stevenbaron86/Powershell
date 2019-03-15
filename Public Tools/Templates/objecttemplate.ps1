
#initialize array
$array = @()

#inside foreach loop
        $object = New-Object -typename psobject -property `
        @{
            Computer = $computer.name
            Used_Space = [math]::round(($disk.size - $disk.freespace)/1Gb)
            Disk_Size = [math]::round($disk.size/1gb)
        }

        $array += $object