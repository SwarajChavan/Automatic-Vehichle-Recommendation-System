package controller.dealer;

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
 * Servlet implementation class AddVehicle
 */
@WebServlet("/AddVehicle")
public class AddVehicle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String regno=request.getParameter("regno");
		String brand=request.getParameter("brand");
		String type=request.getParameter("type");
		String model=request.getParameter("model");
		String year=request.getParameter("year");
		String price=request.getParameter("price");
		String Ft=request.getParameter("Ft");
		String used=request.getParameter("used");
		String Prp=request.getParameter("Prp");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		Connection conn=DBConnection.getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement("INSERT INTO "
					+ "`vehicle`(`regno`, `brand`, `type`, `model`, `year`, `price`, `fuel`, `used`, `purpose`) "
					+ "VALUES (?,?,?,?,?,?,?,?,?)");
			ps.setString(1, regno);
			ps.setString(2, brand);
			ps.setString(3, type);
			ps.setString(4, model);
			ps.setString(5, year);
			ps.setString(6, price);
			ps.setString(7, Ft);
			ps.setString(8, used);
			ps.setString(9, Prp);
			ps.executeUpdate();
			
			
			out.println("<script type='text/javascript'>");
			out.println("alert('Vehicle Added Successfully!!!')");
			out.println("window.location = 'V_reg.html'");
			out.println("</script>");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		
	}

}
