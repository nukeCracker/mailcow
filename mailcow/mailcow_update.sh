#!/bin/bash
echo "Updatecheck Mailcow"
updateexist="$(cd /opt/mailcow-dockerized && echo 'y' | ./update.sh --check | tail -n 1)"
if [ "$updateexist" = "Updated code is available." ]
    then
    echo "Mailcow Update available" | mail -s "INFO: Mailcow Update available" root@example.de <<< "Mailcow update.sh output: $updateexist"
elif  [ "$updateexist" = "No updates available." ] 
    then
        echo "No Mailcow Update available" | mail -s "INFO: No Mailcow Update available" root@example.de <<< "Mailcow update.sh output: $updateexist"
    else
        echo "Mailcow Update unknown" | mail -s "INFO: Mailcow Update unknown" root@example.de <<< "Mailcow update.sh output: $updateexist"
fi
