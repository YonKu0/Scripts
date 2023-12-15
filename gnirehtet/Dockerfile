# Use an appropriate base image, like Ubuntu
FROM ubuntu:latest

# Update and install necessary packages including ADB, wget, and unzip
RUN apt-get update && \
    apt-get install -y adb openjdk-11-jre-headless wget unzip && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /gnirehtet

# Define variables for Gnirehtet
ENV GNIREHTET_DIR="/gnirehtet"
ENV GNIREHTET_SUBDIR="$GNIREHTET_DIR/gnirehtet-java"
ENV GNIREHTET_BIN="/usr/local/bin/gnirehtet"
ENV GNIREHTET_URL="https://github.com/Genymobile/gnirehtet/releases/download/v2.5.1/gnirehtet-java-v2.5.1.zip"

# Create directory
RUN mkdir -p $GNIREHTET_DIR

# Download gnirehtet
RUN wget $GNIREHTET_URL -O $GNIREHTET_DIR/gnirehtet.zip

# Unzip and remove the zip file
RUN unzip $GNIREHTET_DIR/gnirehtet.zip -d $GNIREHTET_DIR && \
    rm $GNIREHTET_DIR/gnirehtet.zip

# Modify the gnirehtet script to use the absolute path to the jar file
RUN sed -i 's|gnirehtet.jar|'$GNIREHTET_SUBDIR'/gnirehtet.jar|g' $GNIREHTET_SUBDIR/gnirehtet

# Create a symbolic link to the script in the subdirectokali

RUN ln -sf $GNIREHTET_SUBDIR/gnirehtet $GNIREHTET_BIN

# Make the script executable
RUN chmod +x $GNIREHTET_BIN

# Copy the start script and make it executable
COPY start.sh /gnirehtet/start.sh
RUN chmod +x /gnirehtet/start.sh

# At the end of your Dockerfile, add a volume for ADB keys
VOLUME ["/root/.android"]

# Command to run when the container starts
CMD ["/gnirehtet/start.sh"]

# Add a health check (adjust the command as necessary for your application)
HEALTHCHECK --interval=5s --timeout=5s --start-period=3s --retries=3 \
    CMD cat gnirehtetlog.txt | grep 'TunnelServer: Client #0 connected' || exit 1
