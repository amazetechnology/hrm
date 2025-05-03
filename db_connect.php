
<?php
$host = "localhost";      // Database host
$user = "root";           // Database username (default is 'root' for XAMPP)
$password = "";           // Database password (usually blank for XAMPP)
$database = "employee_db"; // Your database name

// Create connection
$conn = new mysqli($host, $user, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
