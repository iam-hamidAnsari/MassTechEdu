<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="viewuser.aspx.cs" Inherits="MassTechEdu.viewuser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
        }

        .profile-container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }

        .profile-image {
            max-width: 150px;
            max-height: 150px;
            border-radius: 50%;
            margin-top: 10px;
        }

        .form-group label {
            font-weight: bold;
            color: #000;
        }

        h2 {
            color: #000;
            margin-bottom: 20px;
            font-weight: bold;
            border-bottom: 3px solid #ffc107;
            display: inline-block;
            padding-bottom: 10px;
        }

        .highlight {
            color: #ffc107;
        }
    </style>

    <div class="container profile-container">
        <h2>User <span class="highlight">Profile</span></h2>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="TextBox1">Name:</label>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="TextBox2">Email Id:</label>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
               <%-- <div class="form-group">
                    <label for="TextBox3">Courses:</label>
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
                </div>--%>
            </div>
            <div class="col-md-6 text-center">
                <label>Image:</label><br />
                <asp:Image ID="Image1" runat="server" CssClass="profile-image" />
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
