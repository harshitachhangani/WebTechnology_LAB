<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "bookstore");

// Function to fetch employee details for modification
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $query = "SELECT * FROM employees WHERE id=$id";
    $result = mysqli_query($conn, $query);
    $employee = mysqli_fetch_assoc($result);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modify Employee</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }

        h2 {
            color: #333;
        }

        form {
            background-color: #fff;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin: 10px 0;
        }

        input {
            width: 100%;
            padding: 8px;
            margin: 5px 0 15px;
            box-sizing: border-box;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        a {
            text-decoration: none;
            color: #2196f3;
        }

        a:hover {
            color: #0d47a1;
        }
    </style>
</head>
<body>
    <h2>Modify Employee</h2>
    
    <!-- Form to modify employee details -->
    <form action="process.php" method="post">
        <input type="hidden" name="id" value="<?php echo $employee['id']; ?>">
        <label for="name">Name:</label>
        <input type="text" name="name" value="<?php echo $employee['name']; ?>" required>
        <label for="position">Position:</label>
        <input type="text" name="position" value="<?php echo $employee['position']; ?>" required>
        <label for="salary">Salary:</label>
        <input type="number" name="salary" value="<?php echo $employee['salary']; ?>" required>
        <button type="submit" name="modify">Modify Employee</button>
    </form>
</body>
</html>
