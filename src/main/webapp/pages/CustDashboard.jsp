<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<style>
body {
    min-height: 100vh;
    min-height: -webkit-fill-available;
  }
  
  html {
    height: -webkit-fill-available;
  }
  
  main {
    display: flex;
    flex-wrap: nowrap;
    height: 100vh;
    height: -webkit-fill-available;
    max-height: 100vh;
    overflow-x: auto;
    overflow-y: hidden;
  }
  
  .b-example-divider {
    flex-shrink: 0;
    width: 1.5rem;
    height: 100vh;
    background-color: rgba(0, 0, 0, .1);
    border: solid rgba(0, 0, 0, .15);
    border-width: 1px 0;
    box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
  }
  
  .bi {
    vertical-align: -.125em;
    pointer-events: none;
    fill: currentColor;
  }
  
  .dropdown-toggle { outline: 0; }
  
  .nav-flush .nav-link {
    border-radius: 0;
  }
  
  .btn-toggle {
    display: inline-flex;
    align-items: center;
    padding: .25rem .5rem;
    font-weight: 600;
    color: rgba(0, 0, 0, .65);
    background-color: transparent;
    border: 0;
  }
  .btn-toggle:hover,
  .btn-toggle:focus {
    color: rgba(0, 0, 0, .85);
    background-color: #d2f4ea;
  }
  
  .btn-toggle::before {
    width: 1.25em;
    line-height: 0;
    content: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='rgba%280,0,0,.5%29' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M5 14l6-6-6-6'/%3e%3c/svg%3e");
    transition: transform .35s ease;
    transform-origin: .5em 50%;
  }
  
  .btn-toggle[aria-expanded="true"] {
    color: rgba(0, 0, 0, .85);
  }
  .btn-toggle[aria-expanded="true"]::before {
    transform: rotate(90deg);
  }
  
  .btn-toggle-nav a {
    display: inline-flex;
    padding: .1875rem .5rem;
    margin-top: .125rem;
    margin-left: 1.25rem;
    text-decoration: none;
  }
  .btn-toggle-nav a:hover,
  .btn-toggle-nav a:focus {
    background-color: #d2f4ea;
  }
  
  .scrollarea {
    overflow-y: auto;
  }
  
  .fw-semibold { font-weight: 600; }
  .lh-tight { line-height: 1.25; }
  
</style>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
    <title></title>
</head>
<body>
    
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
          <a class="navbar-brand mx-5" href="#">TourismX</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/dash">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/findPackage">Find Packages</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/userBookings">Your Bookings</a>
              </li>

            </ul>
			<div class=" d-flex">
        	<a href="/logout" class="btn btn-outline-danger" type="submit">Logout</a>
        	</div>
      	</div>
        </div>
      </nav>

      <!--carousel-->

      <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="./img/1.jpg" class="d-block w-100" style="height: 550px;" alt="...">
            <div class="carousel-caption d-none d-md-block">
              
              <p>Some representative placeholder content for the first slide.</p>
            </div>
          </div>
          <div class="carousel-item">
            <img src="./img/2.jpeg" class="d-block w-100" style="height: 550px;" alt="...">
            <div class="carousel-caption d-none d-md-block">
              
              <p>Some representative placeholder content for the second slide.</p>
            </div>
          </div>
          <div class="carousel-item">
            <img src="./img/mountain.jpeg" class="d-block w-100" style="height: 550px;" alt="...">
            <div class="carousel-caption d-none d-md-block">
             
              <p>Some representative placeholder content for the second slide.</p>
            </div>
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>

      <!--packages-->

      <div class="container my-5 shadow-lg">

        <div class="h2">Top Destinations</div>

      <div class="row">

		<c:forEach items="${data}" var="e">
        <div class="col-4">
        <div class="card mb-3" style="width: 18rem;">
            <img src="/thumbnail/${e.id}/${e.thumbnail}" class="card-img-top" style="width: 200px; height: 200px;" alt="...">
            <div class="card-body">
            <div class="row">
            	<div class="col-9">
            		<h5 class="card-title"><b>${e.pack_name}</b></h5>
            	</div>
            	<div class="col-3">
            		<p class="fw-semibold"><i class="fa fa-hotel"></i> ${e.nights}D</p>
            	</div>
            </div>
            <h6 class="fw-semibold">${e.from_destination} &rarr; ${e.place}</h6>
            <p class="card-text">${e.description}</p>
            <div class="row">
              <div class="col-6">
                  <a href="/PackDetails/${e.id}" class="btn btn-danger" style="font-size:small;">Book Package</a>
              </div>
              <div class="col-6 d-flex align-items-center justify-content-center">
                <p class="text-danger fw-bold" style="font-size: 15px;">&#x20B9;${e.price}</p>
              </div>
            </div>
            </div>
        </div>
    </div>
