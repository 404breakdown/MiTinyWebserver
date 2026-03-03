FROM php:8.2-apache

# Install essential DB dependencies (SQLite)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libsqlite3-dev \
    libzip-dev \
    sqlite3 \
    && docker-php-ext-install pdo pdo_sqlite zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# High-capacity PHP production settings
RUN echo 'memory_limit = 512M' > /usr/local/etc/php/conf.d/docker-php.ini && \
    echo 'upload_max_filesize = 1G' >> /usr/local/etc/php/conf.d/docker-php.ini && \
    echo 'post_max_size = 1.1G' >> /usr/local/etc/php/conf.d/docker-php.ini && \
    echo 'max_execution_time = 300' >> /usr/local/etc/php/conf.d/docker-php.ini

# Enable Apache modules required for .htaccess
RUN a2enmod rewrite headers expires deflate

# Replace default vhost with our custom one
COPY apache-vhost.conf /etc/apache2/sites-available/000-default.conf

# Copy project files
WORKDIR /var/www/html
COPY . /var/www/html/

# Force-copy .htaccess files
COPY .htaccess /var/www/html/.htaccess
COPY data/.htaccess /var/www/html/data/.htaccess

# Fix permissions
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
CMD ["apache2-foreground"]
