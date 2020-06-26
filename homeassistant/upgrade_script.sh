# Turn off HomeAssistant service
echo "Turning off Home Assistant"
sudo systemctl restart home-assistant@pi.service

# Go to HomeAssistant directory
echo "Entering HomeAssistant directory"
cd /home/pi/homeassistant

# Activate venv
echo "Enabling virtualenv"
source bin/activate

# Run upgrade
echo "Upgrading Home Assistant"
python3 -m pip install --upgrade homeassistant

# Exit venv
echo "Exiting..."
deactivate
cd
