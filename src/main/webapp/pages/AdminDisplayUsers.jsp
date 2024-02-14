<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>All Users</title>
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

           <!--table-->
        <div class="col-8 mt-5">
        <table class="table table-dark">
            <thead>
              <tr>
                <th scope="col">Id</th>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">Password</th>
                <th scope="col">Gender</th>
                <th scope="col">Action</th>
              
              </tr>
            </thead>
            <tbody>
            <c:forEach items="${userData}" var="e">
              <tr>
                <td>${e.id}</td>
				<td>${e.name}</td>
				<td>${e.email}</td>
				<td class="hidetext">${e.pass}</td>
				<td >${e.gender}</td>
				<td>
					<a class = "text-decoration-none" href = "/editUser/${e.id}">Edit</a>
					<a class="text-danger text-decoration-none" href = "/delUser/${e.id}">Delete</a>
				</td>
              </tr>
              </c:forEach>
            </tbody>
          </table>

        </div>
    </div>

       
</body>
</html>