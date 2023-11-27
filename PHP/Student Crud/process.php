<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "bookstore");

// Function to add a new student
if (isset($_POST['add'])) {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $course = $_POST['course'];
    $query = "INSERT INTO students (name, email, course) VALUES ('$name', '$email', '$course')";
    mysqli_query($conn, $query);
    header('Location: index.php');
}

// Function to delete a student
if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    $query = "DELETE FROM students WHERE id=$id";
    mysqli_query($conn, $query);
    header('Location: index.php');
}

// Function to fetch all students
function getStudents() {
    global $conn;
    $records = array();
    $query = "SELECT * FROM students";
    $result = mysqli_query($conn, $query);
    while ($row = mysqli_fetch_assoc($result)) {
        $records[] = $row;
    }
    return $records;
}

// Function to fetch student details for modification
function getStudentById($id) {
    global $conn;
    $query = "SELECT * FROM students WHERE id=$id";
    $result = mysqli_query($conn, $query);
    return mysqli_fetch_assoc($result);
}


// Function to modify student details
if (isset($_POST['modify'])) {
    $id = $_POST['id'];
    $name = $_POST['name'];
    $email = $_POST['email'];
    $course = $_POST['course'];

    // Update the database with the modified values
    $query = "UPDATE students SET name='$name', email='$email', course='$course' WHERE id=$id";
    mysqli_query($conn, $query);

    // Redirect to index.php after modification
    header('Location: index.php');
    exit;
}


?>