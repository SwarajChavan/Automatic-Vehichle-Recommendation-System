package controller.driver;

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

/**
 * Servlet implementation class DriverRentStat
 */
@WebServlet("/DriverRentStat")
public class DriverRentStat extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		String stat=request.getParameter("stat");
		String date=request.getParameter("date");
		Connection conn=DBConnection.getConnection();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(stat.equals("Accept")) {
			String customer="", driver="";
			
			try {
				PreparedStatement ps=conn.prepareStatement("select * from rentdriver where id=?");
				ps.setString(1, id);
				ResultSet rs=ps.executeQuery();
				if(rs.next()) {
					customer=rs.getString("customer");
					driver=rs.getString("driver");
				}
				ps=conn.prepareStatement("UPDATE `rentdriver` SET `status`=? WHERE id=?");
				ps.setString(1, stat);
				ps.setString(2, id);
				ps.executeUpdate();
				ps=conn.prepareStatement("UPDATE `rentdriver` SET `status`='Reject' WHERE driver=? AND date=? AND id<>?");
				ps.setString(1, driver);
				ps.setString(2, date);
				ps.setString(3, id);
				ps.executeUpdate();
				ps=conn.prepareStatement("INSERT INTO `driverschedule`(`customer`, `driver`, `date`) VALUES (?,?,?)");
				ps.setString(1, customer);
				ps.setString(2, driver);
				ps.setString(3, date);
				ps.executeUpdate();
				rs.close();
				ps.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			PreparedStatement ps;
			try {
				ps = conn.prepareStatement("UPDATE `rentdriver` SET `status`=? WHERE id=?");
				ps.setString(1, stat);
				ps.setString(2, id);
				ps.executeUpdate();
			//s=	rs.close();
				ps.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		out.println("<script type='text/javascript'>");
		out.println("alert('You have "+stat+"ed the request for "+date+"')");
		out.println("window.location = 'driver-index'");
		out.println("</script>");
		response.sendRedirect("driver-index");
	}

}
