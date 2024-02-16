<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="org.springframework.ui.ModelMap" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/sidebars.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <title>Edit Hotel</title>
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
   
	
	<div class="col-9">
	    <h1 class="text-center mt-3">Edit Hotel Details</h1>
	    <div class="container d-flex align-items-center  justify-content-center mt-5">
	        <div class="card d-flex align-items-center text-white justify-content-center shadow-lg bg-dark" style="width: 45rem;">
	    <form style="width: 65%;" class="my-3" action="/updateHotel" method="get">
	        <div class="mb-3">
	        <label for="id" class="form-label">Id</label>
	          <input type="number" name="id" value="${data.id}" class="form-control" id="id" readonly>
	          
	          <label for="Name" class="form-label">Name</label>
	          <input type="text" name="name" value="${data.name}" class="form-control" id="name" required>
	        </div>
	        <div class="mb-3">
	          <label for="address" class="form-label">Address</label>
	          <input type="text" name="address" value="${data.address}" class="form-control" id="address" required>
	        </div>
	        <div class="mb-3">
	            <label for="rating" class="form-label">Rating</label>
	            <select id="rating" name="rating" class="form-control">
		            <c:forEach items="${options}" var="option">
		                <option value="${option}" ${option == data.rating ? 'selected' : ''}>${option}&#9733;</option>
		            </c:forEach>
        </select>
	          </div>
	          <div class="mb-3">
	            <label for="price" class="form-label">Price Per Night</label>
	            <input type="number" name="price" class="form-control" value="${data.price }" id="price" required>
	          </div>
	        <button type="submit" class="btn btn-primary">Submit</button>
	      </form>
	    </div>
	</div>
</div>
</div>

</body>

<script>
	var selectd = '<%= request.getAttribute("data") %>';
	console.log(selectd);
</script>

</html>