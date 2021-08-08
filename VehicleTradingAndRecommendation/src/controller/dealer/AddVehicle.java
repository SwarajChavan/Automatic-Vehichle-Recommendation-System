package controller.dealer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import utility.DBConnection;

/**
 * Servlet implementation class AddVehicle
 */
@WebServlet("/AddVehicle")
@MultipartConfig
public class AddVehicle extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String email=(String) session.getAttribute("email");
		
		String vehicle=request.getParameter("vehicle");
		String type=request.getParameter("type");
		String brand=request.getParameter("brand");
		String vehicletype=request.getParameter("vehicletype");
		String model=request.getParameter("model");
		String myear=request.getParameter("myear");
		String used=request.getParameter("used");
		String kms=request.getParameter("kms");
		String milage=request.getParameter("milage");
		String price=request.getParameter("price");
		String fuel=request.getParameter("fuel");
		String purpose=request.getParameter("purpose");
		Part image=request.getPart("image");
		String insp=request.getParameter("insp");
		
		Connection conn=DBConnection.getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement("INSERT INTO `vehicle`"
					+ "(`regno`, `brand`, `type`, `model`, `yearsused`, `kmsdriven`, `milage`, `myear`,vehicletype, `price`, "
					+ "`fuel`, `purpose`, `image`, `dealer`, `inspection`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, vehicle);
			ps.setString(2, brand);
			ps.setString(3, type);
			ps.setString(4, model);
			ps.setString(5, used);
			ps.setString(6, kms);
			ps.setString(7, milage);
			ps.setString(8, myear);
			ps.setString(9, vehicletype);
			ps.setString(10, price);
			ps.setString(11, fuel);
			ps.setString(12, purpose);
			ps.setBinaryStream(13, image.getInputStream());
			ps.setString(14, email);
			ps.setString(15, insp);
			ps.executeUpdate();
			response.sendRedirect("dealer-addvehicle");
		//	rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
