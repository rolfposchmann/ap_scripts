#!/bin/sh

#mode 0755

# Prepare vars
DATE=$(date +%Y-%m-%d" "%H:%M:%S)
logFile="/root/pingRouterCheckReboot.log" 
 
# Ping and reboot if need
ping -c3 10.10.10.234
 
if [ $? -eq 0 ]; then
    echo "ok" 
    echo "${DATE} - ok" >> $logFile
else
    echo "REBOOT" 
    echo "${DATE} - REBOOT" >> $logFile
    reboot
fi
 
# If the log file size is greater then 100KB (102400 bytes), then renew it.
logFileSize=$(wc -c "$logFile" | awk '{print $1}')
if [ $logFileSize -gt 102400 ]; then
    echo "Size of $logFile = $logFileSize bytes." 
    echo "Renew the log file" 
 
    mv -f $logFile "${logFile}.bk" 
fi

