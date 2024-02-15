<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="GraduationProject.about" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <title> about </title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500&family=Roboto:wght@400;500;700&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
    <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar & Hero Start -->
        <div class="container-xxl position-relative p-0">
            <nav class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0">
                
                    <h1 class="m-0"><i class="fa fa-search me-2"></i>HouseRental<span class="fs-5">system</span></h1>
                    <!-- <img src="img/logo.png" alt="Logo"> -->
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0">
                        <a href="index.aspx" class="nav-item nav-link">Home</a>
                        <a href="about.html" class="nav-item nav-link active">About</a>
                        <a href="contact.aspx" class="nav-item nav-link">Contact</a>
                        <a href="/LoginForm/login.aspx" class="nav-item nav-link">Login</a>
                    </div>
                    
                </div>
            </nav>

            <div class="container-xxl py-5 bg-primary hero-header mb-5">
                <div class="container my-5 py-5 px-lg-5">
                    <div class="row g-5 py-5">
                        <div class="col-12 text-center">
                            <h1 class="text-white animated zoomIn">About Us</h1>
                            <hr class="bg-white mx-auto mt-0" style="width: 90px;">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb justify-content-center">
                                    <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
                                    <li class="breadcrumb-item text-white active" aria-current="page">About</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->


        <!-- Full Screen Search Start -->
        <div class="modal fade" id="searchModal" tabindex="-1">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content" style="background: rgba(29, 29, 39, 0.7);">
                    <div class="modal-header border-0">
                        <button type="button" class="btn bg-white btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body d-flex align-items-center justify-content-center">
                        <div class="input-group" style="max-width: 600px;">
                            <input type="text" class="form-control bg-transparent border-light p-3" placeholder="Type search keyword">
                            <button class="btn btn-light px-4"><i class="bi bi-search"></i></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Full Screen Search End -->


        <!-- About Start -->
        <div class="container-xxl py-5">
            <div class="container px-lg-5">
                <div class="row g-5">
                    <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="section-title position-relative mb-4 pb-2">
                            <h6 class="position-relative text-primary ps-4">About Us</h6>
                            <h2 class="mt-2">The best HOUSES RENTAL solution.</h2>
                        </div>
                        <p class="mb-4"> Moving on, this house rental management system project in ASP.NET focuses mainly on dealing with tenants regarding their bookings and other information. Also, it displays all the available house data such as total members, address, city, state, photos, and furthermore details on it. The project is divided into two categories: Admin,Owner and Tenant Login. In an overview of this web app, the owner has full control of the system. Talking about the project, an owner can manage the booking details of all the houses that he/she lists on to the system. Also, the owner can book houses for his own too. In terms of booking for rental, both owners, as well as the tenant, have access to it by filling up certain forms.</p>
                        <div class="row g-3">
                            <div class="col-sm-6">
                               
                                <h6 class="mb-0"><i class="fa fa-check text-primary me-2"></i>Professional Staff</h6>
                            </div>
                            <div class="col-sm-6">
                                <h6 class="mb-3"><i class="fa fa-check text-primary me-2"></i>24/7 Support</h6>
                                <h6 class="mb-0"><i class="fa fa-check text-primary me-2"></i>Fair Prices</h6>
                            </div>
                        </div>
                        <div class="d-flex align-items-center mt-4">
                            <a class="btn btn-primary rounded-pill px-4 me-3" href="">Read More</a>
                            <a class="btn btn-outline-primary btn-square me-3" href=""><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-primary btn-square me-3" href=""><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-primary btn-square me-3" href=""><i class="fab fa-instagram"></i></a>
                            <a class="btn btn-outline-primary btn-square" href=""><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <img class="img-fluid wow zoomIn" data-wow-delay="0.5s" src="img/about.jpg">
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->


        <!-- Newsletter Start -->
       
        <!-- Newsletter End -->


        <!-- Team Start -->
       
      
        <!-- Back to Top -->
        
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/isotope/isotope.pkgd.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>
</html>
