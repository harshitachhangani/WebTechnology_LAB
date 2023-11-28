<?php
$connection = mysqli_connect("localhost", "root", "", "bookstore");

if (!$connection) {
    die("Connection failed: " . mysqli_connect_error());
}

$studentsQuery = "SELECT id, roll_number, name FROM class_students";
$studentsResult = mysqli_query($connection, $studentsQuery);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $attendanceDate = date("Y-m-d");

    while ($row = mysqli_fetch_assoc($studentsResult)) {
        $studentId = $row["id"];
        $status = $_POST["status_$studentId"];

        $insertAttendanceQuery = "INSERT INTO attendance (student_id, attendance_date, status) VALUES ('$studentId', '$attendanceDate', '$status')";
        mysqli_query($connection, $insertAttendanceQuery);
    }

    echo "Attendance marked successfully.";
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mark Attendance</title>
</head>
<body>
    <h2>Mark Attendance</h2>
    <form action="attendance.php" method="post">
        <?php
        while ($row = mysqli_fetch_assoc($studentsResult)) {
            $studentId = $row["id"];
            $rollNumber = $row["roll_number"];
            $name = $row["name"];

            echo "<label for='status_$studentId'>$rollNumber - $name:</label>";
            echo "<input type='checkbox' name='status_$studentId' value='Present'> Present";
            echo "<input type='checkbox' name='status_$studentId' value='Absent'> Absent<br>";
        }
        ?>
        <input type="submit" value="Submit Attendance">
    </form>
</body>
</html>
