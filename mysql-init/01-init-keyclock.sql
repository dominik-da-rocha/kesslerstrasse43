-- Initialize Keyclock db
CREATE USER 'keycloak_user' IDENTIFIED BY 'TOP-SECRET-1234';
CREATE DATABASE IF NOT EXISTS keycloak_db;
GRANT ALL PRIVILEGES ON keycloak_db.* TO 'keycloak_user';