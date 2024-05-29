# Using node:22-alpine as a base provides a lightweight image with the runtime environment for Node.js
FROM node:22-alpine

# Specify working directory
WORKDIR /usr/src/app

# Copying dependency files
COPY package*.json ./

# Installing dependencies
RUN npm i

# Copying code to work directory
COPY . .

# Exposing the port on which the app is listening
EXPOSE 8000

# Initializing application
CMD ["npm", "run", "start"]

# Performing health checks on the app
HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
  CMD curl -f http://localhost:8000/api/users || exit 1