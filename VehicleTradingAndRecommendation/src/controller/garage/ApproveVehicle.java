package controller.garage;

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
 * Servlet implementation class ApproveVehicle
 */
@WebServlet("/ApproveVehicle")
public class ApproveVehicle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		String type=request.getParameter("type");
		String stat=request.getParameter("stat");
		Connection conn=DBConnection.getConnection();

		try {
			PreparedStatement ps=conn.prepareStatement("UPDATE `vehicle` SET `inspection`=? WHERE `id`=?");
			ps.setString(1, stat);
			ps.setString(2, id);
			ps.executeUpdate();
			ps.close();
			conn.close();
			if(type.equals("Car")) {
				response.sendRedirect("garage-viewcars");
			}else {
				response.sendRedirect("garage-viewbikes");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
