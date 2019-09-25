FROM php:7.1.30-apache
WORKDIR /var/www
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    git \
    wget \
    nano \
    && docker-php-ext-install -j$(nproc) gd mysqli \
    && docker-php-ext-install -j$(nproc) pdo pdo_mysql
RUN a2enmod rewrite
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === 'a5c698ffe4b8e849a443b120cd5ba38043260d5c4023dbf93e1558871f1f07f58274fc6f4c93bcfd858c6bd0775cd8d1') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN  php composer-setup.php 
RUN  php -r "unlink('composer-setup.php');"
# RUN echo -e "\nalias composer='php /var/www/html/composer.phar'" >> ~/.bashrc 
# RUN source /root/.bashrc
# RUN php composer.phar create-project drupal-composer/drupal-project:8.x-dev d8 --no-interaction
