install:
	sudo cp ./script.sh /usr/bin/battery-notif-d.sh
	sudo cp ./service.service /lib/systemd/system/battery-notif-d.service
	sudo mkdir /etc/battery-notif-d
	sudo cp ./config-template.sh /etc/battery-notif-d/config.sh
uninstall:
	sudo rm /usr/bin/battery-notif-d.sh
	sudo rm /lib/systemd/system/battery-notif-d.service
	sudo rm -rf /etc/battery-notif-d

