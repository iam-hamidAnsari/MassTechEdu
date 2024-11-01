﻿ <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OurCourses.aspx.cs" Inherits="MassTechEdu.OurCourses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title></title>
       <meta http-equiv="X-UA-Compatible" content="IE=edge">
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <meta name="format-detection" content="telephone=no">
       <meta name="apple-mobile-web-app-capable" content="yes">
       <meta name="author" content="">
       <meta name="keywords" content="">
       <meta name="description" content="">
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />

       <link rel="stylesheet" type="text/css" href="icomoon/icomoon.css">

       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
       integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

         <link rel="stylesheet" type="text/css" href="css/vendor.css">
         <link rel="stylesheet" type="text/css" href="style.css">

         <link rel="preconnect" href="https://fonts.googleapis.com">
         <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
         <link href="https://fonts.googleapis.com/css2?family=Jost:wght@400;600;700&family=Roboto+Slab&display=swap"
           rel="stylesheet">
    <STYLE>
        #card {
            margin-top : 100px;
        }
        .card {
    border-radius: 10px;
    transition: transform 0.3s ease;
}

.card:hover {
    transform: scale(1.02);
}

.card-title {
    font-size: 1.2rem;
    font-weight: bold;
}

.btn-view {
    background-color: #007bff;
    color: white;
    border: none;
}

.rating {
    color: #FFD700; /* Gold color for stars */
}

    </STYLE>

