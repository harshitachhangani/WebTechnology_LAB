<?php
require_once('db.php');

function createOrder($item_id, $quantity) {
    global $conn;
    $sql = "INSERT INTO orders (item_id, quantity, total_price) VALUES (?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $menu_item = getMenuItem($item_id);

    if ($stmt) {
        $total_price = $menu_item['price'] * $quantity;
        $stmt->bind_param('iid', $item_id, $quantity, $total_price);
        $stmt->execute();
        $stmt->close();
        return true;
    } else {
        return false;
    }
}
?>