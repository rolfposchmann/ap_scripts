#!/bin/sh

#mode 0755

echo && echo 5G Clients: && echo ============= && iwinfo wlan5G assoclist && echo && echo 2G Clients: && echo ============= &&  iwinfo wlan2G assoclist
