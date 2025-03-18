FROM nginx:latest

# Remove the default Nginx configuration file
RUN rm -rf /usr/share/nginx/html/*

# Copy the HTML file to the Nginx web root directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 to allow access to the webpage
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
