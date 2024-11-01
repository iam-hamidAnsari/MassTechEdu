<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="MyCourse.aspx.cs" Inherits="MassTechEdu.MyCourse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">


    <div>
    <H2>MY COURSES</H2>
    <div>
            <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" RepeatDirection="Horizontal">
                <ItemTemplate>
                    <div class="card" style="width: 18rem;">
                        <asp:Image ID="Image1" src='<%#Eval("course_image") %>' class="card-img-top" alt="Course Image"  runat="server" />
     
                      <div class="card-body">
                        <h5 class="card-title"><%#Eval("course_name") %></h5>
                          <asp:Button ID="Button1" class="btn btn-primary" CommandName="Watch" CommandArgument='<%#Eval("course_id") %>' runat="server" Text="Watch" />
                      </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>

        </div>
</div>   
    <BR />
    <BR />
    <div>
    <H2>OTHER COURSES</H2>
    <div>
            <asp:DataList ID="DataList2" runat="server" RepeatDirection="Horizontal" OnItemCommand="DataList2_ItemCommand1">
                <ItemTemplate>
                    <div class="card" style="width: 18rem;">
                        <asp:Image ID="Image1" src='<%#Eval("course_image") %>' class="card-img-top" alt="Course Image"  runat="server" />
     
                      <div class="card-body">
                        <h5 class="card-title"><%#Eval("course_name") %></h5>
                          <asp:Button ID="Button1" class="btn btn-primary" CommandName="Watch" CommandArgument='<%#Eval("course_id") %>' runat="server" Text="View Course" />
                      </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>

        </div>
</div>
</asp:Content>
