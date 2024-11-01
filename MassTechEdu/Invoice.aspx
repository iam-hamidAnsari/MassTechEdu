<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="MassTechEdu.Invoice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .success-container {
            margin-top: 50px;
            text-align: center;
        }
        .invoice-btn {
            margin-top: 20px;
            padding: 15px 30px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
        }
        .invoice-btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 success-container">
                <div class="alert alert-success" role="alert">
                    <h4 class="alert-heading">Payment Successful!</h4>
                    <p>Thank you for your payment. Your transaction has been completed, and your order is now being processed.</p>
                    <hr>
                    <p class="mb-0">Amount Paid: <strong id="amountPaid">
                     <asp:Label ID="Label2" runat="server" Text=""></asp:Label></strong></p>
                </div>
                <BR />
                <asp:Button ID="Button2" class="invoice-btn" runat="server" Text="Download Invoice" OnClick="Button2_Click" />
               
                <asp:Button ID="Button1" class="btn btn-link" runat="server" Text="Go Back to Home" OnClick="Button1_Click" />
               
            </div>
        </div>
    </div>
        </div>
    </form>
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>
</html>
