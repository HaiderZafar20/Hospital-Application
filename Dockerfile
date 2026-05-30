# Use an official Node.js runtime as the base image
FROM node:20-slim

# Create app directory
WORKDIR /usr/src/app

# Copy package files and install only production dependencies
COPY backend/package*.json ./backend/
RUN cd backend && npm install --production

# Copy backend source and public assets
COPY backend/ ./backend/
COPY public/ ./public/

# Default environment variables
ENV NODE_ENV=production
ENV PORT=5000

# Expose the port the app listens on
EXPOSE 5000

# Start the server
CMD ["node", "backend/app.js"]
