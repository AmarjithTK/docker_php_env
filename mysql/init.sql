-- Grant all privileges to the user
GRANT ALL PRIVILEGES ON *.* TO 'user'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;

-- Apply changes
FLUSH PRIVILEGES;

-- Create the initial database
CREATE DATABASE IF NOT EXISTS test_db;
