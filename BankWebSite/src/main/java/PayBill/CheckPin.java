package PayBill;

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

@WebServlet("/Index/CheckPin")
public class CheckPin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<PayBillUser> detailsList = new ArrayList<PayBillUser>();
		
		boolean accNo = false;
		int flag = 0;
		PayBillDao pb = new PayBillDao();
		double amount, balance, balance1;
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String pin1 = request.getParameter("pincode");
		int pin = Integer.parseInt(pin1);
		
		String username = (String) request.getSession().getAttribute("username");
		
		int consNum = (int) request.getSession().getAttribute("consumerNumber");
		
		try {
			
			 accNo = pb.returnAccNo(pin, username);
			 
			 if(accNo == false) {
				 
				 RequestDispatcher rd = request.getRequestDispatcher("GetPin.jsp?flag1="+true);
	             rd.forward(request, response);
			 }
			 
			 else {
				 
				 amount = pb.returnBillAmount(consNum);
				 balance = pb.returnBalance(username);
				 
				 
				 if((balance-amount) < 0) {
					 
					 RequestDispatcher rd = request.getRequestDispatcher("GetPin.jsp?flag2="+true);
		             rd.forward(request, response);
				 }
				 
				 else if(((balance-amount) <= 1000) && ((balance-amount) >= 0)) {
					 
					 RequestDispatcher rd = request.getRequestDispatcher("GetPin.jsp?flag3="+true);
		             rd.forward(request, response);
				 }
				 else {

					 	 flag = pb.updateDebitBalance(consNum, username);
					 	 
					 	 balance1 = pb.returnBalance(username);
					 	 
					 	 if(flag > 0) {
				 		
					 		 RequestDispatcher rd = request.getRequestDispatcher("ElectricitySuccess.jsp");
					         rd.forward(request, response);
					 		 
					 	 }
					 	 
					 	 else {
					 		 
					 		out.println("<script type=text/javascript>");
							out.println("alert('Oops ! something went wrong Try again later');");
							out.println("location='Functions.jsp';");
							out.println("</script>");
					 	 }
					 	 
				 }
				 
			 }
			
		}catch (Exception e) {
			// TODO Auto-generated catch block
			 e.printStackTrace();
		 }
		
	}

}
