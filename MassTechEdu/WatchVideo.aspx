<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="WatchVideo.aspx.cs" Inherits="MassTechEdu.WatchVideo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <div class="container-fluid mt-3">
        <div class="row">

            <div class="col-md-8"  >
                <asp:Literal ID="ltrYouTubePlayer" runat="server" Text="<iframe width='800' height='400' src='https://www.youtube.com/embed/default' frameborder='0' allowfullscreen></iframe>"></asp:Literal>
            </div>
            
      
            <div class="col-md-4" style="padding-left: 20px;">
                <h4 class="mb-3">Sessions</h4>
                <asp:GridView ID="gridPlaylists" runat="server" OnRowCommand="gridPlaylists_RowCommand" AutoGenerateColumns="False" CssClass="table table-hover table-borderless">
                    <Columns>
                        <asp:TemplateField HeaderText="Session Name">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkSessionName" runat="server" CommandName="Play" CommandArgument='<%# Eval("id") %>' Text='<%# Eval("title") %>' CssClass="text-primary" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
                <div class="container mt-4">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="tab1" data-bs-toggle="tab" href="#content1" role="tab">Questions</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="tab2" data-bs-toggle="tab" href="#content2" role="tab">Upload Assignment</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="tab3" data-bs-toggle="tab" href="#content3" role="tab">Submit Your Review</a>
            </li>
        </ul>
        <div class="tab-content mt-3">
            <div class="tab-pane fade show active" id="content1" role="tabpanel">
                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View1" runat="server">
                        <asp:Label ID="QuestionLabel1" runat="server" Text=""></asp:Label><br />
                        <asp:RadioButtonList ID="OptionsList1" runat="server"></asp:RadioButtonList><br />
                        <asp:Button ID="Button1_Next" runat="server" Text="Next" OnClick="Button_Next_Click" />
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <asp:Label ID="QuestionLabel2" runat="server" Text=""></asp:Label><br />
                        <asp:RadioButtonList ID="OptionsList2" runat="server"></asp:RadioButtonList><br />
                        <asp:Button ID="Button2_Previous" runat="server" Text="Previous" OnClick="Button_Previous_Click" />
                        <asp:Button ID="Button2_Next" runat="server" Text="Next" OnClick="Button_Next_Click" />
                    </asp:View>
                    <asp:View ID="View3" runat="server">
                        <asp:Label ID="QuestionLabel3" runat="server" Text=""></asp:Label><br />
                        <asp:RadioButtonList ID="OptionsList3" runat="server"></asp:RadioButtonList><br />
                        <asp:Button ID="Button3_Previous" runat="server" Text="Previous" OnClick="Button_Previous_Click" />
                        <asp:Button ID="Button3_Next" runat="server" Text="Next" OnClick="Button_Next_Click" />
                    </asp:View>
                    <asp:View ID="View4" runat="server">
                        <asp:Label ID="QuestionLabel4" runat="server" Text=""></asp:Label><br />
                        <asp:RadioButtonList ID="OptionsList4" runat="server"></asp:RadioButtonList><br />
                        <asp:Button ID="Button4_Previous" runat="server" Text="Previous" OnClick="Button_Previous_Click" />
                        <asp:Button ID="Button4_Next" runat="server" Text="Next" OnClick="Button_Next_Click" />
                    </asp:View>
                    <asp:View ID="View5" runat="server">
                        <asp:Label ID="QuestionLabel5" runat="server" Text=""></asp:Label><br />
                        <asp:RadioButtonList ID="OptionsList5" runat="server"></asp:RadioButtonList><br />
                        <asp:Button ID="Button5_Previous" runat="server" Text="Previous" OnClick="Button_Previous_Click" />
                        <asp:Button ID="Button5_Submit" runat="server" Text="Submit" OnClick="Button_Submit_Click" />
                    </asp:View>
                    <asp:View ID="View6" runat="server">
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><BR />
                        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label><BR />
                        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label><BR />
                        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label><BR />
                        <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label><BR />
                        <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                    </asp:View>
                </asp:MultiView>
            </div>

            <div class="tab-pane fade" id="content2" role="tabpanel">
              <div class="container mt-4">
                <h3>Assignments</h3>
                <asp:GridView ID="GridView1" AutoGenerateColumns="False" runat="server" OnRowCommand="GridView1_RowCommand" CssClass="table table-striped table-bordered">
                    <Columns>
                        <asp:TemplateField HeaderText="Assignment Name">
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("assignment_name") %>' CssClass="font-weight-bold"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Download">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# Eval("assignment_attch") %>' Download='<%# Eval("assignment_attch") %>' runat="server" CssClass="btn btn-link text-primary">Download Assignment</asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Upload Solution">
                            <ItemTemplate>
                                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control-file" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CommandName="UploadSoln" CommandArgument='<%# Eval("id") %>' Visible='<%# Eval("solution") != DBNull.Value %>' Text="Submit Assignment" CssClass="btn btn-success" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
          </div>

            <div class="tab-pane fade" id="content3" role="tabpanel">
              <div class="container mt-4">
    <h3>Submit Your Review</h3>
    <div class="card">
        <div class="card-body">
            <asp:TextBox ID="txtReviewText" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" placeholder="Enter your review..."></asp:TextBox>
            <br />

            <asp:Label ID="lblRating" runat="server" Text="Rate this course:" CssClass="form-label"></asp:Label>
            <asp:RadioButtonList ID="rblRating" runat="server" CssClass="form-check" RepeatDirection="Horizontal">
                <asp:ListItem Value="1" CssClass="form-check-input">1</asp:ListItem>
                <asp:ListItem Value="2" CssClass="form-check-input">2</asp:ListItem>
                <asp:ListItem Value="3" CssClass="form-check-input">3</asp:ListItem>
                <asp:ListItem Value="4" CssClass="form-check-input">4</asp:ListItem>
                <asp:ListItem Value="5" CssClass="form-check-input">5</asp:ListItem>
            </asp:RadioButtonList>
            <br />

            <asp:Button ID="btnSubmitReview" runat="server" Text="Submit Review" CssClass="btn btn-primary" OnClick="btnSubmitReview_Click" />
            <asp:Label ID="lblMessage" runat="server" CssClass="text-success mt-2" Text=""></asp:Label>
        </div>
    </div>
</div>

            </div>
        </div>
    </div>
<script>
    $(document).ready(function () {
        $('a[data-bs-toggle="tab"]').on('show.bs.tab', function (e) {
        });
    });
</script>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</asp:Content>
