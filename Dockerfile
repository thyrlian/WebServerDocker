# ====================================================================== #
# HTTP Web Server Docker Image
# ====================================================================== #

# Base image
# ---------------------------------------------------------------------- #
FROM ubuntu:16.04

# Author
# ---------------------------------------------------------------------- #
LABEL maintainer "thyrlian@gmail.com"

# install essential tools
RUN apt-get update -y && \
    apt-get install -y wget

# install and configure the Apache Web Server
ENV DOMAIN_NAME basgeekball.com
ENV PUBLIC_DIR /var/www/$DOMAIN_NAME/public_html
RUN apt-get update -y && \
    apt-get install -y apache2 && \
    sed -i "s%\(^\s*DocumentRoot\s*\).*%\1$PUBLIC_DIR%g" /etc/apache2/sites-available/000-default.conf && \
    echo "\n<Directory /var/www/$DOMAIN_NAME>\n        Options Indexes FollowSymLinks\n</Directory>\n" >> /etc/apache2/apache2.conf && \
    a2enmod ssl && \
    mkdir /etc/apache2/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/apache.key -out /etc/apache2/ssl/apache.crt -subj "/C=DE/ST=Berlin/L=Berlin/CN=$DOMAIN_NAME" && \
    sed -i "s%\(^\s*DocumentRoot\s*\).*%\1$PUBLIC_DIR%g" /etc/apache2/sites-available/default-ssl.conf && \
    sed -i "s%\(^\s*SSLCertificateFile\s*\).*%\1/etc/apache2/ssl/apache.crt%g" /etc/apache2/sites-available/default-ssl.conf && \
    sed -i "s%\(^\s*SSLCertificateKeyFile\s*\).*%\1/etc/apache2/ssl/apache.key%g" /etc/apache2/sites-available/default-ssl.conf && \
    a2ensite default-ssl.conf
EXPOSE 80 443
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
