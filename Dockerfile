FROM php:8.4-apache

# Instalar el instalador de extensiones de PHP oficial de la comunidad
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

# Darle permisos de ejecución e instalar el driver pdo_mysql de forma nativa
RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions pdo_mysql

RUN a2enmod rewrite
# El resto de tu configuración de Apache que ya tenías
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf \
    && sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
