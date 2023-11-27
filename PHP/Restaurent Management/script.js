document.addEventListener('DOMContentLoaded', function () {
    // Fetch menu items and display them
    fetch('menu.php')
        .then(response => response.json())
        .then(menuItems => {
            // Display menu items in the #menu div
            const menuDiv = document.getElementById('menu');
            menuItems.forEach(item => {
                const menuItem = document.createElement('div');
                menuItem.textContent = `${item.name} - $${item.price}`;
                menuItem.addEventListener('click', () => addToOrder(item.id));
                menuDiv.appendChild(menuItem);
            });
        });

    // Handle order interactions
    function addToOrder(itemId) {
        const quantity = prompt('Enter quantity:');
        if (quantity) {
            // Send order to the server
            fetch(`orders.php?item_id=${itemId}&quantity=${quantity}`, { method: 'POST' })
                .then(response => response.json())
                .then(orderCreated => {
                    if (orderCreated) {
                        alert('Order placed successfully!');
                        // Update order summary in the #order div
                        updateOrderSummary();
                    } else {
                        alert('Failed to place order. Please try again.');
                    }
                });
        }
    }

    function updateOrderSummary() {
        // Fetch and display order summary
        fetch('get_order_summary.php')
            .then(response => response.json())
            .then(orderSummary => {
                // Display order summary in the #order div
                const orderDiv = document.getElementById('order');
                orderDiv.textContent = `Order Summary: ${orderSummary.total_orders} orders, $${orderSummary.total_amount}`;
            });
    }
});
