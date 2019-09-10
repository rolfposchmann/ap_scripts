#!/bin/sh

#mode 0755

#Problem: da unser Netzwerk zurzeit kein IPv6 unterstützt gibt es auf dem AP eine log spam und process startup overhead.
#Jedoch ist es ganz gut wenn die Funktionalität schon im Image ist, jedoch kann sie erstmal deaktiviert werden

#Fheler: daemon.warn odhcpd[1495]: DHCPV6 SOLICIT IA_NA from

/sbin/uci set 'network.lan.ipv6=off'
/sbin/uci set 'network.wan.ipv6=off'
/sbin/uci set 'dhcp.lan.dhcpv6=disabled'
/etc/init.d/odhcpd disable
/sbin/uci commit
echo "network.lan.ipv6="
/sbin/uci get 'network.lan.ipv6'
echo "network.wan.ipv6="
/sbin/uci get 'network.wan.ipv6'
echo "dhcp.lan.dhcpv6="
/sbin/uci get 'dhcp.lan.dhcpv6'

