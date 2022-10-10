package MobileRecharge;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Withdraw.WithdrawDao;
import Withdraw.WithdrawUser;

@WebServlet("/Index/Payment")
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean accNo = false;
		int flag = 0;
		double balance, balance1;
		
		WithdrawDao wd = new WithdrawDao();
		WithdrawUser wu = new WithdrawUser();
		PaymentDao pd = new PaymentDao();
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String amount1 = request.getParameter("amount");
		double amount = Double.parseDouble(amount1);
		
		String pin1 = request.getParameter("pincode");
		int pin = Integer.parseInt(pin1);
		
		String uname = (String) request.getSession().getAttribute("username");
		
		wu.setAmount(amount);
		wu.setPin(pin);
		
		try {
			
			 accNo = wd.returnAccNo(wu, uname);
			 if(accNo == false) {
				 
				 RequestDispatcher rd = request.getRequestDispatcher("Payment.jsp?flag1="+true);
	             rd.forward(request, response);
				 
			 }
			 
			 else {
				 
				 balance = wd.showBalance(wu, uname);
				 if((balance-amount) <= 1000 && (balance-amount) >= 0) {
									
					 RequestDispatcher rd = request.getRequestDispatcher("Payment.jsp?flag2="+true);
		             rd.forward(request, response);
					 
				 }
				 
				 else if(balance < amount){
					 
					 RequestDispatcher rd = request.getRequestDispatcher("Payment.jsp?flag3="+true);
		             rd.forward(request, response);
				 }
				 
				 else { 
					 
					 String operator = (String) request.getSession().getAttribute("operator");
					 
					 flag = pd.updateDebit(pin, uname, amount, operator);
					 
					 balance1 = wd.showBalance(wu, uname);
					 
					 if(flag > 0) {
						 
						 RequestDispatcher rd = request.getRequestDispatcher("SuccessTck.jsp");
				         rd.forward(request, response);
						 
					 }
					 
					 else
					 {
						 	
						   out.println("<script type=text/javascript>");
						   out.println("alert('Oops ! something went wrong Try again later');");
						   out.println("location='Functions.html';");
						   out.println("</script>");
					 }
				 }
				
				
			 }
			 
		  }	 catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		
		  }
	}

}
