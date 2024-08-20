# Use the official Ubuntu base image from the Docker library
FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

# Install Node.js and npm (necessary for Next.js)
RUN apt-get update && apt-get install -y \
    nodejs \
    npm

# Install MongoDB
RUN apt-get install -y mongodb

# Install Python and pip
RUN apt-get install -y python3 python3-pip

# Install Django using pip
RUN pip3 install django

# Set the working directory inside the container
WORKDIR /workspace

# Install Next.js (and any other dependencies)
# This assumes you have a package.json file with Next.js listed as a dependency.
COPY package*.json ./
RUN npm install

# Expose ports (optional, if you need to expose services running inside the container)
EXPOSE 3000 8000 27017

# Start any services or applications (optional; usually done in the Docker Compose file or manually)
