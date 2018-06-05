#/bin/bash
currentIp=$(hostname -I | cut -d' ' -f2)
previous=$(cat /home/gar/slack_notifications/previousAddress.txt)

if [ "$currentIp" != "$previous"        ]; then
     msg="{\"text\": \"Magos new IP: $currentIp\"}"
     curl -s -d "payload=$msg" "https://hooks.slack.com/services/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"
     echo  $'\n'"Magos new IP: $currentIp" >> /home/gar/slack_notifications/ip_script.log
else
    echo "No IP change." >> /home/gar/slack_notifications/ip_script.log
fi
echo $currentIp > /home/gar/slack_notifications/previousAddress.txt
date >> /home/gar/slack_notifications/ip_script.log
echo "********************" >> /home/gar/slack_notifications/ip_script.log

