<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <title>Find Packages</title>
</head>

<body style="display: flex; flex-direction: column;">

	 <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
          <a class="navbar-brand mx-5" href="#">TourismX</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link" aria-current="page" href="/dash">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" href="/findPackage">Find Packages</a>
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

<form method="post" action="/findPacks">
    <div class="container card shadow-lg mt-5">
    <div class="d-flex align-items-center justify-content-center mt-5">
        <div class="row">
            <div class="col-md-6">
                <input type="text" placeholder="From" name="from" required>
            </div>
            <div class="col-md-6">
                <input type="text" placeholder="To" name="to" required>
            </div>
        </div>
        
    </div>
    <div class=" d-flex align-items-center justify-content-center mt-4 mb-5">
        <div class="row">
        <div class="col-md-12">
            <button type="submit" class="btn btn-danger">Search</button>
        </div>
        </div>
    </div>
</div>
</form>

<div class="container mt-5 shadow-lg">
    <c:forEach items="${data}" var="e">
        <div class="col-4 p-3">
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

<section class="mt-5" style="flex: 1">
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

</body>
</html>