<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="usermanagement.aspx.cs" Inherits="MassTechEdu.usermanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
        }

        .form-title {
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

        .grid-view-header {
            background-color: #ffc107;
            color: white;
        }

        .table {
            margin-top: 20px;
        }

        .btn-custom {
            background-color: #ffc107;
            color: white;
        }

        .btn-custom:hover {
            background-color: #e0a800;
            color: white;
        }

        .img-thumbnail {
            max-width: 50px;
            max-height: 50px;
        }

        .table-hover tbody tr:hover {
            background-color: #f1f1f1;
        }

        .form-section {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }
    </style>

    <div class="container form-section">
        <h2 class="text-center form-title">User <span class="highlight">Management</span></h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" CssClass="table table-bordered table-hover" OnRowCommand="GridView1_RowCommand1" OnRowDeleting="GridView1_RowDeleting">
            <HeaderStyle CssClass="grid-view-header" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Profile Image" SortExpression="profile_img">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("profile_img") %>' CssClass="img-thumbnail" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="profile_img" Mode="Edit" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Purchased Course" SortExpression="purchasedAnyCourse">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("purchased_courses") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("purchased_courses") %>' CssClass="form-control"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:Button ID="btnView" runat="server" Text="View" CssClass="btn btn-info btn-sm" CommandName="View" CommandArgument='<%# Eval("id") %>' />
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-warning btn-sm" CommandName="Update" CommandArgument='<%# Eval("id") %>' />
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger btn-sm" CommandName="Delete" CommandArgument='<%# Eval("id") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
