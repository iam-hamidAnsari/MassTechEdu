<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="MySubCourses.aspx.cs" Inherits="MassTechEdu.MySubCourses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">



<div ID="content">
<H2>MY SUB COURSES</H2>
<div>
       <asp:DataList ID="DataList1" runat="server"  OnItemCommand="DataList1_ItemCommand" RepeatDirection="Horizontal">
    <ItemTemplate>
        <div class="card" style="width: 18rem;">
            <div class="card">
                <img class="card-img-top" src='<%#Eval("img") %>' alt="Sub Course Image" />
                <div class="card-body">
                    <h5 class="card-title"><%#Eval("name") %></h5>
                    <asp:Button ID="Button1" runat="server" CommandName="watch" CommandArgument='<%#Eval("id") %>' Text="Watch" CssClass="btn btn-primary" />
                </div>
            </div>
        </div>
    </ItemTemplate>
</asp:DataList>

    </div>
</asp:Content>
