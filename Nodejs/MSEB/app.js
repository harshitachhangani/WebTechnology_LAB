const express = require('express');
const app = express();
const port = 3000;

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.get('/', (req, res) => {
    res.sendFile(__dirname + '/index.html');
});

app.post('/calculate', (req, res) => {
    const month = req.body.month;
    const units = parseInt(req.body.units);
    const consumerName = req.body.consumerName;
    const address = req.body.address;
    const houseNumber = req.body.houseNumber;
    const consumerID = req.body.consumerID;

    let totalBill = 0;

    if (units <= 50) {
        totalBill = units * 3.50;
    } else if (units <= 150) {
        totalBill = 50 * 3.50 + (units - 50) * 4.00;
    } else if (units <= 250) {
        totalBill = 50 * 3.50 + 100 * 4.00 + (units - 150) * 5.20;
    } else {
        totalBill = 50 * 3.50 + 100 * 4.00 + 100 * 5.20 + (units - 250) * 6.50;
    }

    // Send the bill details with styled HTML
    res.send(`
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Electricity Bill</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    background-color: #f4f4f4;
                    margin: 0;
                    padding: 0;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    height: 100vh;
                }

                .bill-container {
                    background-color: #fff;
                    padding: 20px;
                    border-radius: 8px;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                    width: 300px;
                    text-align: center;
                }

                h2 {
                    color: #4caf50;
                }

                p {
                    margin: 8px 0;
                }
            </style>
        </head>
        <body>
            <div class="bill-container">
                <h2>Electricity Bill Details</h2>
                <p>Month: ${month}</p>
                <p>Consumer Name: ${consumerName}</p>
                <p>Address: ${address}</p>
                <p>House Number: ${houseNumber}</p>
                <p>Consumer ID: ${consumerID}</p>
                <p>Total Bill: Rs. ${totalBill.toFixed(2)}</p>
            </div>
        </body>
        </html>
    `);
});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
