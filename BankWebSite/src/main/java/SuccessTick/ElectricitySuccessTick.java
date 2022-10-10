package SuccessTick;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import PayBill.PayBillDao;
import PayBill.PayBillUser;

@WebServlet("/Index/ElectricitySuccessTick")
public class ElectricitySuccessTick extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		List<PayBillUser> detailsList = new ArrayList<PayBillUser>();
		
		PayBillDao pb = new PayBillDao();
		
		int consNum = (int) request.getSession().getAttribute("consumerNumber");
		
		try {
			detailsList = pb.returnReceipt(consNum);
	 		
	 		System.out.println("Size = "+detailsList.size());
	 		
	 		request.setAttribute("ReceiptDetails", detailsList);
	 		
	 		RequestDispatcher rd = request.getRequestDispatcher("NewReceipt.jsp");
	        rd.forward(request, response);
	        
		} catch(Exception e) {
			
			e.printStackTrace();
		}
		
	}

}
