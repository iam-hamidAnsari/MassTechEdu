<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserOurCourse.aspx.cs" Inherits="MassTechEdu.UserOurCourse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    
    <style>
        /* Filters section styling */
        .filters {
            display: flex;
            align-items: center;
            margin-top: 30px;
            justify-content: space-between;
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 8px;
            margin-bottom: 30px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
        .filters select, .filters button {
            margin-right: 15px;
        }

        /* Card layout */
        .card-deck {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        /* Card styling */
        .card {
            border: 1px solid #ddd;
            border-radius: 8px;
            transition: box-shadow 0.3s;
            text-align: center;
        }
        .card:hover {
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }
        
        /* Card image styling */
        .card .card-img-top {
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
            height: 180px;
            object-fit: cover;
        }

        /* Card content styling */
        .card-title {
            font-size: 1.1rem;
            font-weight: 600;
            color: #333;
        }
        .card-subtitle {
            font-size: 0.9rem;
            color: #555;
            margin-top: 5px;
        }
        .price {
            font-size: 1.2rem;
            font-weight: bold;
            color: #333;
            margin-top: 10px;
        }
        .tags {
            margin-top: 8px;
            font-size: 0.85rem;
        }
        .tags span {
            background-color: #e8e8ff;
            color: #6666ff;
            border-radius: 5px;
            padding: 2px 8px;
            margin-right: 5px;
        }
        .rating, .info {
            font-size: 0.9rem;
            color: #777;
        }

        /* View Course Button */
        .btn-view {
            background-color: #6c63ff;
            color: #fff;
            border-radius: 20px;
            padding: 10px 20px;
            margin-top: 10px;
            transition: background-color 0.3s;
        }
        .btn-view:hover {
            background-color: #504abf;
        }

        .reviews {
            border-top: 1px solid #ddd;
            padding-top: 10px;
            margin-top: 10px;
}

        .rating {
            color: #FFD700; /* Gold color for stars */
        }

    </style>

    <!-- Filters Section -->
    <div class="filters">
        <div>
            <span>Filter By</span>
            <select class="form-control d-inline-block" style="width: 150px;">
                <option>Course Name</option>
                <option>.NET</option>
                <option>SQL</option>
                <option>AWS</option>
            </select>
            <select class="form-control d-inline-block" style="width: 120px;">
                <option>All Levels</option>
                <option>Beginner</option>
                <option>Intermediate</option>
                <option>Advanced</option>
            </select>
            <select class="form-control d-inline-block" style="width: 150px;">
                <option>Sort by Price</option>
                <option>Low to High</option>
                <option>High to Low</option>
            </select>
        </div>
        <button class="btn btn-primary">Apply Filters</button>
    </div>

    <!-- Course Cards Section -->
    <div class="content">
        <div class="card-deck">
         <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" RepeatLayout="Flow">
    <ItemTemplate>
        <div class="card">
            <asp:Image ID="Image1" src='<%# Eval("c_img") %>' class="card-img-top" alt="Course Image" runat="server" />
            <div class="card-body">
                <h5 class="card-title"><%# Eval("c_name") %></h5>
                <asp:Button ID="Button1" class="btn btn-view" CommandName="ViewCourse" CommandArgument='<%# Eval("id") %>' runat="server" Text="View Course" />
                
                <div class="reviews mt-3">
                    <h6>User Reviews:</h6>
                    <asp:Label ID="lblReview" runat="server" Text='<%# Eval("review_text") != DBNull.Value ? Eval("review_text").ToString() : "No reviews yet." %>' />
                    <div class="rating">
                        <asp:Literal ID="litRating" runat="server" Text='<%# GetRatingStars(Eval("rating")) %>' />
                    </div>
                </div>
            </div>
        </div>
    </ItemTemplate>
</asp:DataList>

        </div>
    </div>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

</asp:Content>
