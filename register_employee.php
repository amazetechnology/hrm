<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Register Employee</title>
  <link rel="stylesheet" href="assets/css/style.css">
</head>
<style>
    select {
  width: 100%;
  padding: 12px 15px;
  margin-bottom: 20px;
  border: 1px solid #ccc;
  border-radius: 8px;
  font-size: 16px;
  outline: none;
  transition: border-color 0.3s;
}

select:focus {
  border-color: #1abc9c;
}

.toggle-password {
  cursor: pointer;
  color: #1abc9c;
  margin-left: 10px;
  font-weight: 600;
}
</style>
<body>

<?php
    require 'db_connect.php'; // include your database connection file

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $name     = trim($_POST["name"]);
        $email    = trim($_POST["email"]);
        $password = trim($_POST["password"]);
        $role     = $_POST["role"];
    
        // Encrypt password
        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
    
        // Check if email already exists
        $check = $conn->prepare("SELECT id FROM employees WHERE email = ?");
        if (!$check) {
            die("Check prepare failed: " . $conn->error);
        }
        $check->bind_param("s", $email);
        $check->execute();
        $result = $check->get_result();
    
        if ($result->num_rows > 0) {
            echo "<script>alert('Email already exists. Please use another email.'); window.location.href='register.php';</script>";
        } else {
            $stmt = $conn->prepare("INSERT INTO employees (name, email, password, role) VALUES (?, ?, ?, ?)");
            if (!$stmt) {
                die("Insert prepare failed: " . $conn->error);
            }
            $stmt->bind_param("ssss", $name, $email, $hashedPassword, $role);
    
            if ($stmt->execute()) {
                echo "<script>alert('Registration successful! You can now login.'); window.location.href='index.php';</script>";
            } else {
                echo "Error: " . $stmt->error;
            }
    
            $stmt->close();
        }
    
        $check->close();
        $conn->close();
    }
    
?>

  <div class="login-box">
    
    <h2>Employee Registration</h2>
    
    <div class="error"></div>

  

    <form id="registerForm" action="register_employee.php" method="post">
  <input type="text" name="name" placeholder="Full Name" required>
  <input type="email" name="email" placeholder="Email Address" required>


  <div class="password-container">
  <input type="password" id="password" name="password" placeholder="Password" required>
  <span id="togglePassword" class="toggle-password">Show</span>
</div>

  <!-- <div class="password-container">
    <input type="password" name="password" placeholder="Password" required>
    <span id="togglePassword" class="toggle-password">Show</span>
  </div> -->

  <select name="role" required>
    <option value="">Select Role</option>
    <option value="employee">Employee</option>
    <option value="admin">Admin</option>
  </select>

  <button type="submit">Register</button>
</form>


    <div class="link">
      Already registered? <a href="index.php">Login here</a>
    </div>
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
