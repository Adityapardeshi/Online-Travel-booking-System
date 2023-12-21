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
    <title>Add Hotel</title>
</head>
<body>
    <h1 class="text-center mt-3">Add new Hotel</h1>

    <div class="container d-flex align-items-center justify-content-center mt-5">
        <div class="card d-flex align-items-center justify-content-center shadow-lg" style="width: 45rem;">
    <form style="width: 65%;" class="my-3">
        <div class="mb-3">
          <label for="Name" class="form-label">Name</label>
          <input type="text" class="form-control" id="name">
        </div>
        <div class="mb-3">
          <label for="address" class="form-label">Address</label>
          <input type="number" class="form-control" id="address">
        </div>
        <div class="mb-3">
            <label for="hotel" class="form-label">Rating</label>
            <select name="hotel" class="form-select" id="hotel">
                <option value="2">2&#9733;</option>
                <option value="3">3&#9733;</option>
                <option value="4">4&#9733;</option>
                <option value="5">5&#9733;</option>
                <option value="6">6&#9733;</option>
                <option value="7">7&#9733;</option>
              </select>
          </div>
          <div class="mb-3">
            <label for="price" class="form-label">Price Per Night</label>
            <input type="number" class="form-control" id="price">
          </div>
        <button type="submit" class="btn btn-primary">Submit</button>
      </form>
    </div>
</div>
</body>
</html>