</head>
<body>
    <form id="form1" runat="server">
               <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  <defs>
    <symbol xmlns="http://www.w3.org/2000/svg" id="link" viewBox="0 0 24 24">
      <path fill="currentColor"
        d="M12 19a1 1 0 1 0-1-1a1 1 0 0 0 1 1Zm5 0a1 1 0 1 0-1-1a1 1 0 0 0 1 1Zm0-4a1 1 0 1 0-1-1a1 1 0 0 0 1 1Zm-5 0a1 1 0 1 0-1-1a1 1 0 0 0 1 1Zm7-12h-1V2a1 1 0 0 0-2 0v1H8V2a1 1 0 0 0-2 0v1H5a3 3 0 0 0-3 3v14a3 3 0 0 0 3 3h14a3 3 0 0 0 3-3V6a3 3 0 0 0-3-3Zm1 17a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-9h16Zm0-11H4V6a1 1 0 0 1 1-1h1v1a1 1 0 0 0 2 0V5h8v1a1 1 0 0 0 2 0V5h1a1 1 0 0 1 1 1ZM7 15a1 1 0 1 0-1-1a1 1 0 0 0 1 1Zm0 4a1 1 0 1 0-1-1a1 1 0 0 0 1 1Z" />
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="arrow-right" viewBox="0 0 24 24">
      <path fill="currentColor"
        d="M17.92 11.62a1 1 0 0 0-.21-.33l-5-5a1 1 0 0 0-1.42 1.42l3.3 3.29H7a1 1 0 0 0 0 2h7.59l-3.3 3.29a1 1 0 0 0 0 1.42a1 1 0 0 0 1.42 0l5-5a1 1 0 0 0 .21-.33a1 1 0 0 0 0-.76Z" />
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="category" viewBox="0 0 24 24">
      <path fill="currentColor"
        d="M19 5.5h-6.28l-.32-1a3 3 0 0 0-2.84-2H5a3 3 0 0 0-3 3v13a3 3 0 0 0 3 3h14a3 3 0 0 0 3-3v-10a3 3 0 0 0-3-3Zm1 13a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-13a1 1 0 0 1 1-1h4.56a1 1 0 0 1 .95.68l.54 1.64a1 1 0 0 0 .95.68h7a1 1 0 0 1 1 1Z" />
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="calendar" viewBox="0 0 24 24">
      <path fill="currentColor"
        d="M19 4h-2V3a1 1 0 0 0-2 0v1H9V3a1 1 0 0 0-2 0v1H5a3 3 0 0 0-3 3v12a3 3 0 0 0 3 3h14a3 3 0 0 0 3-3V7a3 3 0 0 0-3-3Zm1 15a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-7h16Zm0-9H4V7a1 1 0 0 1 1-1h2v1a1 1 0 0 0 2 0V6h6v1a1 1 0 0 0 2 0V6h2a1 1 0 0 1 1 1Z" />
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="heart" viewBox="0 0 24 24">
      <path fill="currentColor"
        d="M20.16 4.61A6.27 6.27 0 0 0 12 4a6.27 6.27 0 0 0-8.16 9.48l7.45 7.45a1 1 0 0 0 1.42 0l7.45-7.45a6.27 6.27 0 0 0 0-8.87Zm-1.41 7.46L12 18.81l-6.75-6.74a4.28 4.28 0 0 1 3-7.3a4.25 4.25 0 0 1 3 1.25a1 1 0 0 0 1.42 0a4.27 4.27 0 0 1 6 6.05Z" />
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="plus" viewBox="0 0 24 24">
      <path fill="currentColor"
        d="M19 11h-6V5a1 1 0 0 0-2 0v6H5a1 1 0 0 0 0 2h6v6a1 1 0 0 0 2 0v-6h6a1 1 0 0 0 0-2Z" />
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="minus" viewBox="0 0 24 24">
      <path fill="currentColor" d="M19 11H5a1 1 0 0 0 0 2h14a1 1 0 0 0 0-2Z" />
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="cart" viewBox="0 0 24 24">
      <path fill="currentColor"
        d="M8.5 19a1.5 1.5 0 1 0 1.5 1.5A1.5 1.5 0 0 0 8.5 19ZM19 16H7a1 1 0 0 1 0-2h8.491a3.013 3.013 0 0 0 2.885-2.176l1.585-5.55A1 1 0 0 0 19 5H6.74a3.007 3.007 0 0 0-2.82-2H3a1 1 0 0 0 0 2h.921a1.005 1.005 0 0 1 .962.725l.155.545v.005l1.641 5.742A3 3 0 0 0 7 18h12a1 1 0 0 0 0-2Zm-1.326-9l-1.22 4.274a1.005 1.005 0 0 1-.963.726H8.754l-.255-.892L7.326 7ZM16.5 19a1.5 1.5 0 1 0 1.5 1.5a1.5 1.5 0 0 0-1.5-1.5Z" />
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="check" viewBox="0 0 24 24">
      <path fill="currentColor"
        d="M18.71 7.21a1 1 0 0 0-1.42 0l-7.45 7.46l-3.13-3.14A1 1 0 1 0 5.29 13l3.84 3.84a1 1 0 0 0 1.42 0l8.16-8.16a1 1 0 0 0 0-1.47Z" />
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="trash" viewBox="0 0 24 24">
      <path fill="currentColor"
        d="M10 18a1 1 0 0 0 1-1v-6a1 1 0 0 0-2 0v6a1 1 0 0 0 1 1ZM20 6h-4V5a3 3 0 0 0-3-3h-2a3 3 0 0 0-3 3v1H4a1 1 0 0 0 0 2h1v11a3 3 0 0 0 3 3h8a3 3 0 0 0 3-3V8h1a1 1 0 0 0 0-2ZM10 5a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v1h-4Zm7 14a1 1 0 0 1-1 1H8a1 1 0 0 1-1-1V8h10Zm-3-1a1 1 0 0 0 1-1v-6a1 1 0 0 0-2 0v6a1 1 0 0 0 1 1Z" />
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="star-outline" viewBox="0 0 15 15">
      <path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
        d="M7.5 9.804L5.337 11l.413-2.533L4 6.674l2.418-.37L7.5 4l1.082 2.304l2.418.37l-1.75 1.793L9.663 11L7.5 9.804Z" />
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="star-solid" viewBox="0 0 15 15">
      <path fill="currentColor"
        d="M7.953 3.788a.5.5 0 0 0-.906 0L6.08 5.85l-2.154.33a.5.5 0 0 0-.283.843l1.574 1.613l-.373 2.284a.5.5 0 0 0 .736.518l1.92-1.063l1.921 1.063a.5.5 0 0 0 .736-.519l-.373-2.283l1.574-1.613a.5.5 0 0 0-.283-.844L8.921 5.85l-.968-2.062Z" />
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="search" viewBox="0 0 24 24">
      <path fill="currentColor"
        d="M21.71 20.29L18 16.61A9 9 0 1 0 16.61 18l3.68 3.68a1 1 0 0 0 1.42 0a1 1 0 0 0 0-1.39ZM11 18a7 7 0 1 1 7-7a7 7 0 0 1-7 7Z" />
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="user" viewBox="0 0 24 24">
      <path fill="currentColor"
        d="M15.71 12.71a6 6 0 1 0-7.42 0a10 10 0 0 0-6.22 8.18a1 1 0 0 0 2 .22a8 8 0 0 1 15.9 0a1 1 0 0 0 1 .89h.11a1 1 0 0 0 .88-1.1a10 10 0 0 0-6.25-8.19ZM12 12a4 4 0 1 1 4-4a4 4 0 0 1-4 4Z" />
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" id="close" viewBox="0 0 15 15">
      <path fill="currentColor"
        d="M7.953 3.788a.5.5 0 0 0-.906 0L6.08 5.85l-2.154.33a.5.5 0 0 0-.283.843l1.574 1.613l-.373 2.284a.5.5 0 0 0 .736.518l1.92-1.063l1.921 1.063a.5.5 0 0 0 .736-.519l-.373-2.283l1.574-1.613a.5.5 0 0 0-.283-.844L8.921 5.85l-.968-2.062Z" />
    </symbol>

  </defs>
