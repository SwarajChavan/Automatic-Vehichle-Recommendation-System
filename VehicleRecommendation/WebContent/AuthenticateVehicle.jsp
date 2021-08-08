<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

    <title>Dealer Login</title>
  </head>
  <body style="background-color:#f2fff6;">
      <!-- NAVBAR -->
      <nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark">
        <ul class="navbar-nav">
          <li>
          <a class="navbar-brand" href="HOME_PAGE.html">
              Home
          </a>
          </li>
          <li>
            <button type="button" class="btn btn-primary btn-md btn-dark bg-dark" style="font-size:20px; width:100px; color:white;">Buy</button>
          </li>
          <li>
            <a class="btn btn-primary btn-md btn-dark bg-dark" href="login_D.html" style="font-size:20px; width:100px; color:white;">Sell</a>
          </li>
          <li>
            <button type="button" class="btn btn-primary btn-md btn-dark bg-dark" style="font-size:20px; width:100px; color:white;">Rent</button>
          </li>
          <li>
            <button type="button" class="btn btn-primary btn-md btn-dark bg-dark" style="font-size:20px; width:120px; color:white;">About us</button>
          </li>
            <li>
              <button type="button" class="btn btn-primary btn-md btn-dark bg-dark" style="font-size:20px; width:100px; color:white;">Contact</button>
            </li>
            <li class="navbar-nav mr-auto" style="padding-left: 40px;">
              <form class="form-inline">
              <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" style="width:250px;">
              <button type="button" class="btn btn-outline-success">Search</button>
              </form>
            </li>
            </ul>
        <ul class="navbar-nav ml-auto">
          <li class="ml-auto">
          <div class="dropdown">
    <button class="btn btn-secondary dropdown-toggle  btn-dark bg-dark"  style="font-size:20px"; type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      Sign up!
    </button>
    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
      <a class="dropdown-item" href="Sign_upC.html">Consumer</a>
      <a class="dropdown-item" href="Signup_D.html">Dealer</a>
      <a class="dropdown-item" href="Signup_G.html">Garage</a>
      <a class="dropdown-item" href="Signup_Dr.html">Driver</a>
    </div>
  </div>
  </li>
  <li class="ml-auto">
  <div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle  btn-dark bg-dark" style="font-size:20px;" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
  Login
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
  <a class="dropdown-item" href="login_C.html">Consumer</a>
  <a class="dropdown-item" href="login_D.html">Dealer</a>
  <a class="dropdown-item" href="login_G.html">Garage</a>
  <a class="dropdown-item" href="login_Dr.html">Driver</a>

  </div>
  </div>
  </li>
        </ul>
  </nav>
  <p> </p><br>
  <p> </p>
  <div class="container mx-auto" style="width:450px; border-width:2px; border-style:solid;border-color:#4c4a4a;background-color:#eff8ff;">
    <h1> </h1>
    <b style="font-size:20px;">Authenticate Vehicle</b>
    <div class="table-wrapper-scroll-y mx-auto" style="display:block; max-height:600px; max-width:1500px; overflow-y:auto; -ms-overflow-style: -ms-autohiding-scrollbar;">
    <form action="AuthenticateVehicle" method="post">
      <div class="form-group">
        <label for="regno"><b>Enter Vehicle Registration No.</b></label>
        <input type="text" class="form-control" name="regno" id="regno" placeholder="MH04CG4875" style="width:400px;border-width:1px; border-style:solid;border-color:#4c4a4a;"required>
      </div>

      <button type="submit" class="btn btn-success" style="text-align:center;">Submit</button>
      <p></p>
    </form>
</div>
  </div>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
  </body>
</html>
