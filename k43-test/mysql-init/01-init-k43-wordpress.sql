-- Initialize Keyclock db
CREATE USER 'k43_wordpress_user' IDENTIFIED BY '1234';
CREATE DATABASE IF NOT EXISTS k43_wordpress_db;
GRANT ALL PRIVILEGES ON k43_wordpress_db.* TO 'k43_wordpress_user';

