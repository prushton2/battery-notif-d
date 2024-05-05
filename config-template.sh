#!/bin/bash
battery_dir="/sys/class/power_supply/BAT1/"; #must end in slash
notify_low_command="dunstify -a System 'Battery Low' 'Battery at 20%'";
low_battery_percentage=20;
notify_critical_command="dunstify -a System 'Critical Battery' 'Battery at 10%'";
critical_battery_percentage=10;
update_time=60; #time between checks of the battery
