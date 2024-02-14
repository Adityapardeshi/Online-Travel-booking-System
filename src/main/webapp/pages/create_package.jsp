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
    <title>Create</title>
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
                <li><a href="/create_package" class="link-dark rounded">Package</a></li>
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
   

	<div class="col-8">
    <h1 class="text-center mt-3">Create new Package</h1>

    <div class="container d-flex align-items-center justify-content-center mt-5">
        <div class="card bg-dark text-white d-flex align-items-center justify-content-center shadow-lg" style="width: 45rem;">
    <form style="width: 65%;" class="my-3" method="post" action="/add_package" enctype= "multipart/form-data">
        <div class="mb-3">
          <label for="pack_name" class="form-label">Package Name</label>
          <input type="text" name="pack_name" class="form-control" id="pack_name" required>
        </div>
        <div class="mb-3">
          <label for="from_destination" class="form-label">From</label>
          <input type="text" name="from_destination" class="form-control" id="from_destination" required>
        </div>
        <div class="mb-3">
          <label for="place" class="form-label">Destination</label>
          <input type="text" name="place" class="form-control" id="place" required>
        </div>
        <div class="mb-3">
          <label for="nights" class="form-label">Total Nights</label>
          <input type="number" name="nights" class="form-control" id="nights" required>
        </div>
        <div class="mb-3">
            <label for="hotel" class="form-label">Hotel Name</label>
            <select name="hotel" name="hotel" class="form-select" id="hotel" required>
            	<option value="null">Choose</option>
                <c:forEach items="${options}" var="option">
		                <option value="${option.name}">${option.name}</option>
		            </c:forEach>
              </select>
          </div>
          <div class="mb-3">
            <label for="Activities" class="form-label">Activities</label>
            <input type="text" name="activities" class="form-control" id="Activities" required>
          </div>
          <div class="mb-3">
            <label for="price" class="form-label">Price</label>
            <input type="number" name="price" class="form-control" id="price" required>
          </div>
		<div class="mb-3">
            <label for="description" class="form-label">Description</label>
            <input type="text" name="description" class="form-control" id="description" maxlength="1000" required>
          </div>
		<div class="mb-3">
            <label for="thumbnail" class="form-label">Thumbnail (img)</label>
           <input type="file" name="thumbnail2" class="form-control" id="thumbnail">
   
          </div>
		<div class="mb-3">
            <label for="other_images" class="form-label">Other image</label>
            <input type="file" name="other_images" class="form-control" id="other-images">
          </div>
        <button type="submit" class="btn btn-primary">Submit</button>
      </form>
    </div>
</div>
</div>
</body>
</html>