<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Watchsubcourse.aspx.cs" Inherits="MassTechEdu.Watchsubcourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
    <form id="form1" runat="server">
         <div class="container">
            <div class="row">
                <div class="col-12 text-center my-4">
                    <h2><asp:Label ID="Label1" runat="server" Text="Sub Courses"></asp:Label></h2>
                </div>
            </div>
            <div class="row">
                <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" CssClass="row" OnItemCommand="DataList1_ItemCommand">
                    <ItemTemplate>
                        <div class="col-md-4 d-flex align-items-stretch mb-4">
                            <div class="card">
                                <img class="card-img-top" src='<%#Eval("img") %>' alt="Sub Course Image" style="height: 200px; object-fit: cover;" />
                                <div class="card-body">
                                    <h5 class="card-title"><%#Eval("name") %></h5>
                                    <asp:Button ID="Button1" runat="server" CommandName="watch" CommandArgument='<%#Eval("id") %>' Text="Watch" CssClass="btn btn-primary" />
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>

    </form>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
