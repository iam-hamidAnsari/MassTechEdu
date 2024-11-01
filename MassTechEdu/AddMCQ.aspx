<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddMCQ.aspx.cs" Inherits="MassTechEdu.AddMCQ" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f8f9fa;
    }
    .form-section {
        background-color: #ffffff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        margin-top: 50px;
        border-left: 8px solid #ffc107;
    }
    label {
        font-weight: bold;
        color: #000;
    }
    .btn-custom {
        background-color: #ff0000;
        color: white;
        border: none;
    }
    .btn-custom:hover {
        background-color: #cc0000;
    }
    .form-title {
        color: #000;
        margin-bottom: 20px;
        font-weight: bold;
        border-bottom: 3px solid #ffc107;
        display: inline-block;
        padding-bottom: 10px;
    }
    .form-container {
        max-width: 600px;
        margin: auto;
    }
    .highlight {
        color: #ffc107;
    }
</style>

<div class="container form-container">
    <div class="form-section">
        <h2 class="form-title">Add <span class="highlight">MCQ's</span></h2>
        
        <div class="mb-3">
            <label for="DropDownList2">Select Course:</label>
            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        
        <div class="mb-3">
            <label for="DropDownList1">Select Sub Course:</label>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        
        <div class="mb-3">
            <label for="TextBox1">Question:</label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        
        <div class="mb-3">
            <label for="TextBox2">Option 1:</label>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        
        <div class="mb-3">
            <label for="TextBox3">Option 2:</label>
            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        
        <div class="mb-3">
            <label for="TextBox4">Option 3:</label>
            <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        
        <div class="mb-3">
            <label for="TextBox5">Option 4:</label>
            <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        
        <div class="mb-3">
            <label for="TextBox6">Answer:</label>
            <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        
        <asp:Button ID="Button1" runat="server" CssClass="btn btn-custom" OnClick="Button1_Click" Text="Add MCQ" />
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</asp:Content>
