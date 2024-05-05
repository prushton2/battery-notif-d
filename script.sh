DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo "Battery Notification Daemon started at ${DATE}" | systemd-cat -p info

source /etc/battery-notif-d/config.sh

notified_low=0;
notified_critical=0;

while :
do
	DATE=`date '+%Y-%m-%d %H:%M:%S'`
	percentage=10;#$(( $(cat ${battery_dir}charge_now) * 100 / $(cat ${battery_dir}charge_full)));
	
	if [ $percentage -gt $low_battery_percentage ]; then
		echo "[${DATE}]: Battery charged above low level" | systemd-cat -p info
		notified_low=0;
	fi

	if [ $percentage -gt $critical_battery_percentage ]; then
		echo "[${DATE}]: Battery charged above critical level" | systemd-cat -p info
		notified_critical=0;
	fi

	if [ "$(cat ${battery_dir}status)" = "Charging" ]; then
		continue;
	fi
	
	if [ $percentage = $low_battery_percentage ] && [ $notified_low -eq 0 ]; then
		echo $notify_low_command | /bin/bash
		echo "[${DATE}]: Sent notification of low battery" | systemd-cat -p info
		notified_low=1;
	fi

	if [ "$percentage" = "$critical_battery_percentage" ] && [ $notified_critical -eq 0 ]; then
		echo $notify_critical_command | /bin/bash
		echo "[${DATE}]: Sent notification of critical battery" | systemd-cat -p info
		notified_critical=1;
	fi
	sleep ${update_time};
done
