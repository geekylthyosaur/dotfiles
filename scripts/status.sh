#!/bin/sh

while true
do
    thermal=$(</proc/acpi/ibm/thermal)
    fan=$(</proc/acpi/ibm/fan)
    power=$(</sys/class/power_supply/BAT0/power_now)
    echo -ne "$(echo $thermal | awk -F" " '{print ""$2""}') °C\t $(echo $fan | awk -F" " '{print ""$4""}') RPM\t $(($power / 1000000)) W/h\r"
    sleep 1
done

