<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Vehicle registration</title>
  </head>
  <body>
  
  <%
  String regno=(String) session.getAttribute("regno");
  session.setAttribute("regno", "");
  
  %>

      <!-- NAVBAR -->
      <nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark">
        <ul class="navbar-nav">
          <li>
          <a class="navbar-brand" href="HOME_PAGE.html">
            <!-- <img src="/docs/4.0/assets/brand/bootstrap-solid.svg" width="30" height="30" class="d-inline-block align-top" alt=""> -->
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
      <a class="dropdown-item" href="Signup_G.html">Garage</a>
      <a class="dropdown-item" href="Signup_Dr.html">Driver</a>
    </div>
  </div>
  </li>
  <li class="ml-auto">
    <button class="btn btn-secondary btn-dark bg-dark" style="font-size:20px;" type="button" >Logout</button>
  </li>
        </ul>
  </nav>

<!-- Vehicle registration form-->

<p> </p>
<p> </p>
<div class="container mx-auto" style="width:500px; border-width:2px; border-style:solid;border-color:#4c4a4a;background-color:#eff8ff;">
  <h1> </h1>
  <div class="table-wrapper-scroll-y mx-auto" style="display:block; max-height:650px; max-width:1500px; overflow-y:auto; -ms-overflow-style: -ms-autohiding-scrollbar;">
  <form action="AddVehicle" method="post">
    <div class="form-group">
      <label for="V_reg"><b style="font-size:17px;">Vehicle registration no.</b></label>
      <input type="text" class="form-control" name="regno" value="<%=regno %>" readonly="readonly" id="V_reg" placeholder="Vehicle registration no." style="width:300px;border-width:1px; border-style:solid;border-color:#4c4a4a;"required>
    </div>
    <b style="font-size:17px;">Brands</b>
    <input type="text" class="form-control" name="brand" id="brand" placeholder="Brand Name" style="width:300px;border-width:1px; border-style:solid;border-color:#4c4a4a;"required>
