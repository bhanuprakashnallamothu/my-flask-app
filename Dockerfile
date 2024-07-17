# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install npm dependencies
RUN npm install

# Copy the local code to the container
COPY . .

# Expose port 8080 to the outside world
EXPOSE 8080

# Command to run when the container starts
CMD ["npm", "start"]

