<?php
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $correctTeacherUsername = "admin";
    $correctTeacherPassword = "admin1234";
    $correctStudentUsername = "student";
    $correctStudentPassword = "student1234";

    $username = $_POST["username"];
    $password = $_POST["password"];
    $role = $_POST["role"];

    if ($role == "teacher" && $username == $correctTeacherUsername && $password == $correctTeacherPassword) {
        $_SESSION["role"] = "teacher";
        header("Location: attendance.php");
        exit();
    } elseif ($role == "student" && $username == $correctStudentUsername && $password == $correctStudentPassword) {
        $_SESSION["role"] = "student";
        $_SESSION["username"] = $username;
        header("Location: student_attendance.php");
        exit();
    } else {
        echo "Invalid username, password, or role. Please try again.";
    }
}
?>