</c:forEach>

    </div>
    </div>

    <div class="container shadow-lg my-5">
        <div class="h2">International Destinations</div>

      <div class="row">
        <div class="col-2">
        <div class="card" style="width: 10rem;">
            <img src="./img/jerusalem.jpg" class="card-img-top" style="height: 12rem; width: 10rem;" alt="...">
            <div class="card-body">
            <h5 class="card-title">Jerusalem</h5>
            </div>
        </div>
    </div>
    <div class="col-2">
        <div class="card" style="width: 10rem;">
            <img src="./img/lourdes.jpg" class="card-img-top" style="height: 12rem; width: 10rem;" alt="...">
            <div class="card-body">
            <h5 class="card-title">Lourdes</h5>
            </div>
        </div>
    </div>
    <div class="col-2">
        <div class="card" style="width: 10rem;">
            <img src="./img/Santiago de Compostela.jpg" class="card-img-top" style="height: 12rem; width: 10rem;" alt="...">
            <div class="card-body">
            <h5 class="card-title">Santiago de Compostela</h5>
            </div>
        </div>
    </div>
    <div class="col-2">
        <div class="card" style="width: 10rem;">
            <img src="./img/mecca.jpg" class="card-img-top" style="height: 12rem; width: 10rem;" alt="...">
            <div class="card-body">
            <h5 class="card-title">Mecca</h5>
            </div>
        </div>
    </div>
    <div class="col-2">
        <div class="card" style="width: 10rem;">
            <img src="./img/Varanasi.jpg" class="card-img-top" style="height: 12rem; width: 10rem;" alt="...">
            <div class="card-body">
            <h5 class="card-title">Varanasi</h5>
            </div>
        </div>
    </div>
    <div class="col-2">
        <div class="card" style="width: 10rem;">
            <img src="./img/vatican.png" class="card-img-top" style="height: 12rem; width: 10rem;" alt="...">
            <div class="card-body">
            <h5 class="card-title">Vatican City</h5>
            </div>
        </div>
    </div>
    </div>
    </div>
    

    <section class="">
      <!-- Footer -->
      <footer class="bg-dark text-white text-center">
        <!-- Grid container -->
        <div class="container p-4">
          <!--Grid row-->
          <div class="row">
            <!--Grid column-->
            <div class="col-lg-6 col-md-12 mb-4 mb-md-0">
              <h5 class="text-uppercase">TravelX</h5>
    
              <p>
                Discover a seamless pilgrimage experience with our online booking system. We strive to make your spiritual journey memorable and hassle-free.
              </p>
            </div>
            <!--Grid column-->
    
            <!--Grid column-->
            <div class="col-lg-3 col-md-6 mb-4 mb-md-0 ">
              <h5 class="text-uppercase">Links</h5>
    
              <ul class="list-unstyled mb-0 ">
                <li>
                  <a href="/dash" class="text-white">Home</a>
                </li>
                <li>
                  <a href="/userBookings" class="text-white">Your Bookings</a>
                </li>
                <li>
                  <a href="/findPackage" class="text-white">Find Packages</a>
                </li>
              </ul>
            </div>
            <!--Grid column-->
    
            <!--Grid column-->
            <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
              <h5 class="text-uppercase ">Links</h5>
    
              <ul class="list-unstyled ">
                <li>
                  <a href="/dash" class="text-white">Home</a>
                </li>
                <li>
                  <a href="/userBookings" class="text-white">Your Bookings</a>
                </li>
                <li>
                  <a href="/findPackage" class="text-white">Find Packages</a>
                </li>
              </ul>
            </div>
            <!--Grid column-->
          </div>
          <!--Grid row-->
        </div>
        <!-- Grid container -->
    
        <!-- Copyright -->
        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.05);">
          © 2024 Copyright:
          <a class="text-danger" href="/dash">TravelX.com</a>
        </div>
        <!-- Copyright -->
      </footer>
      <!-- Footer -->
    </section>

<script>
function successMsg(){
	
	const Toast = Swal.mixin({
		  toast: true,
		  position: "bottom-end",
		  showConfirmButton: false,
		  timer: 3000,
		  timerProgressBar: true,
		  didOpen: (toast) => {
		    toast.onmouseenter = Swal.stopTimer;
		    toast.onmouseleave = Swal.resumeTimer;
		  }
		});
		Toast.fire({
		  icon: "success",
		  title: "Signed in successfully"
		});
}
</script>

	<c:if test="${not empty signinSuccess}">
        <script>
        	successMsg();
        </script>
    </c:if>
    
</body>
</html>
</body>

