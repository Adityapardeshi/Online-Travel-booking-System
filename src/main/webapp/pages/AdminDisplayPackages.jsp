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
    <title>Packages</title>
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
                <li><a href="#" class="link-dark rounded">New...</a></li>
                <li><a href="#" class="link-dark rounded">Profile</a></li>
                <li><a href="#" class="link-dark rounded">Settings</a></li>
                <li><a href="#" class="link-dark rounded">Sign out</a></li>
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
                <th scope="col">Place</th>
                <th scope="col">Hotel</th>
                <th scope="col">Description</th>
                <th scope="col">Activities</th>
                <th scope="col">Nights</th>
                <th scope="col">Main Img</th>
                <th scope="col">Price</th>
                <th scope="col">Action</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach items="${data}" var="e">
              <tr>
                <td>${e.id}</td>
				<td>${e.place}</td>
				<td>${e.hotel}</td>
				<td><button id="showbtn" class="bg-none text-warning btn" onclick="displayText(this)">Show</button><span id="desc" style="display:none">${e.description}<button id="hidebtn" class="bg-none text-warning btn" onclick="hideText(this)">Hide</button></span></td>
				<td>${e.activities}</td>
				<td>${e.nights}</td>
				<td>${e.thumbnail}</td>
				<td>&#8377;${e.price}</td>
				<td>
					<a class="text-decoration-none" href = "/editPackage/${e.id}">Edit</a>
					<a class="text-danger text-decoration-none" href = "/delPackage/${e.id}">Delete</a>
				</td>
              </tr>
              </c:forEach>
            </tbody>
          </table>

        </div>
    </div>

       <script>
       function displayText(btn) {
    	   let parent = btn.parentElement;
    	   let d = parent.childNodes[1];
    	   
    	   d.style.display = "block";
    	   //var text = document.getElementById("desc");
    	   //var btn = document.getElementById("showbtn"););
    	   if(btn.style.display != "none") btn.style.display = "none";
    	   else btn.style.display = "block";
    	 }
       
       function hideText(btn){
    	   let parent = btn.parentElement;
    	   parent.style.display = "none";
    	   
    	   let td = parent.parentElement;
    	   let showbtn = td.childNodes[0];
    	   console.log(showbtn);
    	   showbtn.style.display = "block";
       }
       </script>
</body>
</html>