netsh advfirewall firewall add rule name="Block_Web" protocol=TCP dir=in remoteport=80 action=block
netsh advfirewall firewall add rule name="Block_Web" protocol=TCP dir=out remoteport=80 action=block
netsh advfirewall firewall add rule name="Block_Web" protocol=TCP dir=in remoteport=443 action=block
netsh advfirewall firewall add rule name="Block_Web" protocol=TCP dir=out remoteport=443 action=block