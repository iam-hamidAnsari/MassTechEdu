<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="MassTechEdu.checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />
    <style>
      

        h2 {
            color: black; /* Heading color */
            text-align: center;
            margin: 0;
            padding: 20px 0;
        }

        .checkout-container {
            background-color: #fff; /* White background for the container */
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
            max-width: 800px; /* Set max width for better layout */
            margin: 100px auto; /* Center the container with top margin */
        }

        .data-list {
            list-style-type: none; /* Remove default list styling */
            padding: 0; /* Remove padding */
            margin: 20px 0; /* Space around the list */
        }

        .data-list-item {
            display: flex; /* Use flexbox for layout */
            align-items: center; /* Center items vertically */
            justify-content: space-between; /* Space between items */
            padding: 12px; /* Padding around items */
            border-bottom: 1px solid #ddd; /* Bottom border for items */
        }

        .data-list-item:last-child {
            border-bottom: none; /* Remove border for last item */
        }

        .course-name {
            margin-right: 15px; /* Space between course name and price */
            font-weight: bold; /* Bold font for course name */
            color: #333; /* Darker color for better readability */
        }

        .course-image {
            height: 50px; /* Set image height */
            width: 50px; /* Set image width */
            margin-right: 15px; /* Space between image and text */
            border-radius: 5px; /* Rounded corners for the image */
            border: 1px solid #ddd; /* Optional border for images */
        }

        .total-label {
            font-size: 18px; /* Larger font size for total */
            font-weight: bold; /* Bold font for total */
            margin-top: 20px; /* Space above total */
            text-align: right; /* Right align total */
            color: black; /* Same color as headings */
        }

        .pay-button {
            background-color: #f1bd03; /* Pay button color */
            color: white; /* Button text color */
            border: none; /* No border */
            padding: 12px 30px; /* Padding for button */
            border-radius: 5px; /* Rounded corners */
            cursor: pointer; /* Pointer on hover */
            display: block; /* Block display */
            margin: 20px auto; /* Center the button */
            font-size: 16px; /* Font size */
            transition: background-color 0.3s; /* Smooth transition */
        }

        .pay-button:hover {
            background-color: #d9a000; /* Darker shade on hover */
        }
    </style>

   <div class="checkout-container">
        <h2>Check Out</h2>
        <div>
            <asp:DataList ID="DataList1" runat="server" RepeatDirection="Vertical" RepeatLayout="Table" CssClass="data-list">
                <ItemTemplate>
                    <div class="data-list-item">
                        <asp:Image ID="Image1" runat="server" CssClass="course-image" ImageUrl='<%# Eval("c_img") %>' />
                        <div>
                            <asp:Label ID="Label1" runat="server" CssClass="course-name" Text='<%# Eval("c_name") %>'></asp:Label>         
                            ₹<asp:Label ID="Label2" runat="server" Text='<%# Eval("GTotal") %>'></asp:Label>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <asp:Label ID="Label3" runat="server" CssClass="total-label" Text="Total Amount : "></asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Pay Now" OnClick="Button1_Click" CssClass="pay-button" />
    </div>

    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
</asp:Content>
