# Use an appropriate base image, like Ubuntu
FROM ubuntu:latest

# Update and install necessary packages including ADB
RUN apt-get update && \
    apt-get install -y wget unzip adb openjdk-11-jre-headless && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /gnirehtet

# Download the Gnirehtet zip file
RUN wget https://github.com/Genymobile/gnirehtet/releases/download/v2.5.1/gnirehtet-java-v2.5.1.zip

# Unzip the file and delete the zip file
RUN unzip gnirehtet-java-v2.5.1.zip && \
    rm gnirehtet-java-v2.5.1.zip

# Change to the directory where the gnirehtet executable is located
WORKDIR /gnirehtet/gnirehtet-java

# Copy the start script and make it executable
COPY start.sh /gnirehtet/gnirehtet-java/start.sh
RUN chmod +x /gnirehtet/gnirehtet-java/start.sh

# At the end of your Dockerfile, add a volume for ADB keys
VOLUME ["/root/.android"]

# Command to run when the container starts
CMD ["/gnirehtet/gnirehtet-java/start.sh"]

##############################################################
#Comment the code above and ancomment the code below to run the linux64 vesrion isnted of the java

# # Use an appropriate base image, like Ubuntu
# FROM ubuntu:latest

# # Update and install necessary packages including ADB
# RUN apt-get update && \
#     apt-get install -y wget unzip adb && \
#     rm -rf /var/lib/apt/lists/*

# # Set the working directory
# WORKDIR /gnirehtet

# # Download the Gnirehtet zip file
# RUN wget https://github.com/Genymobile/gnirehtet/releases/download/v2.5.1/gnirehtet-rust-linux64-v2.5.1.zip

# # Unzip the file and delete the zip file
# RUN unzip gnirehtet-rust-linux64-v2.5.1.zip && \
#     rm gnirehtet-rust-linux64-v2.5.1.zip

# # Change to the directory where the gnirehtet executable is located
# WORKDIR /gnirehtet/gnirehtet-rust-linux64

# # Copy the start script and make it executable
# COPY start.sh /gnirehtet/gnirehtet-rust-linux64/start.sh
# RUN chmod +x /gnirehtet/gnirehtet-rust-linux64/start.sh

# At the end of your Dockerfile, add a volume for ADB keys
# VOLUME ["/root/.android"]

# # Command to run when the container starts
# CMD ["/gnirehtet/gnirehtet-rust-linux64/start.sh"]
