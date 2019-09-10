#!/bin/sh

#/usr/bin/merge_wireless.sh
#mode: 0755

#/etc/crontabs/cron.update
#mode:0755
#root


#/etc/crontabs/root
#mode: 0755
#*/10 * * * * /usr/bin/merge_wireless.sh >/dev/null 2>&1

cd /etc/config/

if [[ -f "wireless_private_ap" ]]; then
  echo "wireless_private_ap exist"

  # Prevent file not found in if-statement
  touch  wireless_private_ap.old
  
  if diff wireless_private_ap wireless_private_ap.old > /dev/null
  then
    echo "No difference"
  else
    echo "Difference: in private ap conf"

    # Merge files
    cat wireless_openwisp " " wireless_private_ap " " > wireless
    cat " " >> wireless

    #Save old file
    cp wireless_private_ap wireless_private_ap.old

    wifi down && wifi up

  fi
else
  if diff wireless_openwisp wireless > /dev/null
  then
    echo "No difference"
  else
    echo "Difference: wireless <-> wireless_openwisp"

    cp wireless_openwisp wireless
    wifi down && wifi up

    if ! [[ -f "wireless_private_ap" ]]; then
      echo "wirless_prive_ap not existing.. deleting old save file"
      rm wireless_private_ap.old

    fi

  fi
fi
