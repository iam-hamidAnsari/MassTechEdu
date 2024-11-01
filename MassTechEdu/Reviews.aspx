<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Reviews.aspx.cs" Inherits="MassTechEdu.Reviews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
    <h3>User Reviews</h3>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" OnRowCommand="GridView1_RowCommand">
        <Columns>
            <asp:BoundField DataField="user_email" HeaderText="User Email" />
            <asp:BoundField DataField="review_text" HeaderText="Review" />
            <asp:BoundField DataField="rating" HeaderText="Rating" />
            <asp:BoundField DataField="course_name" HeaderText="Course Name" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CommandArgument='<%#Eval("id") %>' CommandName="approve" Text="Approve" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>
</asp:Content>
