#!/bin/bash

# Check if dependencies are installed
if ! command -v battery >/dev/null 2>&1; then
    echo -e >&2 "\n'battery' is not installed.\n\nInstallation:\ncurl -s https://raw.githubusercontent.com/actuallymentor/battery/main/setup.sh | bash\n\nAborting...\n"
	osascript -e 'display notification "'"Aborted"'" with title "'"Battery Calibration"'" sound name "'"tink"'"'
    exit 1
fi

# Function to display a notification
send_notification() {
	osascript -e 'display notification "'"$1"'" with title "'"$2"'" sound name "'"$3"'"'
}

# Stop the maintaining
battery maintain stop

# Discharge battery to 15%
send_notification "Discharging battery to 15%" "Initialising Battery Calibration" "blow"
battery discharge 15

while true; do
	echo "checking if at 100%"
    # Check if battery level has reached 100%
    if battery status | head -n 1 | grep -q "Battery at 100%"; then
        break
        else
        sleep 300
        continue
    fi
done

# Wait before discharging to target level
echo "reached 100%, maintaining for 1 hour"
send_notification "100% charged, holding for 1 hour" "Battery Calibration" "blow"
sleep 3600

# Discharge battery to 15%
send_notification "Discharging battery to 80%" "Ending Battery Calibration" "blow"
battery discharge 80

# Maintain battery to 80%
send_notification "Maintaining at 80%" "Battery Calibration Complete" "default"
battery maintain 80
exit