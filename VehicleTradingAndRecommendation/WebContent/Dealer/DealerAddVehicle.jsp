<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Store Template</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="author" content="" />

  <!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="css/magnific-popup.css">

	<!-- Flexslider  -->
	<link rel="stylesheet" href="css/flexslider.css">

	<!-- Owl Carousel -->
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	
	<!-- Date Picker -->
	<link rel="stylesheet" href="css/bootstrap-datepicker.css">
	<!-- Flaticons  -->
	<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="css/style.css">

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>
		
	<div class="colorlib-loader"></div>

	<div id="page">
		<jsp:include page="/dealer-header"></jsp:include>
		<!-- <aside id="colorlib-hero" class="breadcrumbs">
			<div class="flexslider">
				<ul class="slides">
			   	<li style="background-image: url(images/cover-img-1.jpg);">
			   		<div class="overlay"></div>
			   		<div class="container-fluid">
			   			<div class="row">
				   			<div class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12 slider-text">
				   				<div class="slider-text-inner text-center">
				   					<h1>Contact</h1>
				   					<h2 class="bread"><span><a href="index.html">Home</a></span> <span>Contact</span></h2>
				   				</div>
				   			</div>
				   		</div>
			   		</div>
			   	</li>
			  	</ul>
		  	</div>
		</aside> -->

		<div id="colorlib-contact">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<h3>Add Vehicles</h3>
					</div>
					<div class="col-md-10 col-md-offset-1">
						<div class="contact-wrap">
							<form action="AddVehicle" method="post" enctype= "multipart/form-data">
								<div class="row form-group">
									<div class="col-md-12 padding-bottom">
										<label for="offname">Enter Vehicle Registration No.</label>
										<input type="text" id="vehicle" name="vehicle" class="form-control" placeholder="Vehicle Registration No." >
									</div>
								</div>
								<div id="output">
								<div class="form-group text-center" >
									<button type="button" onclick="Authenticate()" value="" class="btn btn-primary">Authenticate</button>
								</div></div>
							</form>		
						</div>
					</div>
				</div>
			</div>
		</div>


		<jsp:include page="/dealer-footer"></jsp:include>
	</div>


	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
	</div>
	
	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="js/jquery.flexslider-min.js"></script>
	<!-- Owl carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	<!-- Date Picker -->
	<script src="js/bootstrap-datepicker.js"></script>
	<!-- Stellar Parallax -->
	<script src="js/jquery.stellar.min.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>
	<script type="text/javascript">
		function Authenticate() {
			var vehicle = document.getElementById("vehicle").value;
			if (vehicle.trim() != ""){
				$.ajax({
					type : 'post',
					url : 'AuthenticateVehicle.jsp',
					data : {
						vehicle : vehicle
					},
					success : function(response) {
						//alert("success");
						$("#output").html(response);
					}
				});
			}else{
				
			}
		}
	</script>
	 <script type="text/javascript">
	   function getType(type){
		  
		    if(type.trim() == "" || type.trim() == " "){
		    	 alert("Please select the vehicle type");
		    	 $("#brand").html("<option value=''>Select Brand</option>");
		    	 $("#vehicletype").html("<option value=''>Select Vehicle Type</option>");
		    }
		    else if(type.trim() == "car"){
		    	$("#brand").html("<option value=''>Select Brand</option>"+		    			
		    			"<option value='Fiat'>Fiat</option>"+
		    			"<option value='Volkswagen'>Volkswagen</option>"+
		    			"<option value='Nissan'>Nissan</option>"+
		    			"<option value='Toyota'>Toyota</option>"+
		    			"<option value='Hyundai'>Hyundai</option>"+
		    			"<option value='Audi'>Audi</option>"+
		    			"<option value='BMW'>BMW</option>"+
		    			"<option value='Honda'>Honda</option>"+
		    			"<option value='Skoda'>Skoda</option>"+
		    			"<option value='Jeep'>Jeep</option>");
		    	$("#vehicletype").html("<option value=''>Select Vehicle type</option>"+		    			
		    			"<option value='Coupe'>Coupe</option>"+
		    			"<option value='SUV'>SUV</option>"+
		    			"<option value='MPV'>MPV</option>"+
		    			"<option value='Sedan'>Sedan</option>"+
		    			"<option value='Convertible'>Convertible</option>"+
		    			"<option value='Crossover'>Crossover</option>");
		    }
		    else if(type.trim() == "bike"){
		    	$("#brand").html("<option value=''>Select Brand</option>"+		    			
		    			"<option value='Harley-Davidson'>Harley-Davidson</option>"+
		    			"<option value='BMW'>BMW</option>"+
		    			"<option value='Kawasaki'>Kawasaki</option>"+
		    			"<option value='Honda'>Honda</option>"+
		    			"<option value='Yamaha'>Yamaha</option>"+
		    			"<option value='Suzuki'>Suzuki</option>");
		    	$("#vehicletype").html("<option value=''>Select Vehicle type</option>"+		    			
		    			"<option value='Scooter'>Scooter</option>"+
		    			"<option value='Bike'>Bike</option>");
		    }
		    }
	   </script>

	</body>
</html>

