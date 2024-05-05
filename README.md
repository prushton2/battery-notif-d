# Battery Notification Daemon
A systemd battery notification daemon to send notifications at low battery levels
## Installing
Clone the repo and cd to the repo
```
$ git clone https://github.com/prushton2/battery-notif-d
$ cd battery-notif-d
```
Run make install as sudo
```
$ sudo make install
```

## Running
This is a systemd service in user space, start it like so
```
$ systemctl start battery-notif-d --user
```


## Configuring
A config file is located in `/etc/battery-notif-d/config.sh`
```
#!/bin/bash
battery_dir="/sys/class/power_supply/BAT1/";                                      # Directory of the battery to read, must end in a /
notify_low_command="dunstify -a System 'Battery Low' 'Battery at 30%'";           # Low battery notification
low_battery_percentage=30;                                                        # Low battery percentage
notify_critical_command="dunstify -a System 'Critical Battery' 'Battery at 20%'"; # Critical battery notification
critical_battery_percentage=20;                                                   # Critical battery percentage
update_time=60;                                                                   # Time between checks of the battery 
```

After modifying the config, restart the service to load the changes
```
$ systemctl restart battery-notif-d --user
```

## Uninstalling
run the make uninstall as sudo
```
$ sudo make uninstall
```
