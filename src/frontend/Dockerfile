# Build stage: install and compile React app
FROM node:18-alpine AS build
WORKDIR /app

# Copy package files & install dependencies
COPY package.json ./
# COPY package-lock.json ./
RUN npm install

# Copy all source and build
COPY public ./public
COPY src ./src
RUN npm run build

# Production stage: serve via nginx
FROM nginx:stable-alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]