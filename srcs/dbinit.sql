CREATE DATABASE wordpress;
CREATE DATABASE phpmyadmin;
CREATE USER 'nini'@'localhost' IDENTIFIED BY 'nini';
GRANT ALL PRIVILEGES ON *.* TO 'nini'@'localhost';
FLUSH PRIVILEGES;
exit