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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="./pack_desc.css" rel="stylsheet">
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
                <a class="nav-link active" aria-current="page" href="#">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Find Packages</a>
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

      <div class="container">
        <h2 class="h2 mt-4 fw-bold">${packageData.pack_name}</h2>
        <div class="row">
            <div class="col-md-10">
                <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                      <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                      <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    </div>
                    <div class="carousel-inner">
                      <div class="carousel-item active">
                        <img src="/thumbnail/${packageData.id}/${packageData.thumbnail}" class="d-block w-100" style="height: 550px;" alt="...">
                       
                      </div>
                      <div class="carousel-item">
                        <img src="/other_images/${packageData.id}/${packageData.other_image}" class="d-block w-100" style="height: 550px;" alt="...">
                       
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
            </div>
            <div class="col-md-2">
                <div class="mx-4 mt-3">
                    <h6 class="h6">Price</h6>
                    <p class="fw-bold fs-5">&#8377;${packageData.price}</p>

                    <hr class="solid">
                    <div>
                        <h6>Activities</h6>
                        <div class="row">
                            <div class="col-3">
                                <i class="fa fa-cutlery"></i>
                            </div>
                            <div class="col-3">
                                <i class="fa fa-plane"></i>
                            </div>
                            <div class="col-3">
                                <i class="fa fa-bed"></i>
                            </div>
                            <div class="col-3">
                                <i class="fa fa-car"></i>
                            </div>
                        </div>
                    </div>
                    <hr class="solid">
                    <h6>Stay Plan</h6>
                    <p class="fw-bold fs-5">${packageData.nights} Days</p>
                    
                    <hr class="solid">
                    
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">Book Now</button>
                    
                    <!-- booking modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Book Package</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                            <form method="GET" action="/book/${packageData.id}">
                              <div class="mb-1">
                                <label for="name" class="col-form-label">Full Name</label>
                                <input type="text" name="name" class="form-control" value="${userData.name }" id="name" readonly required>
                              </div>
                              <div class="mb-1">
                                <label for="email" class="col-form-label">Email</label>
                                <input type="email" name="email" class="form-control" value="${userData.email}" id="email" readonly required>
                              </div>
                              <div class="mb-1">
                                <label for="phone" class="col-form-label">Mobile no.</label>
                                <input type="tel" name="phone" class="form-control" value="${userData.phone}" id="phone" readonly required>
                              </div>
                              <div class="mb-1">
                                <label for="departure_date" class="col-form-label">Departure Date</label>
                                <input type="date" class="form-control" name="departure_date" id="departure_date"  required>
                              </div>
                              <div class="mb-1">
                                <label for="total_people" class="col-form-label">Total People</label>
                                <input type="number" name="total_people" class="form-control" id="total_people" required>
                              </div>
                            
                          
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Pay ${packageData.price}</button>
                            
                          </div>
                          </form>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- booking modal end -->
                </div>
        </div>
        </div>

        <h4 class="h4 mt-4 fw-semibold">Overview</h4>
        <h6 class="fw-bold">Route</h6>
        <h6 class="fw-semibold">${packageData.from_destination} &rarr; ${packageData.place }</h6>
        <p class="mb-4">${packageData.description}</p>

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
                <h5 class="text-uppercase">Footer Content</h5>
      
                <p>
                  Lorem ipsum dolor sit amet consectetur, adipisicing elit. Iste atque ea quis
                  molestias. Fugiat pariatur maxime quis culpa corporis vitae repudiandae
                  aliquam voluptatem veniam, est atque cumque eum delectus sint!
                </p>
              </div>
              <!--Grid column-->
      
              <!--Grid column-->
              <div class="col-lg-3 col-md-6 mb-4 mb-md-0 ">
                <h5 class="text-uppercase">Links</h5>
      
                <ul class="list-unstyled mb-0 ">
                  <li>
                    <a href="#!" class="text-white">Link 1</a>
                  </li>
                  <li>
                    <a href="#!" class="text-white">Link 2</a>
                  </li>
                  <li>
                    <a href="#!" class="text-white">Link 3</a>
                  </li>
                  <li>
                    <a href="#!" class="text-white">Link 4</a>
                  </li>
                </ul>
              </div>
              <!--Grid column-->
      
              <!--Grid column-->
              <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                <h5 class="text-uppercase mb-0">Links</h5>
      
                <ul class="list-unstyled ">
                  <li>
                    <a href="#!" class="text-white">Link 1</a>
                  </li>
                  <li>
                    <a href="#!" class="text-white">Link 2</a>
                  </li>
                  <li>
                    <a href="#!" class="text-white">Link 3</a>
                  </li>
                  <li>
                    <a href="#!" class="text-white">Link 4</a>
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
            © 2020 Copyright:
            <a class="text-danger" href="https://mdbootstrap.com/">TravelX.com</a>
          </div>
          <!-- Copyright -->
        </footer>
        <!-- Footer -->
      </section>
</body>
</html>