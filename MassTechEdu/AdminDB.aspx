<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminDB.aspx.cs" Inherits="MassTechEdu.AdminDB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <style>
        .card {
            color: black;
            text-align: center;
            padding: 20px;
            border-radius: 8px;
            margin: 10px;
        }
        .card p {
            color: black; /* Change to any color you want */
        }
       .card-blue { background-color:#ff0000 }
        .card-green { background-color: #28a745; }
        .card-teal { background-color: #007bff; }

        .chart-container {
            padding: 20px;
            /*background-color: #fff3e0;*/
            background-color: #d1d1d5;
            border-radius: 8px;
            margin-top: 20px;
        }
    </style>

     <h2 class="text-center mt-4">Welcome to MassTechEdu</h2>
 <div class="row">
     <div class="col-md-4">
         <div class="card card-blue">
             <h3>Number of Users</h3>
             <H5><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></H5>
             <p>Total registered users.</p>
         </div>
     </div>
     <div class="col-md-4">
         <div class="card card-green">
             <h3>Number of Courses</h3>
             <H5><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></H5>
             <p>Total courses added.</p>
         </div>
     </div>
     <div class="col-md-4">
         <div class="card card-teal">
             <h3>Number of Sales</h3>
            <H5><asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></H5>
             <p>Total sales made.</p>
         </div>
     </div>
 </div>
 <div class="chart-container">
     <canvas id="myBarChart" width="400" height="200"></canvas>
 </div>

 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    var myBarChart;

    function setChartData(months, sales) {
        var ctx = document.getElementById('myBarChart').getContext('2d');
        myBarChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: months,
                datasets: [{
                    label: 'Sales per Month',
                    data: sales,
                    backgroundColor: 'rgba(60, 179, 113, 0.2)',
                    borderColor: 'rgba(60, 179, 113, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                },
                barThickness: 50,
                maxBarThickness: 70
            }
        });
    }

    // Initial call to create an empty chart
    window.onload = function () {
        setChartData([], []);
    };
</script>

</asp:Content>
