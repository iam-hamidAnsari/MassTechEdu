<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="MassTechEdu.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Sign Up</title>
        <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="css/login_style.css">

    <style>
        body {
            background: #d1d1d5;
            padding-top: 20vh;
        }
        .form-container {
            background: #fff;
            border-radius: 20px;
            padding: 60px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: 1px solid #ddd;
        }
        .form-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.7);
        }
        .logo {
            position: absolute;
            top: 20px;
            left: 20px;
            height: auto;
            width: 200px;
        }
        .btn-custom {
            background-color: #ffbd03;
            border: none;
            color: #fff;
        }
        .btn-custom:hover {
            background-color: #e6a300;
        }
        .form-footer a {
            color: #ffbd03;
            text-decoration: none;
        }
        .form-footer a:hover {
            color: #e6a300;
        }
        .login-title {
            font-size: 1.8rem;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
      <div>
            <img src="images/edu2.png" alt="Logo" class="logo" />
            <section class="container-fluid">
                <section class="row justify-content-center">
                    <section class="col-12 col-sm-6 col-md-4">
                       <asp:MultiView ID="MultiView1" runat="server">
                           <asp:View ID="View1" runat="server">
                               <div class="form-container">
                                 <h4 class="text-center login-title">Register</h4>
                                 <div class="form-group">
                                     <label for="TextBox1">Name :</label>
                                     <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Enter Your Name"></asp:TextBox>
                                 </div>                            
                                 <div class="form-group">
                                     <label for="TextBox2">Contact No :<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Invalid Phone no" ForeColor="Red" ValidationExpression="^(\+)(?(1))\d{1,3}?[- ]?\d{10}$|^([^0])(?(1))\d{9}?$|^([0])(?(1))\d{10}?$"></asp:RegularExpressionValidator>
                                     </label>
                                     &nbsp;<asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="Enter Your Contact No"></asp:TextBox>
                                 </div>
                                 <div class="form-group">
                                     <label for="TextBox3">Email :</label>
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="Invalid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                     <asp:TextBox ID="TextBox3" runat="server" class="form-control" placeholder="Enter Your Email"></asp:TextBox>
                                 </div>
                                 <asp:Button ID="Button1" class="btn btn-custom btn-block" runat="server" Text="Send OTP" OnClick="Button1_Click" />
                           </asp:View>
                           <asp:View ID="View2" runat="server">
                               <div class="form-container">
                                  <h4 class="text-center login-title">Verify OTP</h4>
                                  <div class="form-group">
                                      <label for="TextBox4">OTP :</label>
                                      <asp:TextBox ID="TextBox4" runat="server" class="form-control" placeholder="Enter Your OTP"></asp:TextBox>
                                  </div>           
                                  <asp:Button ID="Button2" class="btn btn-custom btn-block" runat="server" Text="Verify OTP" OnClick="Button2_Click" />
                           </asp:View>
                           <asp:View ID="View3" runat="server">
                               <div class="form-container">
                                   <h4 class="text-center login-title">Password</h4>
                                   <div class="form-group">
                                       <label for="TextBox5">Password :</label>
                                       <asp:TextBox ID="TextBox5" runat="server" TextMode="Password" class="form-control" placeholder="Enter Your Password"></asp:TextBox>
                                   </div>
                                   <div class="form-group">
                                       <label for="TextBox6">Confirm Password :<asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Is Not Matching" ForeColor="#FF3300" ControlToCompare="TextBox5" ControlToValidate="TextBox6"></asp:CompareValidator>
                                       </label>
                                       &nbsp;<asp:TextBox ID="TextBox6" runat="server"  class="form-control" placeholder="Confirm Password"></asp:TextBox>
                                   </div>           
                                   <asp:Button ID="Button3" class="btn btn-custom btn-block" runat="server" Text="Register" OnClick="Button3_Click" />
                           </asp:View>
                       </asp:MultiView>
                    </section>
                </section>
            </section>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>
