<?php
$connection = mysqli_connect("localhost", "root", "", "bookstore");

if (!$connection) {
    die("Connection failed: " . mysqli_connect_error());
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $rollNumber = $_POST["roll_number"];
    $name = $_POST["name"];

    $sql = "INSERT INTO class_students (roll_number, name) VALUES ('$rollNumber', '$name')";

    if (mysqli_query($connection, $sql)) {
        echo "Student registered successfully.";
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($connection);
    }
}

mysqli_close($connection);
?>
