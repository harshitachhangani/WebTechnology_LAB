<?php
// Start the session
session_start();

// Check if the user is not logged in, redirect to login page
if (!isset($_SESSION["username"])) {
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

// Fetch books from the database
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
        <div class="container">
            <h1>Online Book Store</h1>
        </div>
    </header>
    <nav>
        <div class="container">
            <ul>
                <li><a href="index.html">Home</a></li>
                <li><a href="login.html">Login</a></li>
                <li><a href="catalogue.php">Catalogue</a></li>
                <li><a href="registration.html">Registration</a></li>
                <!-- Add Logout link -->
                <li><a href="logout.php">Logout</a></li>
            </ul>
        </div>
    </nav>
    <section class="catalogue-section">
        <div class="container">
            <h2>Discover Our Catalog</h2>

            <!-- Display books dynamically -->
            <?php
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    echo "<div class='book-card'>";
                  
                    echo "<h3>{$row['title']}</h3>";
                    echo "<p>Author: {$row['author']}</p>";
                    echo "<p>Price: $" . number_format($row['price'], 2) . "</p>";
                    echo "<button class='buy-button'>Buy Now</button>";
                    echo "</div>";
                }
            } else {
                echo "<p>No books available at the moment.</p>";
            }

            $conn->close();
            ?>
            
        </div>
    </section>
    <footer>
        <div class="container">
            <p>&copy; 2023 Online Book Store</p>
        </div>
    </footer>
</body>
</html>
