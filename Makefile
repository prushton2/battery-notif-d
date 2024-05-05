install:
	cp ./service.service /etc/systemd/user/battery-notif-d.service
	cp ./script.sh /usr/bin/battery-notif-d.sh
	mkdir /etc/battery-notif-d
	cp ./config-template.sh /etc/battery-notif-d/config.sh
uninstall:
	rm /usr/bin/battery-notif-d.sh
	rm -rf /etc/battery-notif-d
	rm /etc/systemd/user/battery-notif-d.service
