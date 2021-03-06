<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>HOMEPAGE</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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

<!-- Image slider -->
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="background-color:black; border-width:3px; border-style:solid; border-color:black;">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-30 mx-auto" src="ktm-rc-390-black.jpg" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-30 mx-auto" src="Marvel-Black-Panther-1.jpg" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-30 mx-auto" src="Harley-Davidson-Black-Panther-Ferocious-Breakout-9-e1471838663412-850x545.jpg" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<!-- 2nd SECTION -->
<p> </p>
<div style="background-color:#f7fffa;">
  <div class="row">
    <div class="col-md-3 container" >
      <div class="table-wrapper-scroll-y ml-auto" style="display:block; max-height:400px; max-width:500px; overflow-y:auto; -ms-overflow-style: -ms-autohiding-scrollbar;">
        <table class="table ml-auto" style="border-width:3px; border-style:solid; border-color:#2ab760">
          <thead><tr style="border-width:3px; border-style:solid; border-color:#2ab760">
              <th style="text-align:center;">Filter</th>
            </tr></thead>

<!-- CAR -->
            <tr>
              <th>
                <a class="btn btn-md" style="background-color:#f7fcf8; color:black; border-color:f7fcf8;btn-outline-color:f7fcf8;" data-toggle="collapse" href="#Car" role="button" aria-expanded="false" aria-controls="collapseExample">Car
                </a>
                <div class="collapse" id="Car"style="background-color:#f7fcf8;">
                  <div class="card card-body" style="background-color:#f7fcf8;">
                    <table class="table" style="background-color:#f7fcf8;">
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

                    </table>
                    </th>
                  </tr>

<!-- BIKE -->
            <tr>
              <th>
                <a class="btn btn-md" style="background-color:#f7fcf8; color:black; border-color:f7fcf8;btn-outline-color:f7fcf8;" data-toggle="collapse" href="#Bike" role="button" aria-expanded="false" aria-controls="collapseExample">Bike
                </a>
                <div class="collapse" id="Bike"style="background-color:#f7fcf8;">
                  <div class="card card-body"style="background-color:#f7fcf8;">
                    <table class="table" style="background-color:#f7fcf8;">
                      <tr>
                        <th><input type="checkbox"> Bike</th>
                      </tr>
                      <tr>
                        <th><input type="checkbox"> Scooter</th>
                      </tr>
                    </table>
                    </th>
                  </tr>

<!-- FUEL -->
            <tr>
              <th>
                <a class="btn btn-md" style="background-color:#f7fcf8; color:black; border-color:f7fcf8;btn-outline-color:f7fcf8;" data-toggle="collapse" href="#Fuel" role="button" aria-expanded="false" aria-controls="collapseExample">Fuel
                </a>
                <div class="collapse" id="Fuel"style="background-color:#f7fcf8;">
                  <div class="card card-body"style="background-color:#f7fcf8;">
                    <table class="table" style="background-color:#f7fcf8;">
                      <tr>
                        <th><input type="checkbox"> Petrol</th>
                      </tr>
                      <tr>
                        <th><input type="checkbox"> Diesel</th>
                      </tr>
                      <tr>
                        <th><input type="checkbox"> CNG</th>
                      </tr>
                    </table>
                    </th>
                  </tr>





<!-- Mileage -->

            <tr>
              <th>
                <a class="btn btn-md" style="background-color:#f7fcf8; color:black; border-color:f7fcf8;btn-outline-color:f7fcf8;" data-toggle="collapse" href="#Mileage" role="button" aria-expanded="false" aria-controls="collapseExample">Mileage
                </a>
                <div class="collapse" id="Mileage"style="background-color:#f7fcf8;">
                  <div class="card card-body"style="background-color:#f7fcf8;">
                    <table class="table" style="background-color:#f7fcf8;">
                      <tr>
                        <th><input type="text" style="width:50px"> km/l</th>
                      </tr>
                      <tr>
                        <th>upto</th>
                      </tr>
                      <tr>
                        <th><input type="text"style="width:50px"> km/l</th>
                      </tr>
                    </table>
                    </th>
                  </tr>

                  <!-- Km's Driven -->

                  <tr>
                    <th>
                      <a class="btn btn-md" style="background-color:#f7fcf8; color:black; border-color:f7fcf8;btn-outline-color:f7fcf8;" data-toggle="collapse" href="#Km's Driven" role="button" aria-expanded="false" aria-controls="collapseExample">Km's Driven
                      </a>
                      <div class="collapse" id="Km's Driven"style="background-color:#f7fcf8;">
                        <div class="card card-body"style="background-color:#f7fcf8;">
                          <table class="table" style="background-color:#f7fcf8;">
                            <tr>
                              <th><input type="text" style="width:50px"> km</th>
                            </tr>
                          </table>
                          </th>
                        </tr>

