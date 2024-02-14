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
    <title>Document</title>
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
                <a class="nav-link " aria-current="page" href="/dash">Home</a>
              </li>
              <li class="nav-item">
               <a class="nav-link" href="#">Find Packages</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" href="/userBookings">Your Bookings</a>
              </li>
            </ul>
            <div class=" d-flex">
        	<a href="/logout" class="btn btn-outline-danger" type="submit">Logout</a>
        	</div>
          </div>
        </div>
      </nav>

    <div class="container mt-5 d-flex align-items-center justify-content-center">
    <table class="table table-dark " style="width:50rem">
        <thead>
          <tr>
            <th scope="col">Id</th>
            <th scope="col">Package name</th>
            <th scope="col">People</th>
            <th scope="col">Departure Date</th>
            <th scope="col">Action</th>
          
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${bookings}" var="e" varStatus="vs">
          <tr>
            <td>${e.id}</td>
            <td>${e.pkg_name}</td>
            <td>${e.total_people}</td>
            <td>${e.departure_date}</td>
            <td>
                <a class="text-danger text-decoration-none" data-bs-toggle="modal" data-bs-target="#myModal${vs.index}">Cancel</a>
            </td>
          </tr>
          
          <!-- confirm Modal -->
		<div class="modal fade" id="myModal${vs.index}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Are you Sure?</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        <a class="btn btn-danger" href="/cancelBooking/${e.id}">Cancel Booking</a>
		      </div>
		    </div>
		  </div>
		</div>
          </c:forEach>
        </tbody>
      </table>
      


	
    </div>
</body>
</html>