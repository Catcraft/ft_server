FROM debian:buster

LABEL Nicolas NIEDDU <ninieddu@student.le-101.fr>

COPY srcs/script.sh ./
COPY srcs/config.inc.php ./
COPY srcs/default ./
COPY srcs/dbinit.sql ./

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y nginx mariadb-server php-fpm php-mysql php-mbstring wget ssl-cert

RUN wget https://fr.wordpress.org/latest-fr_FR.tar.gz && tar -zxvf latest-fr_FR.tar.gz && mv wordpress /var/www/html/wordpress && rm latest-fr_FR.tar.gz && chown -R www-data:www-data /var/www/html/wordpress/

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz && mkdir /var/www/html/phpmyadmin && tar xzf phpMyAdmin-5.0.1-english.tar.gz --strip-components=1 -C /var/www/html/phpmyadmin && rm phpMyAdmin-5.0.1-english.tar.gz && mv config.inc.php /var/www/html/phpmyadmin/ && chown -R www-data:www-data /var/www/html/phpmyadmin

CMD bash script.sh