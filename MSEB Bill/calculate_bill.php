<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $month = $_POST['month'];
    $totalUnits = intval($_POST['units']);
    $billAmount = 0;

    if ($totalUnits <= 50) {
        $billAmount = $totalUnits * 3.5;
    } else if ($totalUnits <= 150) {
        $billAmount = 50 * 3.5 + ($totalUnits - 50) * 4;
    } else if ($totalUnits <= 250) {
        $billAmount = 50 * 3.5 + 100 * 4 + ($totalUnits - 150) * 5.2;
    } else {
        $billAmount = 50 * 3.5 + 100 * 4 + 100 * 5.2 + ($totalUnits - 250) * 6.5;
    }

    // Here, you can generate the PDF using libraries like TCPDF or FPDF and save it on the server.
    // For simplicity, we'll just return the calculated bill amount as a JSON response.

    header('Content-Type: application/json');
    echo json_encode(['billAmount' => $billAmount]);
}
?>