</svg>

<div class="preloader-wrapper">
  <div class="preloader">
  </div>
</div>


<nav class="main-menu d-flex navbar fixed-top navbar-expand-lg p-2 py-3 p-lg-4 py-lg-4 ">
  <div class="container-fluid">
    <div class="main-logo">
      <a href="#">
        <img src="images/edu2.png" width="244px" height="44px" alt="logo" class="img-fluid">
      </a>
    </div>

    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
      aria-controls="offcanvasNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">

      <div class="offcanvas-header">
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>

      <div class="offcanvas-body justify-content-end">

        <ul class="navbar-nav menu-list list-unstyled align-items-lg-center d-flex gap-md-3 mb-0">
          <li class="nav-item">
            <a href="LandingPage.aspx" class="nav-link mx-2 active">Home</a>
          </li>

          <li class="nav-item dropdown">
           
            <ul class="dropdown-menu" aria-labelledby="pages">

              <li><a href="LoginPage.aspx" class="dropdown-item">Cart<span
                    class="badge bg-secondary-subtle text-dark ms-2">PRO</span></a></li>
        
              
             
                    
              <li><a href="error.html" class="dropdown-item">Error 404<span
                    class="badge bg-secondary-subtle text-dark ms-2">PRO</span></a></li>
             
            </ul>
          </li>

          <li class="nav-item dropdown" style="color: #f1bd03;">
              <a href="contact.html" class="dropdown-item">Courses<span
                    class="badge bg-secondary-subtle text-dark ms-2"></span></a>
          </li>

        </ul>

        <div class="d-none d-lg-flex align-items-center ms-5">
          <ul class="d-flex justify-content-end  list-unstyled m-0">
            <li>
              <a class="btn btn-outline-dark mx-3 p-3" href="LoginPage.aspx" <%--data-bs-toggle="modal"
                data-bs-target="#exampleModal"--%>>Login/Signup</a>
            </li>

          

<%--            <li class="align-self-end">
              <a href="#" class="mx-3" data-bs-toggle="offcanvas" data-bs-target="#offcanvasCart"
                aria-controls="offcanvasCart">
                <iconify-icon icon="mdi:cart" class="fs-4 position-relative"></iconify-icon>
              </a>
            </li>--%>

          </ul>

        </div>

      </div>
    </div>

  </div>
  <div class="container-fluid d-lg-none">
    <div class="d-flex  align-items-end mt-3">
      <ul class="d-flex justify-content-end list-unstyled m-0">
        <li>
          <a href="account.html" class="me-4">
            <iconify-icon icon="healthicons:person" class="fs-4 me-2"></iconify-icon>
          </a>
        </li>

        <li>
          <a href="wishlist.html" class="me-4">
            <iconify-icon icon="mdi:heart" class="fs-4 me-2"></iconify-icon>
          </a>
        </li>

        <li>
          <a href="#" class="me-4" data-bs-toggle="offcanvas" data-bs-target="#offcanvasCart"
            aria-controls="offcanvasCart">
            <iconify-icon icon="mdi:cart" class="fs-4 me-2 position-relative"></iconify-icon>
            <span class="position-absolute translate-middle badge rounded-circle bg-primary text-black">
              03
            </span>
          </a>
        </li>

      </ul>

    </div>
  </div>
