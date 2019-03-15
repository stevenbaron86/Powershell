$filter = {
    enabled -eq $true -and
    Name -notlike "Floor*" -and
    Name -notlike "phoenix*" -and
    Name -notlike "*Conference*"
}

