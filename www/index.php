<?php
$mysqli = new mysqli("db", "user", "password", "test_db");

echo "hello gorlsdgd";

// Check connection
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}
echo "Connected successfully to MySQL database!<br>";

// Define the new database name
$newDbName = "new_database";

// SQL query to create a new database
$sql = "CREATE DATABASE IF NOT EXISTS $newDbName";

if ($mysqli->query($sql) === TRUE) {
    echo "Database '$newDbName' created successfully or already exists!<br>";
} else {
    echo "Error creating database: " . $mysqli->error . "<br>";
}

// Switch to the new database
$mysqli->select_db($newDbName);



// Create a new table in the new database
$tableName = "users";
$tableSql = "CREATE TABLE IF NOT EXISTS $tableName (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(30) NOT NULL,
    email VARCHAR(50) NOT NULL,
    reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)";

if ($mysqli->query($tableSql) === TRUE) {
    echo "Table '$tableName' created successfully in '$newDbName' database!<br>";
} else {
    echo "Error creating table: " . $mysqli->error . "<br>";
}

// Close the connection
$mysqli->close();
?>
