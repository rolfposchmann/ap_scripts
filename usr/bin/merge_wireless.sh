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
oldfile = wireless_private_ap.old
newfile = wireless_private_ap

if [[ -f "$newfile" ]]; then
  echo "$newfile exist"

  # Prevent file not found in if-statement
  touch $oldfile

  if diff $oldfile $newfile > /dev/null
  then
    echo "No difference"
  else
    echo "Difference"

    # Merge files
    cat wireless_openwisp " " wireless_private_ap " " > wireless
    cat " " >> wireless

    #Save old file
    mv wireless_private_ap wireless_private_ap.old

  fi
fi
