package controller.customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utility.DBConnection;

/**
 * Servlet implementation class CustomerUpdateProfile
 */
@WebServlet("/CustomerUpdateProfile")
public class CustomerUpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn=DBConnection.getConnection();
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String dob=request.getParameter("dob");
		String address=request.getParameter("address");
		String gender=request.getParameter("gender");
		String contact=request.getParameter("contact");
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		try {
			PreparedStatement ps=conn.prepareStatement("UPDATE `customer` SET `firstname`=?,`lastname`=?,`dob`=?,`address`=?,`gender`=?,"
					+ "`contactno`=?,`password`=? WHERE `email`=?");
			ps.setString(1, fname);
			ps.setString(2, lname);
			ps.setString(3, dob);
			ps.setString(4, address);
			ps.setString(5, gender);
			ps.setString(6, contact);
			ps.setString(7, pass);
			ps.setString(8, email);
			ps.executeUpdate();
			
			out.println("<script type='text/javascript'>");
			out.println("alert('Customer Information Updated Successfully')");
			out.println("window.location = 'customer-updateprofile'");
			out.println("</script>");
		//	rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
