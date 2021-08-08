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
							<div id="colorlib-logo"><a href="driver-index">Home</a></div>
						</div>
						<div class="col-xs-10 text-right menu-1">
							<ul>
								<li class="active"><a href="driver-index">View Messages</a></li>
								<li class=""><a href="driver-schedule">View Schedule</a></li>
<!-- 								<li><a href="about.html">About</a></li>
								<li><a href="contact.html">Contact</a></li> -->
								<li class="has-dropdown">
									<a href="#">Welcome,<%=name %> </a>
									<ul class="dropdown">
										<li><a href="dealer-updateprofile">Update Profile</a></li>
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