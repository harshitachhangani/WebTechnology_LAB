<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "bookstore");

// Function to fetch student details for modification
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $student = getStudentById($id);
}

// Function to fetch student details for modification
function getStudentById($id) {
    global $conn;
    $query = "SELECT * FROM students WHERE id=$id";
    $result = mysqli_query($conn, $query);
    return mysqli_fetch_assoc($result);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modify Student</title>
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
    </style>
</head>
<body>
    <h2>Modify Student</h2>
    
    <!-- Form to modify student details -->
    <!-- Form to modify student details -->
<form id="studentForm" action="process.php" method="post" onsubmit="return validateForm()">
    <input type="hidden" name="id" value="<?php echo $student['id']; ?>">
    <label for="name">Name:</label>
    <input type="text" name="name" id="name" value="<?php echo $student['name']; ?>" required>
    <label for="email">Email:</label>
    <input type="email" name="email" id="email" value="<?php echo $student['email']; ?>" required>
    <label for="course">Course:</label>
    <input type="text" name="course" id="course" value="<?php echo $student['course']; ?>" required>
    
    <button type="submit" name="modify">Modify Student</button>
</form>


    <script>
        function validateForm() {
            var name = document.getElementById('name').value;
            var email = document.getElementById('email').value;
            var course = document.getElementById('course').value;
            var grade = document.getElementById('grade').value;

            if (name.trim() === '' || email.trim() === '' || course.trim() === '' || grade.trim() === '') {
                alert('All fields must be filled out');
                return false;
            }

            return true;
        }
    </script>
</body>
</html>
