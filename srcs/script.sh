mv default etc/nginx/sites-available/default
service nginx start
service php7.3-fpm start
service mysql start
mysql -u root < ../dbinit.sql
mysql -u root < /var/www/html/phpmyadmin/sql/create_tables.sql
rm dbinit.sql
bash