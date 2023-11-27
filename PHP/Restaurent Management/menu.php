<?php
require_once('db.php');

function getMenuItems() {
    global $conn;
    $sql = "SELECT * FROM menu_items";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        return $result->fetch_all(MYSQLI_ASSOC);
    } else {
        return [];
    }
}
?>