#!/bin/bash
LOGFILE="/var/log/clamav/clamscan.log";
DIRTOSCAN="/host";

if ! pgrep "clamd" ; then
  nohup clamd &>/dev/null &
  sleep 90
fi

for S in ${DIRTOSCAN}; do
 DIRSIZE=$(du -sh "$S" 2>/dev/null | cut -f1);

 echo "Starting an hourly scan of "$S" directory.
 Amount of data to be scanned is "$DIRSIZE".";

 clamdscan -i -l "$LOGFILE" "$S" --stdout;

 # get the value of "Infected lines"
 MALWARE=$(tail "$LOGFILE"|grep Infected|cut -d" " -f3);

 # if the value is not equal to zero, perform an action (not currently implemented)
 # if [ "$MALWARE" -ne "0" ];then
 # using heirloom-mailx below
 # echo "$EMAIL_MSG"|mail -a "$LOGFILE" -s "Malware Found" -r "$EMAIL_FROM" "$EMAIL_TO";
 # fi
done

exit 0
