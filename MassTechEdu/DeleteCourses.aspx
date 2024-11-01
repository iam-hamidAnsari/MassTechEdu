<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="DeleteCourses.aspx.cs" Inherits="MassTechEdu.DeleteCourses" %>
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
          <h2 class="form-title">Delete <span class="highlight">Courses</span></h2>
              <div class="mb-3">
                  <label for="CourseDropdown">Select Course you want to delete:</label>
                  <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control"></asp:DropDownList>
              </div>
           <asp:Button ID="Button1" runat="server" CssClass="btn btn-custom" OnClick="Button1_Click" Text="DELETE" />
      </div>
  </div>


  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</asp:Content>
