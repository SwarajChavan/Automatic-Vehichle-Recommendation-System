package controller.garage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utility.DBConnection;
import utility.SendMail;

/**
 * Servlet implementation class DealerRegistration
 */
@WebServlet("/GarageRegistration")
public class GarageRegistration extends HttpServlet {
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
			PreparedStatement ps=conn.prepareStatement("SELECT * FROM `customer` WHERE email=?");
			ps.setString(1, email);
			ResultSet rs= ps.executeQuery();
			if(rs.next()) {
				out.println("<script type='text/javascript'>");
				out.println("alert('Dealer Already registered using the email. Please try again.')");
				out.println("window.location = 'garage-registration'");
				out.println("</script>");
			}else {
				ps=conn.prepareStatement("INSERT INTO `garage`"
						+ "(`garage`, `owner`, `location`, `address`, `contactno`, `email`, `password`) VALUES (?,?,?,?,?,?,?)");
				ps.setString(1, garage);
				ps.setString(2, owner);
				ps.setString(3, location);
				ps.setString(4, address);
				ps.setString(5, contact);
				ps.setString(6, email);
				ps.setString(7, pass);
				ps.executeUpdate();
				String sub="Successful Registration";
				String msg="Hi,"
						+ "<br>"
						+ "You have successfully registered as a garage into our website. "
						+ "<br>"
						+ "The username and password for login is "+email+" and "+pass+"."
								+ "<br><br>"
								+ "Note: Do not share these credentials with anyone";
				SendMail.send(email, sub, msg);
				out.println("<script type='text/javascript'>");
				out.println("alert('Registration Successful')");
				out.println("window.location = 'garage-login'");
				out.println("</script>");
			}
			rs.close();
			ps.close();
			conn.close();
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
