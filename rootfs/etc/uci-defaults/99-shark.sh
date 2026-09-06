#!/bin/sh
# Firstboot setup script for the Shark Jack Display by Hak5

# Change root password
echo -e "hak5shark\nhak5shark\n" | passwd

# Change the hostname
uci set system.@system[0].hostname=shark
uci commit system
echo $(uci get system.@system[0].hostname) > /proc/sys/kernel/hostname

# Disable Shark service - first_boot completion will enable
/etc/init.d/shark disable
/etc/init.d/shark stop

# Enabled by default, will disable themselves upon completion
# /etc/init.d/first_boot enable
# /etc/init.d/first_boot start
# /etc/init.d/first_boot_complete enable
# /etc/init.d/first_boot_complete start

# Disable cc-client
/etc/init.d/cc-client disable
/etc/init.d/cc-client stop

# Disable lldpd
/etc/init.d/lldpd disable
/etc/init.d/lldpd stop

# Disable AutoSSH
/etc/init.d/autossh disable
/etc/init.d/autossh stop

# Disable odhcpd
/etc/init.d/odhcpd disable
/etc/init.d/odhcpd stop

# Disable dnsmasq (controlled by NETMODE)
/etc/init.d/dnsmasq disable
/etc/init.d/dnsmasq stop

# Disable ntpd
/etc/init.d/sysntpd disable
/etc/init.d/sysntpd stop

# Not included on Shark Jack Display
# Disable openvpn
# /etc/init.d/openvpn disable
# /etc/init.d/openvpn stop

# Not included on Shark Jack Display
# Disable uHTTPd web server
# /etc/init.d/uhttpd disable
# /etc/init.d/uhttpd stop

# Disable SSH server
# Enabled by default so that first boot can generate keys, first_boot will disable
# /etc/init.d/sshd disable
# /etc/init.d/sshd stop

# Fix ssh-copy-id
mkdir -p /etc/dropbear/
rm -f /etc/dropbear/authorized_keys

chmod 0700 /root

mkdir -p /root/.ssh
chmod 0700 /root/.ssh

touch /root/.ssh/authorized_keys
chmod 0600 /root/.ssh/authorized_keys

ln -s /root/.ssh/authorized_keys /etc/dropbear/authorized_keys

# Ensure the script is deleted after execution
exit 0
