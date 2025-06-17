# Use lightweight Node.js runtime
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy and install dependencies
COPY package.json ./
# COPY package-lock.json ./  # uncomment if you have lock file
RUN npm install --production

# Copy service code\ nCOPY . .

# Expose port matching code (3001)
ENV PORT=3001
EXPOSE 3001

# Start the service
CMD ["node", "index.js"]