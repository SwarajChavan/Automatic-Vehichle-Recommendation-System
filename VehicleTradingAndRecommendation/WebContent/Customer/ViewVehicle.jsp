<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="utility.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>
	<head>
	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="0" />
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
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
	</head>
	<body>
		
	<div class="colorlib-loader"></div>

	<div id="page">
	<jsp:include page="/customer-header"></jsp:include>
	<%
String name=(String) session.getAttribute("name");
String email=(String) session.getAttribute("email");
Connection conn=DBConnection.getConnection();
String stat =request.getParameter("stat");
%>
	<input type="hidden" value="<%=stat%>" id="purpose">
	<input type="hidden" value="Car" id="vehicle">
		
		
		<div class="colorlib-shop">
			<div class="container">
				<div class="row">
					<div class="col-md-9 col-md-push-3">
						<div class="row row-pb-lg" style="overflow-y: auto; display: block; max-height: 600px;">
						<div id="output">
						<%
						PreparedStatement ps=conn.prepareStatement("select * from vehicle where purpose=? and type='Car' AND inspection in ('Verified', 'Not Verified')");
						ps.setString(1, stat);
						ResultSet rs=ps.executeQuery();
						while(rs.next()){
						
						%>
							<div class="col-md-4 text-center">
						<div class="product-entry">
							<div class="product-img" style="background-image: url(GetImages?id=<%=rs.getString("id")%>);">
								<p class="tag"><span class="new"><%=rs.getString("purpose") %> <%=rs.getString("inspection") %></span></p>
								<div class="cart">
									<p>
										<span><a href="customer-vehicledetails?id=<%=rs.getString("id")%>"><i class="icon-eye"></i></a></span>
										
									</p>
								</div>
							</div>
							<div class="desc">
								<h3><a href="customer-vehicledetails?id=<%=rs.getString("id")%>"><%=rs.getString("model") %></a></h3>
								<p class="price"><span>&#8377; <%=rs.getString("price") %></span></p>
							</div>
						</div>
					</div>
							<% }
						rs.close();
						ps.close();
						conn.close();
							%>
							
							</div>
						</div>

					</div>
					<div class="col-md-3 col-md-pull-9">
						<div class="sidebar" style="overflow-y: auto;display: block;max-height: 600px;">
							<div class="side">
							<input type="button" onclick="SortVehicle()" value="FILTER" style="width: -webkit-fill-available; color: black; font-family: -webkit-body; font-size: larger;"> 
								<div class="fancy-collapse-panel">
			                  <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
			                     <div class="panel panel-default">
			                         <div class="panel-heading" role="tab" id="headingOne">
			                             <h4 class="panel-title">
			                                 <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Type
			                                 </a>
			                             </h4>
			                         </div>
			                         <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
			                             <div class="panel-body">
			                                 <ul>
			                                 	<li><input type="checkbox" name="type" id="Coupe" class="type" value="Coupe"><label for="Coupe">Coupe</label> </li>
			                                 	<li><input type="checkbox" name="type" id="SUV" class="type" value="SUV"><label for="SUV">SUV</label></li>
			                                 	<li><input type="checkbox" name="type" id="MPV" class="type" value="MPV"><label for="MPV">MPV</label></li>
			                                 	<li><input type="checkbox" name="type" id="Sedan" class="type" value="Sedan"><label for="Sedan">Sedan</label> </li>
			                                 	<li><input type="checkbox" name="type" id="Convertible" class="type" value="Convertible"><label for="Convertible">Convertible</label></li>
			                                 	<li><input type="checkbox" name="type" id="Crossover" class="type" value="Crossover"><label for="Crossover">Crossover</label></li>
			                                 </ul>
			                             </div>
			                         </div>
			                     </div>
			                     <div class="panel panel-default">
			                         <div class="panel-heading" role="tab" id="headingTwo">
			                             <h4 class="panel-title">
			                                 <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">Brand
			                                 </a>
			                             </h4>
			                         </div>
			                         <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
			                             <div class="panel-body">
			                                <ul>
			                                 	<li><input type="checkbox" name="brand" id="Fiat" class="brand" value="Fiat"><label for="Fiat">Fiat</label> </li>
			                                 	<li><input type="checkbox" name="brand" id="Volkswagen" class="brand" value="Volkswagen"><label for="Volkswagen">Volkswagen</label></li>
			                                 	<li><input type="checkbox" name="brand" id="Nissan" class="brand" value="Nissan"><label for="Nissan">Nissan</label></li>
			                                 	<li><input type="checkbox" name="brand" id="Toyota" class="brand" value="Toyota"><label for="Toyota">Toyota</label> </li>
			                                 	<li><input type="checkbox" name="brand" id="Hyundai" class="brand" value="Hyundai"><label for="Hyundai">Hyundai</label></li>
			                                 	<li><input type="checkbox" name="brand" id="Audi" class="brand" value="Audi"><label for="Audi">Audi</label></li>
			                                 	<li><input type="checkbox" name="brand" id="BMW" class="brand" value="BMW"><label for="BMW">BMW</label></li>
			                                 	<li><input type="checkbox" name="brand" id="Honda" class="brand" value="Honda"><label for="Honda">Honda</label> </li>
			                                 	<li><input type="checkbox" name="brand" id="Skoda" class="brand" value="Skoda"><label for="Skoda">Skoda</label></li>
			                                 	<li><input type="checkbox" name="brand" id="Jeep" class="brand" value="Jeep"><label for="Jeep">Jeep</label></li>
			                                 </ul>
			                             </div>
			                         </div>
			                     </div>
			                     <div class="panel panel-default">
			                         <div class="panel-heading" role="tab" id="headingThree">
			                             <h4 class="panel-title">
			                                 <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">Fuel
			                                 </a>
			                             </h4>
			                         </div>
			                         <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
			                             <div class="panel-body">
			                                <ul>
			                                 	<li><input type="checkbox" name="fuel" id="Petrol" class="fuel" value="Petrol"><label for="Petrol">Petrol</label> </li>
			                                 	<li><input type="checkbox" name="fuel" id="Diesel" class="fuel" value="Diesel"><label for="Diesel">Diesel</label></li>
			                                 	<li><input type="checkbox" name="fuel" id="CNG" class="fuel" value="CNG"><label for="CNG">CNG</label></li>
			                                 </ul>
			                             </div>
			                         </div>
			                     </div>
			                   
			                  </div>
			               </div>
							</div>
							<div class="side">
								<h2>Price Range</h2>
								<form method="post" class="colorlib-form-2">
				              	<div class="row">
				                <div class="col-md-12">
				                  <div class="form-group">
				                    <label for="guests">Price from:</label>
				                    <div class="form-field">
				                      <input type="text" class="form-control" id="pfrom">
				                    </div>
				                  </div>
				                </div>
				                <div class="col-md-12">
				                  <div class="form-group">
				                    <label for="guests">Price to:</label>
				                    <div class="form-field">
				                      <input type="text" class="form-control" id="pto">
				                    </div>
				                  </div>
				                </div>
				              </div>
				            </form>
							</div>
							<div class="side">
								<h2>Mileage</h2>
								<form method="post" class="colorlib-form-2">
				              	<div class="row">
				                <div class="col-md-12">
				                  <div class="form-group">
				                    <label for="guests">From:(in km/l)</label>
				                    <div class="form-field">
				                      <input type="text" class="form-control" id="mfrom">
				                    </div>
				                  </div>
				                </div>
				                <div class="col-md-12">
				                  <div class="form-group">
				                    <label for="guests">to:(in km/l)</label>
				                    <div class="form-field">
				                      <input type="text" class="form-control" id="mto">
				                    </div>
				                  </div>
				                </div>
				              </div>
				            </form>
							</div>
							<div class="side">
								<h2>KMS Driven</h2>
								<form method="post" class="colorlib-form-2">
				              	<div class="row">
				                <div class="col-md-12">
				                  <div class="form-group">
				                    <label for="guests">Maximum kms</label>
				                    <div class="form-field">
				                      <input type="text" class="form-control" id="kms">
				                    </div>
				                  </div>
				                </div>
				              </div>
				            </form>
							</div>
							<div class="side">
								<h2>Manufacturing Years</h2>
								<form method="post" class="colorlib-form-2">
				              	<div class="row">
				                <div class="col-md-12">
				                  <div class="form-group">
				                    <label for="guests">From:</label>
				                    <div class="form-field">
				                      <input type="text" class="form-control" id="yfrom">
				                    </div>
				                  </div>
				                </div>
				                <div class="col-md-12">
				                  <div class="form-group">
				                    <label for="guests">to:</label>
				                    <div class="form-field">
				                      <input type="text" class="form-control" id="yto">
				                    </div>
				                  </div>
				                </div>
				              </div>
				              <input type="button" value="FILTER" onclick="SortVehicle()" style="width: -webkit-fill-available; color: black; font-family: -webkit-body; font-size: larger;">
				            </form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		
	<jsp:include page="/customer-footer"></jsp:include>

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
		function SortVehicle() {
			var type = [];
		    $.each($("input[name='type']:checked"), function(){  
		    	type.push($(this).val());
		    });
		    var cartype=type.join(", ");
		    
		    var brand = [];
		    $.each($("input[name='brand']:checked"), function(){  
		    	brand.push($(this).val());
		    });
		    var carbrand=brand.join(", ");
		    
		    var fuel = [];
		    $.each($("input[name='fuel']:checked"), function(){  
		    	fuel.push($(this).val());
		    });
		    var carfuel=fuel.join(", ");
		    var pfrom = document.getElementById("pfrom").value;
		    var pto = document.getElementById("pto").value;
		    var mfrom = document.getElementById("mfrom").value;
		    var mto = document.getElementById("mto").value;
		    var kms = document.getElementById("kms").value;
		    var yfrom = document.getElementById("yfrom").value;
		    var yto = document.getElementById("yto").value;
		    var purpose = document.getElementById("purpose").value;
		    var vehicle = document.getElementById("vehicle").value;
			if (vehicle.trim() != ""){
				$.ajax({
					type : 'post',
					url : 'CustomerSortVehicles.jsp',
					data : {
						cartype : cartype,
						carbrand : carbrand,
						carfuel : carfuel,
						pfrom : pfrom,
						pto : pto,
						mfrom : mfrom,
						mto : mto,
						kms : kms,
						yfrom : yfrom,
						yto : yto,
						purpose : purpose,
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
	</body>
</html>

