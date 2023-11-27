<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "bookstore");

// Function to add a new employee
if (isset($_POST['add'])) {
    $name = $_POST['name'];
    $position = $_POST['position'];
    $salary = $_POST['salary'];
    $query = "INSERT INTO employees (name, position, salary) VALUES ('$name', '$position', '$salary')";
    mysqli_query($conn, $query);
    header('Location: index.php');
}

// Function to delete an employee
if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    $query = "DELETE FROM employees WHERE id=$id";
    mysqli_query($conn, $query);
    header('Location: index.php');
}

// Function to fetch all employees
function getEmployees() {
    global $conn;
    $records = array();
    $query = "SELECT * FROM employees";
    $result = mysqli_query($conn, $query);
    while ($row = mysqli_fetch_assoc($result)) {
        $records[] = $row;
    }
    return $records;
}// Function to modify employee details
if (isset($_POST['modify'])) {
    $id = $_POST['id'];
    $name = $_POST['name'];
    $position = $_POST['position'];
    $salary = $_POST['salary'];
    $query = "UPDATE employees SET name='$name', position='$position', salary='$salary' WHERE id=$id";
    mysqli_query($conn, $query);
    header('Location: index.php');
}
?>
