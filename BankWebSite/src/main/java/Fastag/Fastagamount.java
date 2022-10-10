package Fastag;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Register.Validation;


@WebServlet("/Index/Fastagamount")
public class Fastagamount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Validation val = new Validation();
		FastagDao fd = new FastagDao();
		List<FastagUsers> fastagDetails = new ArrayList<FastagUsers>();
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String vehiNum = request.getParameter("vehicleNo");
		
		try {
			
			if(val.validateVehicleNum(vehiNum)) {
				
				fastagDetails = fd.returnDetails(vehiNum);
				
				request.setAttribute("fastagDetails", fastagDetails);
				
				RequestDispatcher rd = request.getRequestDispatcher("Fastagpay.jsp");
	            rd.forward(request, response);
			}
			
			else {
				
				 
				 RequestDispatcher rd = request.getRequestDispatcher("FASTag.jsp?flag="+true);
	             rd.forward(request, response);
			}
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
	}
	

}
