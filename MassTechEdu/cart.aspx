<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="MassTechEdu.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />
    <style>
        /*body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 20px;
        }*/

        h2 {
            color: black; /* Updated heading color */
            text-align: center;
            margin: 0;
            padding: 20px 0;
        }

        .cart-container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 800px;
            margin: 100px auto; /* 100px margin from top */
        }

        .grid-view {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .grid-view th, .grid-view td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .grid-view th {
            background-color: #f1bd03; /* Header background color */
            color: white;
        }

        .grid-view tr:hover {
            background-color: #f1f1f1; /* Row hover effect */
        }

        .total-label {
            font-size: 18px;
            font-weight: bold;
            margin-top: 20px;
            text-align: right; /* Right align the total */
        }

        .checkout-btn {
            background-color: #28a745; /* Checkout button color */
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            display: block;
            margin: 20px auto; /* Center the button */
            font-size: 16px;
            transition: background-color 0.3s; /* Smooth transition */
        }

        .checkout-btn:hover {
            background-color: #218838; /* Hover effect */
        }

        .delete-btn {
            background-color: #dc3545; /* Delete button color */
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s; /* Smooth transition */
        }

        .delete-btn:hover {
            background-color: #c82333; /* Hover effect */
        }
    </style>
    
     <div class="cart-container">
        <h2><b>MY Cart</b></h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="id" CssClass="grid-view">
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Course">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("c_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Course Image">
                    <ItemTemplate>
                        <asp:Image ID="Image1" Height="50px" Width="50px" ImageUrl='<%# Eval("c_img") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Price">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("GTotal") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CommandName="Delete" CommandArgument='<%# Eval("id") %>' Text="Delete" CssClass="delete-btn" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <div class="total-label">
            Total: <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
        </div>
        <asp:Button ID="Button2" runat="server" Text="Checkout" OnClick="Button2_Click" CssClass="checkout-btn" />
    </div>
</asp:Content>
