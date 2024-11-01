<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCourse.aspx.cs" Inherits="MassTechEdu.ViewCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Course Details</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <div class="row">
                <div class="col-md-6">
                    <h2 class="mb-3"><asp:Label ID="Label1" runat="server" Text=""></asp:Label></h2>
                    <asp:Image ID="Image1" Height="200px" Width="300px" runat="server" />
                    <p class="mt-3"><strong>Description:</strong></p>
                    <asp:Label ID="LabelDescription" runat="server" Text="" CssClass="text-muted"></asp:Label>
                </div>
            </div>

            <h3 class="mt-4">Sub Courses</h3>
            <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatLayout="Table">
                <ItemTemplate>
                    <div class="card mb-3" style="width: 18rem;">
                        <img class="card-img-top" src='<%#Eval("img") %>' alt="Sub Course Image" />
                        <div class="card-body">
                            <h5 class="card-title"><%#Eval("name") %></h5>
                            <p class="card-text">Price: ₹<%#Eval("price") %></p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>

            <div class="mt-4">
                <h4>Total Price: ₹<asp:Label ID="LabelTotalPrice" runat="server" Text="0"></asp:Label></h4>
            </div>
            <asp:Button ID="Button1" runat="server" Text="Checkout" CssClass="btn btn-success" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
