<!-- catalogue.php -->

<?php
session_start();

// Check if the user is logged in
if (!isset($_SESSION["username"])) {
    // Redirect to the login page if not logged in
    header("Location: login.html");
    exit();
}

// Assuming you have a database connection
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bookstore";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Display the welcome message and logout link
echo "<h2>Welcome, " . $_SESSION["username"] . "!</h2>";
echo "<p><a href='logout.php'>Logout</a></p>";

// Display the catalog with Buy option
$sql = "SELECT * FROM books";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catalogue - Online Book Store</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Online Book Store</h1>
    </header>
    <nav>
        <ul>
            <li><a href="index.html">Home</a></li>
            <li><a href="login.html">Login</a></li>
            <li><a href="catalogue.php">Catalogue</a></li>
            <li><a href="registration.html">Registration</a></li>
        </ul>
    </nav>
    <section>
        <!-- Display the catalog -->
        <?php
        if ($result->num_rows > 0) {
            echo "<ul>";
            while($row = $result->fetch_assoc()) {
                echo "<li>" . $row["title"] . " by " . $row["author"] . " - $" . $row["price"] . " ";
                echo "<a href='buy.php?id=" . $row["id"] . "'>Buy</a></li>";
            }
            echo "</ul>";
        } else {
            echo "0 results";
        }
        $conn->close();
        ?>
    </section>
    <footer>
        <p>&copy; 2023 Online Book Store</p>
    </footer>
</body>
</html>
