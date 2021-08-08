package controller.garage;

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
 * Servlet implementation class GarageUpdateProfile
 */
@WebServlet("/GarageUpdateProfile")
public class GarageUpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn=DBConnection.getConnection();
		String garage=request.getParameter("garage");
		String owner=request.getParameter("owner");
		String location=request.getParameter("location");
		String address=request.getParameter("address");
		String contact=request.getParameter("contact");
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		
		try {
			PreparedStatement ps=conn.prepareStatement("UPDATE `garage` SET `garage`=?,`owner`=?,`location`=?,`address`=?,"
					+ "`contactno`=?,`password`=? WHERE `email`=?");
			ps.setString(1, garage);
			ps.setString(2, owner);
			ps.setString(3, location);
			ps.setString(4, address);
			ps.setString(5, contact);
			ps.setString(7, pass);
			ps.setString(6, email);
			ps.executeUpdate();
			out.println("<script type='text/javascript'>");
			out.println("alert('Garage Information Updated Successfully')");
			out.println("window.location = 'garage-updateprofile'");
			out.println("</script>");
			//rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	
	}

}
