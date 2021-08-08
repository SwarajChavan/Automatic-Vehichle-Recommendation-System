package controller.dealer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utility.DBConnection;

/**
 * Servlet implementation class RentVehicle
 */
@WebServlet("/RentVehicle")
public class RentVehicle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		String stat=request.getParameter("stat");
		
		String date=request.getParameter("date");
		String edate=request.getParameter("edate");
		Connection conn=DBConnection.getConnection();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(stat.equals("Rented")) {
			try {
				String customer="", driver="";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date startdate = sdf.parse(date);
				Date enddate = sdf.parse(edate);
				PreparedStatement ps=conn.prepareStatement("UPDATE `rentvehicle` SET `status`=? WHERE id=?");
				ps.setString(1, stat);
				ps.setString(2, id);
				int x=ps.executeUpdate();
				System.out.println("UPDATE `rentvehicle` SET `status`="+stat+" WHERE id="+id);
				PreparedStatement ps1=conn.prepareStatement("SELECT * FROM `rentvehicle` WHERE car=(select car from rentvehicle vehicle where id=?) AND status='In Process'");
				ps1.setString(1, id);
				ResultSet rs1=ps1.executeQuery();
				while(rs1.next()) {
					Date psdate=sdf.parse(rs1.getString("date"));
					Date pedate=sdf.parse(rs1.getString("edate"));
					if((psdate.compareTo(startdate)>=0 && psdate.compareTo(enddate)<=0) || (pedate.compareTo(startdate)>=0 && pedate.compareTo(enddate)<=0)) {
						ps=conn.prepareStatement("UPDATE `rentvehicle` SET `status`='Cancelled' WHERE id=?");
						ps.setString(1, rs1.getString("id"));
						ps.executeUpdate();
								
					}
				}
		
				//	rs.close();
				ps.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}



		}else {
			try {

				PreparedStatement ps=conn.prepareStatement("UPDATE `rentvehicle` SET `status`=? WHERE id=?");
				ps.setString(1, stat);
				ps.setString(2, id);
				ps.executeUpdate();
				//	rs.close();
				ps.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		out.println("<script type='text/javascript'>");
		out.println("alert('The vehicle was successfully rented to the customer')");
		out.println("window.location = 'dealer-checkmessages'");
		out.println("</script>");
	}

}
