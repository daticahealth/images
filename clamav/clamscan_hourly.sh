#!/bin/bash
LOGFILE="/var/log/clamav/clamdscan/clamav-$(date +'%Y-%m-%d').log";
DIRTOSCAN="/host";

if ! pgrep "clamd" ; then
  nohup clamd &>/dev/null &
  sleep 30
fi

for S in ${DIRTOSCAN}; do
 DIRSIZE=$(du -sh "$S" 2>/dev/null | cut -f1);

 echo "Starting a daily scan of "$S" directory.
 Amount of data to be scanned is "$DIRSIZE".";

 clamdscan -i -l "$LOGFILE" "$S";

 # get the value of "Infected lines"
 MALWARE=$(tail "$LOGFILE"|grep Infected|cut -d" " -f3);

 # if the value is not equal to zero, perform an action (not currently implemented)
 # if [ "$MALWARE" -ne "0" ];then
 # using heirloom-mailx below
 # echo "$EMAIL_MSG"|mail -a "$LOGFILE" -s "Malware Found" -r "$EMAIL_FROM" "$EMAIL_TO";
 # fi
done

exit 0