</nav>
<div class="container my-5" ID="card">
    <BR />
    <BR />
    <BR />
    <BR />
            <h2 class="text-center mb-4">Our Courses</h2>
            <div class="row row-cols-1 row-cols-md-3 g-4">

                    <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" RepeatLayout="Flow" RepeatColumns="3" RepeatDirection="Horizontal">
              <ItemTemplate>
                  <div class="card">
                      <asp:Image ID="Image1" src='<%# Eval("c_img") %>' class="card-img-top" alt="Course Image" runat="server" />
                      <div class="card-body">
                          <h5 class="card-title"><%# Eval("c_name") %></h5>
                          <asp:Button ID="Button1" class="btn btn-warning" CommandName="ViewCourse" CommandArgument='<%# Eval("id") %>' runat="server" Text="Buy Course" />
                          
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


         <footer id="footer">
    <div class="container padding-medium ">
      <div class="row">
        <div class="col-md-4 my-3">
          <h5 class="text-uppercase fw-bold mb-4">Contact us</h5>
          <p><iconify-icon class="social-icon text-primary fs-5 me-2" icon="mdi:location"
              style="vertical-align:text-bottom"></iconify-icon> <span class="fw-bold">Address: </span> 708, Fenkin9, Wagle Estate Road, Thane West – 400604</p>
          <p><iconify-icon class="social-icon text-primary fs-5 me-2" icon="solar:phone-bold"
              style="vertical-align:text-bottom"></iconify-icon> <span class="fw-bold">Phone: </span>+91 8108296510</p>
          <p><iconify-icon class="social-icon text-primary fs-5 me-2" icon="ic:baseline-email"
              style="vertical-align:text-bottom"></iconify-icon> <span class="fw-bold">Email: </span>
            hr@masstechbusiness.com
          </p>
        </div>
        <div class="col-md-2 my-3">
          <div class="footer-menu">
            <h5 class="text-uppercase fw-bold mb-4">Links</h5>
            <ul class="menu-list list-unstyled">
              <li class="menu-item mb-2">
                <a href="#" class="footer-link">Home</a>
              </li>
              <li class="menu-item mb-2">
                <a href="#" class="footer-link">Courses</a>
              </li>
              <li class="menu-item mb-2">
                <a href="#contact" class="footer-link">Contact Us</a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-md-2 my-3">
          <div class="footer-menu">
            <h5 class="text-uppercase fw-bold mb-4">support</h5>
            <ul class="menu-list list-unstyled">
              <li class="menu-item mb-2">
                <a href="#">FAQs</a>
              </li>
              <li class="menu-item mb-2">
                <a href="#">Support</a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-md-3 my-3">
          <div class="footer-menu">
            <h5 class="text-uppercase fw-bold mb-4">Follow us</h5>
            <div class="social-links mt-4">
              <ul class="d-flex list-unstyled gap-3">
                <li class="social">
                  <a href="#">
                    <iconify-icon class="social-icon fs-4 me-2" icon="ri:facebook-fill"></iconify-icon>
                  </a>
                </li>
                <li class="social">
                  <a href="#">
                    <iconify-icon class="social-icon fs-4 me-2" icon="ri:twitter-fill"></iconify-icon>
                  </a>
                </li>
                <li class="social">
                  <a href="#">
                    <iconify-icon class="social-icon fs-4 me-2" icon="ri:pinterest-fill"></iconify-icon>
                  </a>
                </li>
                <li class="social">
                  <a href="#">
                    <iconify-icon class="social-icon fs-4 me-2" icon="ri:instagram-fill"></iconify-icon>
                  </a>
                </li>
                <li class="social">
                  <a href="#">
                    <iconify-icon class="social-icon fs-4 me-2" icon="ri:youtube-fill"></iconify-icon>
                  </a>
                </li>

              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </footer>

  <div id="footer-bottom">
    <hr class="m-0 text-black-50">
    <div class="container py-3">
      <div class="row mt-3">
        <div class="col-md-6 copyright">
          <p>© 2024 Masstech Edu. All rights reserved.</p>
        </div>
      </div>
    </div>
  </div>


  <script src="js/jquery-1.11.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
    crossorigin="anonymous"></script>
  <script src="js/plugins.js"></script>
  <script src="js/script.js"></script>
  <script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>
    </form>
</body>
</html>