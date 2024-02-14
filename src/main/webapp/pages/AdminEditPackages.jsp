<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" xmlns:th="<http://www.thymeleaf.org>">
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
    <h1 class="text-center mt-3">Edit Package</h1>

    <div class="container d-flex align-items-center justify-content-center mt-5">
        <div class="card d-flex text-white bg-dark align-items-center justify-content-center shadow-lg" style="width: 45rem;">
    <form style="width: 65%;" class="my-3" method="post" action="/updatePackage" enctype= "multipart/form-data">
        <div class="mb-3">
          <label for="id" class="form-label">Id</label>
          <input type="text" name="id" class="form-control" id="id" value="${data.id}" readonly>
        </div>
        <div class="mb-3">
          <label for="pack_name" class="form-label">Package Name</label>
          <input type="text" name="pack_name" class="form-control" value="${data.pack_name}" id="pack_name" required>
        </div>
        <div class="mb-3">
          <label for="from_destination" class="form-label">From</label>
          <input type="text" name="from_destination" class="form-control" value="${data.from_destination}" id="from_destination" required>
        </div>
        <div class="mb-3">
          <label for="place" class="form-label">Place</label>
          <input type="text" name="place" class="form-control" id="place" value="${data.place}" required>
        </div>
        <div class="mb-3">
          <label for="nights" class="form-label">Total Nights</label>
          <input type="number" name="nights" class="form-control" id="nights" value="${data.nights}" required>
        </div>
        <div class="mb-3">
            <label for="hotel" class="form-label">Hotel Name</label>
            <select name="hotel" name="hotel" class="form-select" id="hotel" required>
                <c:forEach items="${options}" var="option">
		                <option value="${option.name}" ${option.name == data.hotel ? 'selected' : ''}>${option.name}</option>
		            </c:forEach>
              </select>
          </div>
          <div class="mb-3">
            <label for="Activities" class="form-label">Activities</label>
            <input type="text" name="activities" class="form-control" id="Activities" value="${data.activities}" required>
          </div>
          <div class="mb-3">
            <label for="price" class="form-label">Price</label>
            <input type="number" name="price" class="form-control" id="price" value="${data.price}" required>
          </div>
          <div class="mb-3">
            <label for="description" class="form-label">Description</label>
            <input type="text" name="description" class="form-control" id="description" maxlength="1000" value="${data.description}" required>
          </div>
        
          <div class="mb-3">
            <label for="thumbnail2" class="form-label">Thumbnail (img)</label>&nbsp; &nbsp;&nbsp;&nbsp;
            <label for="thumbnail" class="form-label bg-dark text-white">Selected Img - </label>
            <input type="text" name="thumbnail" readonly value="${data.thumbnail}">
            <input type="file" name="thumbnail2" class="form-control"  id="thumbnail" accept="image/*" >
          </div>
		<div class="mb-3">
            <label for="other_images" class="form-label">Other image</label> &nbsp; &nbsp;&nbsp;&nbsp;
            <label for="other_image" class="form-label bg-dark text-white">Selected Img - </label>
            <input type="text" name="other_image" readonly value="${data.other_image}">
            <input type="file" name="other_images" class="form-control" id="other-images">
          </div>
        <button type="submit" class="btn btn-primary">Save Changes</button>
      </form>
    </div>

</div>
</div>
</div>
</body>
</html>