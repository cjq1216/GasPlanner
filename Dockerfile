# Stage 1: Build the application
FROM node:24-alpine AS builder

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy source code
COPY . .

# Build the library first, then the app
RUN npm run build-lib && npm run build

# Stage 2: Serve with Nginx
FROM nginx:alpine

# Copy built application to Nginx html directory
COPY --from=builder /app/dist/planner /usr/share/nginx/html

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]