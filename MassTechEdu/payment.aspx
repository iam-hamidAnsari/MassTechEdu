<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="MassTechEdu.payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:TemplateField HeaderText="Course">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("c_name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Course Img">
                        <ItemTemplate>
                            <asp:Image ID="Image1" Height="50px" Width="50px" ImageUrl='<%#Eval("c_img") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Grand Total">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("GTotal") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
                </div>
            <BR />
            <asp:Button ID="Button1" runat="server" Text="Pay Now" OnClick="Button1_Click" />
        </div>

    </form>
</body>
</html>
