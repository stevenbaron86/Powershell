$mac = read-host "MAC ADDRESS? Format XX-XX-XX-XX-XX-XX"

arp -a | select-string "$mac" 