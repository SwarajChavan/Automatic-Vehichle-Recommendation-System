<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String name=(String) session.getAttribute("name");
String email=(String) session.getAttribute("email");
%>
		<nav class="colorlib-nav" role="navigation">
			<div class="top-menu">
				<div class="container">
					<div class="row">
						<div class="col-xs-2">
							<div id="colorlib-logo"><a href="garage-index">Home</a></div>
						</div>
						<div class="col-xs-10 text-right menu-1">
							<ul>
							<!-- 	<li class="active"><a href="garage-index">Home</a></li> -->
								<li class="has-dropdown">
									<a href="garage-viewcars">Cars</a>
								</li>
								<li class="has-dropdown">
									<a href="garage-viewbikes">Bikes</a>
								</li>
								<li><a href="about.html">About</a></li>
								<li><a href="contact.html">Contact</a></li>
								<li>
            <form class="form-inline" style="display: inline-block;" action="GarageSearch" method="post">
            <input class="form-control" type="search" placeholder="Search" name="search" aria-label="Search" style="width:250px; outline-style: auto;" >
            <button type="submit" class="btn btn-outline-success"><i class="fas fa-search"></i></button>
            </form>
          </li>
								<li class="has-dropdown">
									<a href="#">Welcome,<%=name %> </a>
									<ul class="dropdown">
										<li><a href="garage-updateprofile">Update Profile</a></li>
										<li><a href="Logout">Logout</a></li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</nav>
</body>
</html>