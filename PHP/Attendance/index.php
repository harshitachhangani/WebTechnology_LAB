<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>
<body>
    <h2>Login</h2>
    <form action="login.php" method="post">
        <label for="role">Role:</label>
        <select name="role" required>
            <option value="teacher">Teacher</option>
            <option value="student">Student</option>
        </select><br>
        <label for="username">Username:</label>
        <input type="text" name="username" required><br>
        <label for="password">Password:</label>
        <input type="password" name="password" required><br>
        <input type="submit" value="Login">
    </form>
    <?php
        if(isset($_GET['register_success']) && $_GET['register_success'] == 'true') {
            echo '<script>alert("Registration successful. Please login with your new credentials.")</script>';
        }
    ?>
</body>
</html>
