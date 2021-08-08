<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="utility.DBConnection"%>
<%@page import="java.sql.Connection"%>
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

	String condition="WHERE inspection='In Process' ";
	String vehicle = request.getParameter("vehicle");
	condition=condition +"AND type='"+vehicle+"' ";
String pfrom = request.getParameter("pfrom");
if(pfrom!=null && pfrom!=""){
	condition=condition +"AND price>="+pfrom+" ";
}
String pto = request.getParameter("pto");
if(pto!=null && pto!=""){
	condition=condition +"AND price<="+pto+" ";
}
String mfrom = request.getParameter("mfrom");
if(mfrom!=null && mfrom!=""){
	condition=condition +"AND milage>="+mfrom+" ";
}
String mto = request.getParameter("mto");
if(mto!=null && mto!=""){
	condition=condition +"AND milage<="+mto+" ";
}
String yfrom = request.getParameter("yfrom");
if(yfrom!=null && yfrom!=""){
	condition=condition +"AND myear>="+yfrom+" ";
}
String yto = request.getParameter("yto");
if(yto!=null && yto!=""){
	condition=condition +"AND myear<="+yto+" ";
}
String kms = request.getParameter("kms");
if(kms!=null && kms!=""){
	condition=condition +"AND myear<="+kms+" ";
}

String[] cartype=request.getParameter("cartype").split(",");
String type="",brand="",fuel="";
if(cartype!=null && cartype[0]!=""){
	type="vehicletype IN (";
	for (int i = 0; i < cartype.length; i++) {
		if(i==0){
			type=type+"'"+cartype[i].trim()+"'";
		}else{
			type=type+",'"+cartype[i].trim()+"'";
		}
	}
	type=type+")";
	condition=condition+"AND "+type+" ";
}

String[] carbrand=request.getParameter("carbrand").split(",");
if(carbrand!=null && carbrand[0]!=""){
	brand="brand IN (";
	for (int i = 0; i < carbrand.length; i++) {
		if(i==0){
			brand=brand+"'"+carbrand[i].trim()+"'";
		}else{
			brand=brand+",'"+carbrand[i].trim()+"'";
		}
	}
	brand=brand+")";
	condition=condition+"AND "+brand+" ";
}

String[] carfuel=request.getParameter("carfuel").split(",");
if(carfuel!=null && carfuel[0]!=""){
	fuel="fuel IN (";
	for (int i = 0; i < carfuel.length; i++) {
		if(i==0){
			fuel=fuel+"'"+carfuel[i].trim()+"'";
		}else{
			fuel=fuel+",'"+carfuel[i].trim()+"'";
		}
	}
	fuel=fuel+")";
	condition=condition+"AND "+fuel+" ";
}



String sql="select * from vehicle "+condition;
System.out.println(sql);
Connection conn=DBConnection.getConnection();
PreparedStatement ps=conn.prepareStatement(sql);
ResultSet rs=ps.executeQuery();
while(rs.next()){
%>

				<div class="col-md-4 text-center">
						<div class="product-entry">
							<div class="product-img" style="background-image: url(GetImages?id=<%=rs.getString("id")%>);">
								<p class="tag"><span class="new"><%=rs.getString("purpose") %></span></p>
								<div class="cart">
									<p>
										<span><a href="garage-vehicledetails?id=<%=rs.getString("id")%>"><i class="icon-eye"></i></a></span>
										
									</p>
								</div>
							</div>
							<div class="desc">
								<h3><a href="garage-vehicledetails?id=<%=rs.getString("id")%>"><%=rs.getString("model") %></a></h3>
								<p class="price"><span>&#8377; <%=rs.getString("price") %></span></p>
							</div>
						</div>
					</div>

<%}
rs.close();
ps.close();
conn.close();	
%>


</body>
</html>