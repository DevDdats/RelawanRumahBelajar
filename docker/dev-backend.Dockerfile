# DEVELOPMENT IMAGE. Docker Compose mounts ./backend into /var/www/html.
# Keep dependencies/extensions here; production image should use a separate Dockerfile.
FROM php:8.4-cli

RUN apt-get update && apt-get install -y --no-install-recommends \
    git unzip zip curl libzip-dev libicu-dev libpng-dev libonig-dev libxml2-dev libcurl4-openssl-dev \
    && docker-php-ext-install pdo_mysql mbstring bcmath exif pcntl intl zip dom xml curl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer
WORKDIR /var/www/html
EXPOSE 8000
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
