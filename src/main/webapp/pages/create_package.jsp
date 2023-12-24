<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
   

	<div class="col-8">
    <h1 class="text-center mt-3">Create new Package</h1>

    <div class="container d-flex align-items-center justify-content-center mt-5">
        <div class="card d-flex align-items-center justify-content-center shadow-lg" style="width: 45rem;">
    <form style="width: 65%;" class="my-3" method="post" action="/add_package">
        <div class="mb-3">
          <label for="place" class="form-label">Place</label>
          <input type="text" name="place" class="form-control" id="place">
        </div>
        <div class="mb-3">
          <label for="nights" class="form-label">Total Nights</label>
          <input type="number" name="nights" class="form-control" id="nights">
        </div>
        <div class="mb-3">
            <label for="hotel" class="form-label">Hotel Name</label>
            <select name="hotel" name="hotel" class="form-select" id="hotel">
                <option value="The Taj Palace">The Taj Palace</option>
                <option value="Rambagh Palace">Rambagh Palace</option>
                <option value="SaffronStays">SaffronStays</option>
                <option value="Crosswinds">Crosswinds</option>
              </select>
          </div>
          <div class="mb-3">
            <label for="Activities" class="form-label">Activities</label>
            <input type="text" name="activities" class="form-control" id="Activities">
          </div>
          <div class="mb-3">
            <label for="price" class="form-label">Price</label>
            <input type="number" name="price" class="form-control" id="price">
          </div>
        <button type="submit" class="btn btn-primary">Submit</button>
      </form>
    </div>
</div>
</div>
</body>
</html>