# Sử dụng môi trường PHP 8.1 kèm Apache
FROM php:8.1-apache

# Cài đặt thư viện kết nối database MySQL (mysqli và pdo_mysql)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Bật tính năng mod_rewrite của Apache (nếu web dùng file .htaccess)
RUN a2enmod rewrite

# Copy toàn bộ mã nguồn vào thư mục root của web server
COPY . /var/www/html/

# Cấp quyền đọc/ghi cho thư mục
RUN chown -R www-data:www-data /var/www/html

# Mở cổng 80
EXPOSE 80