<!--     <div class="row">
        <div class="col-sm-3">
          <a class="btn btn-md" style="width:100px;background-color:#eff8ff; color:black; border-color:#4c4a4a;btn-outline-color:#f7fcf8;" data-toggle="collapse" href="#CarB" role="button" aria-expanded="false" aria-controls="collapseExample">Car
          </a>
          <div class="collapse" id="CarB"style="background-color:white;width:200px;">
            <div class="card card-body" style="width:200px; border-width:1px; border-style:solid;border-color:#4c4a4a;background-color:white;">
              <div class="table-wrapper-scroll-y mx-auto" style="display:block; max-height:300px; max-width:250px; overflow-y:auto; -ms-overflow-style: -ms-autohiding-scrollbar;">
              <table class="table" style="background-color:white;">
                <tr>
                  <th><input type="checkbox"> Maruti Suzuki</th>
                </tr>
                <tr>
                  <th><input type="checkbox"> Hyundai</th>
                </tr>
                <tr>
                  <th><input type="checkbox"> Mahindra</th>
                </tr>
                <tr>
                  <th><input type="checkbox"> Tata Motors</th>
                </tr>
                <tr>
                  <th><input type="checkbox"> Honda</th>
                </tr>
                <tr>
                  <th><input type="checkbox"> Toyota</th>
                </tr>
                <tr>
                  <th><input type="checkbox"> Renault</th>
                </tr>
                <tr>
                  <th><input type="checkbox"> Volkswagen</th>
                </tr>
                <tr>
                  <th><input type="checkbox"> Datsun</th>
                </tr>
                <tr>
                  <th><input type="checkbox"> Skoda</th>
                </tr>
                <tr>
                  <th><input type="checkbox"> Jeep</th>
                </tr>
                <tr>
                  <th><input type="checkbox"> Nissan</th>
                </tr>
                <tr>
                  <th><input type="checkbox"> Fiat</th>
                </tr>
                <tr>
                  <th><input type="checkbox"> </th>
                </tr>
              </table>
              </div>
            </div>
            </div>

        </div>
        <div class="col-sm-3 mr-auto">
          <a class="btn btn-md" style="width:100px;background-color:#eff8ff; color:black; border-color:#4c4a4a;btn-outline-color:#f7fcf8;" data-toggle="collapse" href="#BikeB" role="radiogroup" aria-expanded="false" aria-controls="collapseExample">Bike
          </a>
          <div class="collapse" id="BikeB"style="background-color:white;width:200px;">
            <div class="card card-body" style="width:200px; border-width:1px; border-style:solid;border-color:#4c4a4a;background-color:white;">
              <div class="table-wrapper-scroll-y mx-auto" style="display:block; max-height:300px; max-width:300px; overflow-y:auto; -ms-overflow-style: -ms-autohiding-scrollbar;">
              <table class="table" style="background-color:white;">
                <tr>
                  <th><input type="checkbox"> Hero</th>
                </tr>
                <tr>
                  <th><input type="checkbox"> Yamaha</th>
                </tr>
                <tr>
                  <th><input type="checkbox"> Royal Enfield</th>
                </tr>
                <tr>
                  <th><input type="checkbox"> Suzuki</th>
                </tr>
                <tr>
                  <th><input type="checkbox"> Honda</th>
                </tr>
                <tr>
                  <th><input type="checkbox"> Piaggio</th>
                </tr>
                <tr>
                  <th><input type="checkbox"> Bajaj</th>
                </tr>
                <tr>
                  <th><input type="checkbox"> TVS</th>
                </tr>
                <tr>
                  <th><input type="checkbox"> Mahindra</th>
                </tr>
              </table>
            </div>
            </div>

        </div>
        </div>
        </div> --><br>

        <b style="font-size:17px;">Vehicle types</b>
 <input type="text" class="form-control" name="type" id="brand" placeholder="Vehicle Type" style="width:300px;border-width:1px; border-style:solid;border-color:#4c4a4a;"required>
        <!-- <div class="row">
            <div class="col-sm-3">
              <a class="btn btn-md" style="width:100px;background-color:#eff8ff; color:black; border-color:#4c4a4a;btn-outline-color:#f7fcf8;" data-toggle="collapse" href="#CarT" role="button" aria-expanded="false" aria-controls="collapseExample">Car
              </a>
              <div class="collapse" id="CarT"style="background-color:white;width:200px;">
                <div class="card card-body" style="width:200px; border-width:1px; border-style:solid;border-color:#4c4a4a;background-color:white;">
                  <div class="table-wrapper-scroll-y mx-auto" style="display:block; max-height:300px; max-width:250px; overflow-y:auto; -ms-overflow-style: -ms-autohiding-scrollbar;">
                  <table class="table" style="background-color:white;">
                    <tr>
                      <th><input type="checkbox"> Hatchback</th>
                    </tr>
                    <tr>
                      <th><input type="checkbox"> Sedan</th>
                    </tr>
                    <tr>
                      <th><input type="checkbox"> MPV</th>
                    </tr>
                    <tr>
                      <th><input type="checkbox"> SUV</th>
                    </tr>
                    <tr>
                      <th><input type="checkbox"> Crossover</th>
                    </tr>
                    <tr>
                      <th><input type="checkbox"> Coupe</th>
                    </tr>
                    <tr>
                      <th><input type="checkbox"> Convertible</th>
                    </tr>
                    <tr>
                      <th><input type="checkbox"> </th>
                    </tr>
                  </table>
                  </div>
                </div>
                </div>

            </div>
            <div class="col-sm-3 mr-auto">
              <a class="btn btn-md" style="width:100px;background-color:#eff8ff; color:black; border-color:#4c4a4a;btn-outline-color:#f7fcf8;" data-toggle="collapse" href="#BikeT" role="radiogroup" aria-expanded="false" aria-controls="collapseExample">Bike
              </a>
              <div class="collapse" id="BikeT"style="background-color:white;width:200px;">
                <div class="card card-body" style="width:200px; border-width:1px; border-style:solid;border-color:#4c4a4a;background-color:white;">
                  <div class="table-wrapper-scroll-y mx-auto" style="display:block; max-height:300px; max-width:300px; overflow-y:auto; -ms-overflow-style: -ms-autohiding-scrollbar;">
                  <table class="table" style="background-color:white;">
                    <tr>
                      <th><input type="checkbox"> Bike</th>
                    </tr>
                    <tr>
                      <th><input type="checkbox"> Scooter</th>
                    </tr>
                  </table>
                </div>
                </div>

            </div>
            </div>
            </div> --><br>


  <div class="form-group">
    <label for="modelN"><b style="font-size:17px;">Model name -</b></label>
    <input type="text" class="form-control" id="modelN" name="model" placeholder="model name" style="width:300px;border-width:1px; border-style:solid;border-color:#4c4a4a;"required>
  </div>
  <div class="form-group">
    <label for="Mnyr"><b style="font-size:17px;">Manufacturing year</b></label>
    <input type="text" class="form-control" id="Mnyr" name="year" placeholder="2019" style="width:100px;border-width:1px; border-style:solid;border-color:#4c4a4a;"required>
  </div>

  <div class="form-group">
    <label for="Pr"><b style="font-size:17px;">Price(₹)</b></label>
    <input type="text" class="form-control" id="Mnyr" name="price" placeholder="100000" style="width:100px;border-width:1px; border-style:solid;border-color:#4c4a4a;"required>
  </div>
  <div class="form-group form-radio">
    <p><b style="font-size:17px;">Fuel type</b> <br>
      <input type="radio" name="Ft" value="Petrol" style="border-width:1px; border-style:solid;border-color:#4c4a4a;" required><b> Petrol / </b>
      <input type="radio" name="Ft" value="Diesel" style="border-width:1px; border-style:solid;border-color:#4c4a4a;" required><b> Diesel / </b>
      <input type="radio" name="Ft" value="CNG" style="border-width:1px; border-style:solid;border-color:#4c4a4a;" required><b> CNG </b>
    </p>
    </div>
    <div class="form-group">
      <label for="Uyr"><b style="font-size:17px;">Used(yr)</b></label>
      <input type="text" class="form-control" id="Uyr" name="used" placeholder="1" style="width:80px;border-width:1px; border-style:solid;border-color:#4c4a4a;"required>
    </div>
    <div class="form-group form-radio">
      <p><b style="font-size:17px;">Purpose</b> <br>
        <input type="radio" name="Prp" value="Sell" style="border-width:1px; border-style:solid;border-color:#4c4a4a;" required><b> Sell  </b>
        <input type="radio" name="Prp" value="Rent" style="border-width:1px; border-style:solid;border-color:#4c4a4a;" required><b> Rent  </b>
      </p>
      </div>

<button class="btn btn-success btn-lg" Style="width:300px;text-align:center;"><b>Register</b></button>


  </form>
</div>
</div>




    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>
