# Stage 1: Base
# -------------------------------------------------------------------------------------------------------

# Using node:22-alpine as a base provides a lightweight image with the runtime environment for Node.js
FROM node:22-alpine AS base_image

# Create a new user 'devsu-demo-user' and group 'devsu-demo-group'
RUN addgroup -S devsu-group && adduser -S devsu-user -G devsu-group

# Specify working directory
WORKDIR /app

# Copying dependency files
COPY package*.json ./

# Installing dependencies
RUN npm install 

# Set ownership and permissions for the working directory
RUN chown -R devsu-user:devsu-group /app

# Switch to the 'devsu-demo-user'
USER devsu-user

# Stage 2: Build
# -------------------------------------------------------------------------------------------------------
FROM base_image AS build_app

# Copying code to work directory
COPY . .

# Exposing the port on which the app is listening
EXPOSE 8000

# Initializing application
CMD ["npm", "run", "start"]

# Performing health checks on the app
HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
  CMD curl -f http://localhost:8000/api/users || exit 1