

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Currency Converter</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            margin: 50px;
        }

        h2 {
            color: #333;
        }

        form {
            max-width: 400px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        input[type="text"], select, input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
            border-radius: 4px;
        }

        select {
            height: 40px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        #result {
            margin-top: 20px;
            font-weight: bold;
        }
    </style>
</head>
<body>

<h2>Currency Converter</h2>

<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
    Amount: <input type="text" name="amount" required><br><br>

    From Currency:
    <select name="from_currency">
        <option value="USD">USD</option>
        <option value="INR">INR</option>
    </select><br><br>

    To Currency:
    <select name="to_currency">
        <option value="USD">USD</option>
        <option value="INR">INR</option>
    </select><br><br>

    <input type="submit" value="Convert">
</form>


<?php
// Function to convert USD to INR
function usd_to_inr($usd_amount) {
    // You can use the current exchange rate here
    $exchange_rate = 83.36; // 1 USD = 73.5 INR (example rate)

    return $usd_amount * $exchange_rate;
}

// Function to convert INR to USD
function inr_to_usd($inr_amount) {
    // You can use the current exchange rate here
    $exchange_rate = 0.012; // 1 INR = 0.014 USD (example rate)

    return $inr_amount * $exchange_rate;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $amount = $_POST["amount"];
    $from_currency = $_POST["from_currency"];
    $to_currency = $_POST["to_currency"];

    if ($from_currency == "USD" && $to_currency == "INR") {
        $converted_amount = usd_to_inr($amount);
        echo "$amount USD is equal to ₹" . number_format($converted_amount, 2);
    } elseif ($from_currency == "INR" && $to_currency == "USD") {
        $converted_amount = inr_to_usd($amount);
        echo "₹$amount is equal to $" . number_format($converted_amount, 2);
    } else {
        echo "Invalid conversion!";
    }
}
?>

</body>
</html>

