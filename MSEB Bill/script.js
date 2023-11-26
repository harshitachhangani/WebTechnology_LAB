function calculateBill() {
    const month = document.getElementById("month").value;
    const totalUnits = parseInt(document.getElementById("units").value);
    const name = document.getElementById("name").value;
    const address = document.getElementById("address").value;
    const houseNumber = document.getElementById("houseNumber").value;
    const consumerId = document.getElementById("consumerId").value;
    let billAmount = 0;

    if (totalUnits <= 50) {
        billAmount = totalUnits * 3.5;
    } else if (totalUnits <= 150) {
        billAmount = 50 * 3.5 + (totalUnits - 50) * 4;
    } else if (totalUnits <= 250) {
        billAmount = 50 * 3.5 + 100 * 4 + (totalUnits - 150) * 5.2;
    } else {
        billAmount = 50 * 3.5 + 100 * 4 + 100 * 5.2 + (totalUnits - 250) * 6.5;
    }

    // Calculate the due date as one month after the selected month
    const selectedMonth = new Date(month);
    const dueDate = new Date(selectedMonth.setMonth(selectedMonth.getMonth() + 1));
    const formattedDueDate = dueDate.toLocaleDateString();

    const billResultDiv = document.getElementById("billResult");
    billResultDiv.innerHTML = `
        <h2>Electricity Bill Details</h2>
        <p><strong>Month:</strong> ${month}</p>
        <p><strong>Total Units:</strong> ${totalUnits}</p>
        <p><strong>Bill Amount:</strong> Rs. ${billAmount.toFixed(2)}</p>
        <p><strong>Address:</strong> ${address}</p>
        <p><strong>Date of Issuing:</strong> ${getCurrentDate()}</p>
        <p><strong>Due Date:</strong> ${formattedDueDate}</p>
        <p><strong>Consumer Name:</strong> ${name}</p>
        <p><strong>Consumer ID:</strong> ${consumerId}</p>
        <p><strong>House Number:</strong> ${houseNumber}</p>
        <button onclick="downloadBillAsPDF()">Download Bill (PDF)</button>
    `;
}

function calculateDueDate(selectedMonth) {
    const selectedMonthDate = new Date(selectedMonth);
    const dueDate = new Date(selectedMonthDate.setMonth(selectedMonthDate.getMonth() + 1));
    return dueDate.toLocaleDateString();
}

function CreatePDFfromHTML() {
    var HTML_Width = $(".html-content").width();
    var HTML_Height = $(".html-content").height();
    var top_left_margin = 15;
    var PDF_Width = HTML_Width + (top_left_margin * 2);
    var PDF_Height = (PDF_Width * 1.5) + (top_left_margin * 2);
    var canvas_image_width = HTML_Width;
    var canvas_image_height = HTML_Height;

    var totalPDFPages = Math.ceil(HTML_Height / PDF_Height) - 1;

    


    html2canvas($(".html-content")[0]).then(function (canvas) {
        var imgData = canvas.toDataURL("image/jpeg", 1.0);
        var pdf = new jsPDF('p', 'pt', [PDF_Width, PDF_Height]);
        pdf.addImage(imgData, 'JPG', top_left_margin, top_left_margin, canvas_image_width, canvas_image_height);
        for (var i = 1; i <= totalPDFPages; i++) { 
            pdf.addPage(PDF_Width, PDF_Height);
            pdf.addImage(imgData, 'JPG', top_left_margin, -(PDF_Height*i)+(top_left_margin*4),canvas_image_width,canvas_image_height);
        }
        pdf.save("Your_PDF_Name.pdf");
        $(".html-content").hide();
    });
}



function downloadBillAsPDF() {
    const billResultDiv = document.getElementById("billResult");

    // Create a new jsPDF instance
    const doc = new jsPDF();

    // Get the HTML content of the billResultDiv element
    const billHTML = billResultDiv.innerHTML;

    // Convert the HTML content to PDF using html2canvas library
    html2canvas(billResultDiv).then((canvas) => {
        const imgData = canvas.toDataURL('image/png');
        doc.addImage(imgData, 'PNG', 10, 10, 190, 280);

        // Save the PDF with a filename that includes the current date
        doc.save(`Electricity_Bill_${getCurrentDate()}.pdf`);
    });
}

function getCurrentDate() {
    const today = new Date();
    const dd = String(today.getDate()).padStart(2, '0');
    const mm = String(today.getMonth() + 1).padStart(2, '0');
    const yyyy = today.getFullYear();
    return mm + '/' + dd + '/' + yyyy;
}
