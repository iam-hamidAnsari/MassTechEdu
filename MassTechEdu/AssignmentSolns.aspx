<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AssignmentSolns.aspx.cs" Inherits="MassTechEdu.AssignmentSolns" %>
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
    .form-title {
        color: #000;
        margin-bottom: 20px;
        font-weight: bold;
        border-bottom: 3px solid #ffc107;
        display: inline-block;
        padding-bottom: 10px;
    }
    .form-container {
        max-width: 800px;
        margin: auto;
    }
    .highlight {
        color: #ffc107;
    }
    .grid-container {
        margin-top: 20px;
    }
</style>

<div class="container form-container">
    <div class="form-section">
        <h2 class="form-title">Assignment <span class="highlight">Solutions</span></h2>
        
        <div class="mb-3">
            <label for="DropDownList2">Select Course:</label>
            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        
        <div class="mb-3">
            <label for="DropDownList1">Select Sub Course:</label>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
        </div>
        
        <div class="grid-container">
            <asp:GridView ID="GridView1" runat="server"  CssClass="table table-bordered table-striped" AutoGenerateColumns="False">
                <Columns>
                    <asp:TemplateField HeaderText="Assignments">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" NavigateUrl='<%#Eval("assignment_attch") %>' runat="server" CssClass="text-primary">View Assignment</asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="User Email">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("user_email") %>' CssClass="form-label"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Solution">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink2" NavigateUrl='<%#Eval("solution") %>' runat="server" CssClass="text-primary">View Solution</asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</asp:Content>
