#!/bin/bash

# Define variables
GNIREHTET_DIR="/etc/gnirehtet-java"
GNIREHTET_SUBDIR="$GNIREHTET_DIR/gnirehtet-java"
GNIREHTET_BIN="/usr/local/bin/gnirehtet"
GNIREHTET_URL="https://github.com/Genymobile/gnirehtet/releases/download/v2.5.1/gnirehtet-java-v2.5.1.zip" # Version gnirehtet-java-v2.5.1

# Check for Java and ADB
if ! command -v java >/dev/null 2>&1; then
    echo "Java is not installed. Please install Java before running gnirehtet."
    exit 1
fi

if ! command -v adb >/dev/null 2>&1; then
    echo "ADB (Android Debug Bridge) is not installed. Please install ADB before running gnirehtet."
    exit 1
fi

# Create directory
sudo mkdir -p $GNIREHTET_DIR

# Download gnirehtet
sudo wget $GNIREHTET_URL -O $GNIREHTET_DIR/gnirehtet.zip

# Unzip and remove the zip file
sudo unzip $GNIREHTET_DIR/gnirehtet.zip -d $GNIREHTET_DIR
sudo rm $GNIREHTET_DIR/gnirehtet.zip

# Modify the gnirehtet script to use the absolute path to the jar file
sudo sed -i 's|gnirehtet.jar|'$GNIREHTET_SUBDIR'/gnirehtet.jar|g' $GNIREHTET_SUBDIR/gnirehtet

# Create a symbolic link to the script in the subdirectory
sudo ln -sf $GNIREHTET_SUBDIR/gnirehtet $GNIREHTET_BIN

# Make the script executable
sudo chmod +x $GNIREHTET_BIN

echo "Gnirehtet has been installed and configured."
