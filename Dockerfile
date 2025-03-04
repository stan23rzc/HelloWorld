# Use a Maven base image with OpenJDK 11

FROM maven:3.8.4-openjdk-11-slim

# Install git

RUN apt-get update && apt-get install -y git

# Create a working directory inside the container

WORKDIR /app

# Clones the repository from GitHub

RUN git clone https://github.com/stan23rzc/helloworldweb.git

# Change the directory of the cloned repository

WORKDIR /app

# Change the main branch where the project sources are located

RUN git checkout main || git checkout main


#Download the latest changes from the repository in the indicated branch

RUN git pull origin main

# Run the construction process with Maven

RUN mvn clean package

# Change the directory where the JAR file is located

WORKDIR /app/HelloWorld/target

# Establish the execution command to start the application

CMD ["java", "-jar", "helloworldjavaWeb-1.0.jar"]
