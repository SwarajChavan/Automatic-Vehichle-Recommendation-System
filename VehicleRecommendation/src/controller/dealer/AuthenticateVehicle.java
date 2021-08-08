package controller.dealer;

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
import javax.servlet.http.HttpSession;

import utility.DBConnection;

/**
 * Servlet implementation class AuthenticateVehicle
 */
@WebServlet("/AuthenticateVehicle")
public class AuthenticateVehicle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn=DBConnection.getConnection();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session=request.getSession();
		
		String regno=request.getParameter("regno");
		
		try {
			PreparedStatement ps=conn.prepareStatement("SELECT * FROM `stolen_vehicles` WHERE registrationno=?");
			ps.setString(1, regno);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				out.println("<script type='text/javascript'>");
				out.println("alert('This vehicle is stolen. You cannot Register it!!!')");
				out.println("window.location = 'V_reg.html'");
				out.println("</script>");
			}else {
				session.setAttribute("regno", regno);
				out.println("<script type='text/javascript'>");
				out.println("window.location = 'AddVehicle.jsp'");
				out.println("</script>");
			}
			out.close();
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}			
	}

}
