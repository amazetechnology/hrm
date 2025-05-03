<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login - HRM</title>
  <link rel="stylesheet" href="assets/css/style.css">
</head>

<style>
    .toggle-password {
  cursor: pointer;
  margin-left: 10px;
  color: #1abc9c;
  font-weight: bold;
}
.logo{
width: auto;
}
.logo img{
  width: 100%;
}
</style>
<body>

<?php
session_start();
require 'db_connect.php'; // Database connection

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = trim($_POST["email"]);
    $password = $_POST["password"];

    // Fetch user by email
    $sql = "SELECT * FROM employees WHERE email = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    // Check user exists
    if ($result->num_rows === 1) {
        $user = $result->fetch_assoc();

        // Verify password
        if (password_verify($password, $user["password"])) {
            $_SESSION["user_id"] = $user["id"];
            $_SESSION["user_name"] = $user["name"];
            $_SESSION["role"] = $user["role"];

            // Redirect based on role
            if ($user["role"] === "admin") {
                header("Location: admin/admin_dashboard.php");
            } else {
                header("Location: employee/dashboard.php");
            }
            exit();
        } else {
            echo "Invalid password.";
        }
    } else {
        echo "User not found.";
    }

    $stmt->close();
    $conn->close();
}

?>



  <div class="login-box">
    
    <h2>Welcome Back 👋</h2>
    
    <div class="error"></div>
<div class="logo">
  <img src="assets/img/amz-logo.png">
</div>
    <form id="loginForm" action="index.php" method="post">
      <input type="email" id="email" name="email" placeholder="Email" required>

      <div class="password-container">
        <input type="password" id="password" name="password" placeholder="Password" required>
        <span id="togglePassword" class="toggle-password">Show</span>
      </div>

      <button type="submit">Login</button>
      <div class="link">
        <a href="register_employee.php">Registered here</a>
    </div>
    </form>
  </div>

  <script src="js/asets/script.js"></script>


  <script>
  const toggle = document.getElementById("togglePassword");
  const password = document.getElementById("password");

  toggle.addEventListener("click", function () {
    const type = password.getAttribute("type") === "password" ? "text" : "password";
    password.setAttribute("type", type);
    toggle.textContent = type === "password" ? "Show" : "Hide";
  });
</script>

</body>
</html>
