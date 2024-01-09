<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
                <a class="nav-link" href="#">Top Picks</a>
              </li>
              <li class="nav-item">
                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>

      <div class="container">
        <h2 class="h2 mt-4 fw-bold">Kedarnath</h2>
        <div class="row">
            <div class="col-md-10">
                <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                      <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                      <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                      <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                      <div class="carousel-item active">
                        <img src="./img/k1.jpg" class="d-block w-100" style="height: 550px;" alt="...">
                       
                      </div>
                      <div class="carousel-item">
                        <img src="./img/k2.jpg" class="d-block w-100" style="height: 550px;" alt="...">
                       
                      </div>
                      <div class="carousel-item">
                        <img src="./img/k3.jpg" class="d-block w-100" style="height: 550px;" alt="...">
                       
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
                    <h6 class="h6">Starting Price</h6>
                    <p class="fw-bold fs-5">&#8377;19000</p>

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
                    <p class="fw-bold fs-5">3 Days</p>
                    
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
                            <form method="post" action="">
                              <div class="mb-1">
                                <label for="name" class="col-form-label">Full Name</label>
                                <input type="text" class="form-control" id="name" required>
                              </div>
                              <div class="mb-1">
                                <label for="email" class="col-form-label">Email</label>
                                <input type="email" class="form-control" id="email" required>
                              </div>
                              <div class="mb-1">
                                <label for="phone" class="col-form-label">Mobile no.</label>
                                <input type="tel" class="form-control" id="phone" required>
                              </div>
                              <div class="mb-1">
                                <label for="d-date" class="col-form-label">Departure Date</label>
                                <input type="date" class="form-control" id="d-date" required>
                              </div>
                              <div class="mb-1">
                                <label for="people" class="col-form-label">Total People</label>
                                <input type="number" class="form-control" id="people" required>
                              </div>
                            </form>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Pay 19000</button>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- booking modal end -->
                </div>
        </div>
        </div>

        <h4 class="h4 mt-4 fw-semibold">Overview</h4>
        <p class="mb-4">Kedarnath is a town and Nagar Panchayat in Rudraprayag district of Uttarakhand, India, known primarily for the Kedarnath Temple. It is approximately 86 kilometres from Rudraprayag, the district headquarter. Kedarnath is the most remote of the four Chota Char Dham pilgrimage sites. Kedarnath, a popular Hindu temple, tucked away in the lap of Garhwal Himalayas, some 221 km from Rishikesh in Uttarakhand, is one of the twelve Jyotirlinga temples of Lord Shiva. Lying against the backdrop of the magnificent Kedarnath Mandir Range, at an altitude of 3580 meters, the splendid Kedarnath Dham is where the devotees come seeking the blessings of Lord Shiva. Kedarnath Mandir is said to have been constructed by Adi Shankaracharya in the 8th century A.D. The nearby flowing Mandakini River, mesmerizing vistas and splendid sceneries in the form of the snow-clad mountains, rhododendron forests, and salubrious environment make Kedarnath Dham Yatra, a tranquil and picturesque place to be at.</p>

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