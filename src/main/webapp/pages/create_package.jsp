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
    <title>Create</title>
</head>
<body>
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
</body>
</html>