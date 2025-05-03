<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Employee Management</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>

  <div class="employee-container">
    <div class="employee-header">
      <h2>Employee Management</h2>
      <button onclick="addEmployee()">+ Add Employee</button>
    </div>

    <input type="text" class="search-box" id="searchInput" onkeyup="searchEmployee()" placeholder="Search by name or email...">

    <table class="employee-table">
      <thead>
        <tr>
          <th>ID</th>
          <th>Full Name</th>
          <th>Email</th>
          <th>Department</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody id="employeeTable">
        <tr>
          <td>1</td>
          <td>Rahul Sharma</td>
          <td>rahul@example.com</td>
          <td>HR</td>
          <td>
            <button class="action-btn action-edit" onclick="editEmployee()">Edit</button>
            <button class="action-btn action-delete" onclick="deleteEmployee()">Delete</button>
          </td>
        </tr>
        <tr>
          <td>2</td>
          <td>Priya Verma</td>
          <td>priya@example.com</td>
          <td>IT</td>
          <td>
            <button class="action-btn action-edit" onclick="editEmployee()">Edit</button>
            <button class="action-btn action-delete" onclick="deleteEmployee()">Delete</button>
          </td>
        </tr>
        <!-- More employee rows here -->
      </tbody>
    </table>
  </div>

  <script src="js/employee.js"></script>
</body>
</html>
