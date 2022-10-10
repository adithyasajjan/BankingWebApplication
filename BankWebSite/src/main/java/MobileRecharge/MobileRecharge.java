package MobileRecharge;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Register.Validation;

@WebServlet("/Index/MobileRecharge")
public class MobileRecharge extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		Validation val = new Validation();
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String phNum = request.getParameter("mobileNum");
		
		String operator = request.getParameter("operator");
		
		request.getSession().setAttribute("operator", operator);
		
		if(val.validatePhoneNum(phNum)) {
				
			if(operator.equals("Jio Prepaid")) {
			
				RequestDispatcher rd = request.getRequestDispatcher("JioSelectPlans.jsp");
	            rd.forward(request, response);
	            
			}
			else if(operator.equals("Airtel Prepaid")) {
				
				RequestDispatcher rd = request.getRequestDispatcher("AirtelSelectPlans.jsp");
	            rd.forward(request, response);
			}
			else {
				
				RequestDispatcher rd = request.getRequestDispatcher("ViSelectPlans.jsp");
	            rd.forward(request, response);
			}
			
		}
		
		else {
			
			RequestDispatcher rd = request.getRequestDispatcher("MobileRecharge.jsp?flag="+true);
            rd.forward(request, response);
		}
	}

}
