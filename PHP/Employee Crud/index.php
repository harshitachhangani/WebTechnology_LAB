<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Records</title>
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

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #4caf50;
            color: #fff;
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
    <h2>Employee Records</h2>
    
    <!-- Form to add a new employee -->
    <form action="process.php" method="post">
        <label for="name">Name:</label>
        <input type="text" name="name" required>
        <label for="position">Position:</label>
        <input type="text" name="position" required>
        <label for="salary">Salary:</label>
        <input type="number" name="salary" required>
        <button type="submit" name="add">Add Employee</button>
    </form>

    <!-- List of employees -->
    <h3>Employee List</h3>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Position</th>
            <th>Salary</th>
            <th>Action</th>
        </tr>
        <?php
        // Fetch and display employee records
        include 'process.php';
        $records = getEmployees();
        foreach ($records as $record) {
            echo "<tr>";
            echo "<td>{$record['id']}</td>";
            echo "<td>{$record['name']}</td>";
            echo "<td>{$record['position']}</td>";
            echo "<td>{$record['salary']}</td>";
            echo "<td><a href='process.php?delete={$record['id']}'>Delete</a> | <a href='modify.php?id={$record['id']}'>Modify</a></td>";
            echo "</tr>";
        }
        ?>
    </table>
</body>
</html>
