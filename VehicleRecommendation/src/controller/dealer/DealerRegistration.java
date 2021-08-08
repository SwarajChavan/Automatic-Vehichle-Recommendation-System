package controller.dealer;

import java.io.IOException;
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
 * Servlet implementation class DealerRegistration
 */
@WebServlet("/DealerRegistration")
public class DealerRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn=DBConnection.getConnection();
		String office=request.getParameter("office");
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String dob=request.getParameter("dob");
		String aadhar=request.getParameter("aadhar");
		String gender=request.getParameter("gender");
		String contact=request.getParameter("contact");
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		if(office==null) {
			office="-";
		}
		
		try {
			PreparedStatement ps=conn.prepareStatement("INSERT INTO "
					+ "`dealer`(`firstname`, `lastname`, `dob`, `aadharno`, `gender`, `contactno`, `email`, `password`, `office`) "
					+ "VALUES (?,?,?,?,?,?,?,?,?)");
			ps.setString(1, fname);
			ps.setString(2, lname);
			ps.setString(3, dob);
			ps.setString(4, aadhar);
			ps.setString(5, gender);
			ps.setString(6, contact);
			ps.setString(7, email);
			ps.setString(8, pass);
			ps.setString(9, office);
			ps.executeUpdate();
			
			
			response.sendRedirect("Signup_D.html");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
