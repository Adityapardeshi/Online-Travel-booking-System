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
    <link href="/css/sidebars.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <title>Admin Dashboard</title>
</head>
<body>

    <!--side nav bar-->
    <div class="row">
    <div class="col-3">
    <div class="flex-shrink-0 p-3 text-white shadow-lg" style="width: 280px; height: 100vh;">
        <a href="/" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
         
          <span class="fs-5 ms-2 fw-semibold">Admin Home</span>
        </a>
        <ul class="list-unstyled ps-0">
          <li class="mb-1">
            <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
              Home
            </button>
            <div class="collapse show" id="home-collapse">
              <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                <li><a href="/adminHome" class="link-dark rounded">Overview</a></li>
              </ul>
            </div>
          </li>
          <li class="mb-1">
            <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
              Create
            </button>
            <div class="collapse" id="dashboard-collapse">
              <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                <li><a href="./create_package" class="link-dark rounded">Package</a></li>
                <li><a href="/add_hotel" class="link-dark rounded">Hotel</a></li>
              </ul>
            </div>
          </li>
          <li class="mb-1">
            <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
              View/Edit
            </button>
            <div class="collapse" id="orders-collapse">
              <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                <li><a href="/displayPackage" class="link-dark rounded">Package</a></li>
                <li><a href="/displayUsers" class="link-dark rounded">User</a></li>
                <li><a href="/displayHotels" class="link-dark rounded">Hotels</a></li>
                <li><a href="allbookings" class="link-dark rounded">Bookings</a></li>
              </ul>
            </div>
          </li>
          <li class="border-top my-3"></li>
          <li class="mb-1">
            <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
              Account
            </button>
            <div class="collapse" id="account-collapse">
              <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                <li><a href="#" class="link-dark rounded">Profile</a></li>
                <li><a href="/logout_admin" class="link-dark rounded">Sign out</a></li>
              </ul>
            </div>
          </li>
        </ul>
      </div>
    </div>
   

    <!--main content-->
    <div class="col-9">
    <div class="row mt-5">
        <div class="col-4">
            <div class="card shadow-lg bg-danger text-white" style="width: 16rem;">
                <div class="card-header fw-bold">Total Users</div>
                <div id="users" class="card-body">${users}</div>
            </div>
        </div>
        <div class="col-4">
            <div class="card shadow-lg bg-primary text-white" style="width: 16rem;">
                <div class="card-header fw-bold">Total Packages</div>
                <div id="packages" class="card-body">${packs}</div>
            </div>
        </div>
        <div class="col-4">
            <div class="card shadow-lg bg-dark text-white" style="width: 16rem;">
                <div class="card-header fw-bold">Active Bookings</div>
                <div id="bookings" class="card-body">${bookings}</div>
            </div>
        </div>
    </div>
    
    <div class="my-5">
  		<canvas id="myChart" height="140rem"></canvas>
	</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
  const ctx = document.getElementById('myChart');

  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['Users', 'Packages', 'Bookings'],
      datasets: [{
        label: 'No',
        data: [document.getElementById('users').innerText, document.getElementById('packages').innerText, document.getElementById('bookings').innerText],
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });

  
  function message(){
      Swal.fire({
    	  icon: "success",
    	  title: "Saved Succesfully",
    	  showConfirmButton: false,
    	  timer: 2500
    	});
    }

</script>
    
    <c:if test="${not empty hotelAttrribute}">
        <script>
        	message();
        </script>
    </c:if>
    
    <c:if test="${not empty packageAttrribute}">
        <script>
        	message();
        </script>
    </c:if>
    
    </div>
</div>
</body>
</html>