<!-- Price -->

                        <tr>
                          <th>
                            <a class="btn btn-md" style="background-color:#f7fcf8; color:black; border-color:f7fcf8;btn-outline-color:f7fcf8;" data-toggle="collapse" href="#Price" role="button" aria-expanded="false" aria-controls="collapseExample">Price
                            </a>
                            <div class="collapse" id="Price"style="background-color:#f7fcf8;">
                              <div class="card card-body"style="background-color:#f7fcf8;">
                                <table class="table" style="background-color:#f7fcf8;">
                                  <tr>
                                    <th><input type="text" style="width:100px"> ???</th>
                                  </tr>
                                  <tr>
                                    <th>upto</th>
                                  </tr>
                                  <tr>
                                    <th><input type="text"style="width:100px"> ???</th>
                                  </tr>
                                </table>
                                </th>
                              </tr>

<!-- Manufactured -->
                              <tr>
                                <th>
                                  <a class="btn btn-md" style="background-color:#f7fcf8; color:black; border-color:f7fcf8;btn-outline-color:f7fcf8;" data-toggle="collapse" href="#Manufactured" role="button" aria-expanded="false" aria-controls="collapseExample">Manufactured
                                  </a>
                                  <div class="collapse" id="Manufactured"style="background-color:#f7fcf8;">
                                    <div class="card card-body"style="background-color:#f7fcf8;">
                                      <table class="table" style="background-color:#f7fcf8;">
                                        <tr>
                                          <th><input type="text" style="width:100px"> yr</th>
                                        </tr>
                                        <tr>
                                          <th>upto</th>
                                        </tr>
                                        <tr>
                                          <th><input type="text"style="width:100px"> yr</th>
                                        </tr>
                                      </table>
                                      </th>
                                    </tr>

<!-- Brands -->
                                    <tr>
                                      <th>
                                        <a class="btn btn-md" style="background-color:#f7fcf8; color:black; border-color:f7fcf8;btn-outline-color:f7fcf8;" data-toggle="collapse" href="#Brand" role="button" aria-expanded="false" aria-controls="collapseExample">Brands
                                        </a>
                                        <div class="collapse" id="Brand"style="background-color:#f7fcf8;">
                                          <div class="card card-body"style="background-color:#f7fcf8;">
                                            <table class="table" style="background-color:#f7fcf8;">
                                              <tr>
                                                <th><input type="checkbox"> Maruti Suzuki </th>
                                              </tr>
                                              <tr>
                                                <th><input type="checkbox"> Hyundai </th>
                                              </tr>
                                              <tr>
                                                <th><input type="checkbox"> Mahindra </th>
                                              </tr>
                                              <tr>
                                                <th><input type="checkbox"> Tata Motors </th>
                                              </tr>
                                              <tr>
                                                <th><input type="checkbox"> Honda </th>
                                              </tr>
                                              <tr>
                                                <th><input type="checkbox"> Toyota </th>
                                              </tr>
                                              <tr>
                                                <th><input type="checkbox"> Renault </th>
                                              </tr>
                                              <tr>
                                                <th><input type="checkbox"> Volkswagen </th>
                                              </tr>
                                              <tr>
                                                <th><input type="checkbox"> Datsun </th>
                                              </tr>
                                              <tr>
                                                <th><input type="checkbox"> Skoda </th>
                                              </tr>
                                              <tr>
                                                <th><input type="checkbox"> Jeep </th>
                                              </tr>
                                              <tr>
                                                <th><input type="checkbox"> Nissan </th>
                                              </tr>
                                              <tr>
                                                <th><input type="checkbox"> Fiat </th>
                                              </tr>
                                              <tr>
                                                <th><input type="checkbox"> Hero </th>
                                              </tr>
                                              <tr>
                                                <th><input type="checkbox"> Yamaha </th>
                                              </tr>
                                              <tr>
                                                <th><input type="checkbox"> Royal Enfield </th>
                                              </tr>
                                              <tr>
                                                <th><input type="checkbox"> Suzuki </th>
                                              </tr>
                                              <tr>
                                                <th><input type="checkbox"> Piaggio </th>
                                              </tr>
                                              <tr>
                                                <th><input type="checkbox"> Mahindra </th>
                                              </tr>
                                              <tr>
                                                <th><input type="checkbox"> Bajaj </th>
                                              </tr>
                                              <tr>
                                                <th><input type="checkbox"> TVS </th>
                                              </tr>

                                            </table>
                                            </th>
                                          </tr>

                                          <tr>
                                            <th >
                                                <button type="button" class="btn btn-md btn-outline-success " style="width:150px; background-color:#29b252; color:white; text-align:center;">Apply</button>
                                            </th>
                                          </tr>
                  </table>

      </div>






        </div>
    <div class="col-xl">
      <div class="container">
          
<div class="col-md-4">
<a href="V_reg.html">Add Vehicle</a>

</div>


    </div>
</div>


<!-- <nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark">
  <ul class="navbar-nav">
    <li>
    </li>
  </ul>
</nav> -->

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>
