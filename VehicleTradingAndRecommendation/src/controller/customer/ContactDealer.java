package controller.customer;

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
import javax.servlet.http.HttpSession;

import utility.DBConnection;

/**
 * Servlet implementation class ContactDealer
 */
@WebServlet("/ContactDealer")
public class ContactDealer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		HttpSession session=request.getSession();
		String name=(String) session.getAttribute("name");
		String email=(String) session.getAttribute("email");
		String purpose=request.getParameter("purpose");
		String dealer="";

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		Connection conn=DBConnection.getConnection();

		try {
			PreparedStatement ps1=conn.prepareStatement("SELECT dealer FROM `vehicle` WHERE id=?");
			ps1.setString(1, id);
			ResultSet rs1=ps1.executeQuery();
			if(rs1.next()) {
				dealer=rs1.getString(1);
			}
			if(purpose.equals("Sell")) {
				PreparedStatement ps=conn.prepareStatement("SELECT * FROM `contactdealer` WHERE car=? and user=?");
				ps.setString(1, id);
				ps.setString(2, email);
				ResultSet rs= ps.executeQuery();
				if(rs.next()) {
					out.println("<script type='text/javascript'>");
					out.println("alert('You have already contacted the dealer!!!')");
					out.println("window.location = 'customer-vehicledetails?id="+id+"'");
					out.println("</script>");
				}else {
					ps=conn.prepareStatement("INSERT INTO `contactdealer`(`user`, `dealer`, `car`) VALUES (?,?,?)");
					ps.setString(1, email);
					ps.setString(2, dealer);
					ps.setString(3, id);
					ps.executeUpdate();
					out.println("<script type='text/javascript'>");
					out.println("alert('Message send to dealer!!!')");
					out.println("window.location = 'customer-vehicledetails?id="+id+"'");
					out.println("</script>");
				}
				rs.close();
				ps.close();

			}else {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				boolean stat=false;
				String date=request.getParameter("sdate");
				String edate=request.getParameter("edate");
				Date startdate = sdf.parse(date);
				Date enddate = sdf.parse(edate);
				PreparedStatement stmt=conn.prepareStatement("SELECT * FROM `rentvehicle` WHERE car=? AND status='Rented'");
				stmt.setString(1, id);
				ResultSet rs= stmt.executeQuery();
				while(rs.next()) {
					Date psdate=sdf.parse(rs.getString("date"));
					Date pedate=sdf.parse(rs.getString("edate"));
					if((startdate.compareTo(psdate)>=0 && startdate.compareTo(pedate)<=0) || (enddate.compareTo(psdate)>=0 && enddate.compareTo(pedate)<=0)) {
						System.out.println(startdate.compareTo(psdate)+" "+startdate.compareTo(pedate)+ " "+enddate.compareTo(psdate)+" "+enddate.compareTo(pedate));
						stat=true;
						break;
					}
				}
				System.out.println(stat);
				if(stat) {
					out.println("<script type='text/javascript'>");
					out.println("alert('Oops!, This Vehicle is already rented on the selected date. Please Try for another date.')");
					out.println("window.location = 'customer-vehicledetails?id="+id+"'");
					out.println("</script>");
				}else {

					PreparedStatement ps=conn.prepareStatement("INSERT INTO `rentvehicle`(`user`, `dealer`, `car`, `date`, `edate`) "
							+ "VALUES (?,?,?,?,?)");
					ps.setString(1, email);
					ps.setString(2, dealer);
					ps.setString(3, id);
					ps.setString(4, date);
					ps.setString(5, edate);
					ps.executeUpdate();
					ps=conn.prepareStatement("INSERT INTO `rentdataset`(`user`, `vehicle`) VALUES (?,?)");
					ps.setString(1, email);
					ps.setString(2, id);
					ps.executeUpdate();

					out.println("<script type='text/javascript'>");
					out.println("alert('Message send to dealer!!!')");
					out.println("window.location = 'customer-vehicledetails?id="+id+"'");
					out.println("</script>");
					ps.close();

				}
			}
			rs1.close();
			ps1.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
