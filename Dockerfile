# Use the lightweight Nginx Alpine image
FROM nginx:alpine

# Copy your static files to the Nginx html directory
COPY . /usr/share/nginx/html

# Cloud Run defaults to port 8080. Nginx defaults to 80.
# We modify the default Nginx config to listen on 8080.
RUN sed -i 's/listen       80;/listen       8080;/' /etc/nginx/conf.d/default.conf

# Expose port 8080
EXPOSE 8080

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]