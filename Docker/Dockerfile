# Pull The Ubuntu Image
FROM ubuntu

# Install Nginx Server and Some Tools
RUN set -x \
	apt-get -y update && apt-get -y upgrade \
        apt-get -y install nginx \
        apt-get -y install wget \
        apt-get -y install ssh \
        apt-get -y install curl \


# Copy The Nginx Configure
COPY nginx.conf /etc/nginx/sites-available/default

# Expose a Port/s
EXPOSE 80/tcp
EXPOSE 22

# Run the Nginx server
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

 
