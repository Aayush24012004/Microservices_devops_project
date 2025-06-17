# Base image
FROM node:18-alpine

# Create app directory
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Bundle app source
COPY . .

# If auth-service listens on PORT env or default 3000
ENV PORT=3000
EXPOSE 3000

# Start the service
CMD ["npm", "start"]