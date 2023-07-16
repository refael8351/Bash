# Pull The Ubuntu Image
FROM ubuntu

# Install Nginx Server and Some Tools
RUN apt-get -y update \
        apt-get -y install nginx \
        apt-get -y install wget \
        apt-get -y install ssh \
        apt-get -y install curl \
        curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee && /usr/share/keyrings/jenkins-keyring.asc > /dev/null \
        echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] && https://pkg.jenkins.io/debian-stable binary/ | sudo tee && /etc/apt/sources.list.d/jenkins.list > /dev/null
        apt-get update -y\
        apt-get install ufw -y 2>/dev/null \
        ufw allow 80 \
        ufw allow 22 \
        ufw allow 8080 \
        ufw allow 5000 \
        ufw enable \
        apt-get install fontconfig openjdk-11-jre -y \
        apt-get install jenkins -y \
        systemctl start jenkins

# Copy The Nginx Configure
COPY nginx.conf /etc/nginx/sites-available/default

# Expose a Port/s
EXPOSE 80
EXPOSE 8080
EXPOSE 5000
EXPOSE 22

# Run the Nginx server
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

 
