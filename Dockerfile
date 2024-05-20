# Use the official Nginx image from Docker Hub
FROM nginx:latest

# Copy custom configuration file from the current directory
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the static HTML file to the Nginx HTML directory
COPY index.html /usr/share/nginx/html/index.html