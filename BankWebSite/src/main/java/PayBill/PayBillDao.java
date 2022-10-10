package PayBill;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import AccountDetails.Util;
import Balance.BalanceUser;

public class PayBillDao {
	
	public boolean returnStatus(int consNum) throws ClassNotFoundException, SQLException {
		
		Statement stat = Util.getConnection().createStatement();
		String status;
		boolean flag = false;
		
		String sql = " select PaymentStatus from ElectricityBill where consumerNo="+consNum+" ";
		ResultSet rs = stat.executeQuery(sql);
		rs.next();
		status = rs.getString("PaymentStatus");
		
		if(status.equals("Paid")) {
			
			flag = true;	
		}
		
		return flag;
	}
	
	public List<PayBillUser> returnBillDetails(int consNum) throws ClassNotFoundException, SQLException{
		
		Statement stat = Util.getConnection().createStatement();
		
		List<PayBillUser> detailsList = new ArrayList<PayBillUser>();
		
//		LocalDateTime dt = java.time.LocalDateTime.now();
		
//		String sql = " update ElectricityBill set PaymentDate='"+dt+"' where consumerNo="+consNum+" ";
//		stat.executeUpdate(sql);
		
		String sql1 = " select * from ElectricityBill where consumerNo="+consNum+" ";
		ResultSet rs = stat.executeQuery(sql1);
		
		while(rs.next()) {
			
			PayBillUser pb = new PayBillUser();
			
			pb.setConsNum(rs.getInt("consumerNo"));
			pb.setName(rs.getString("name"));
			pb.setElecProvider(rs.getString("ElectricityBiller"));
			pb.setConsump(rs.getInt("Consumption"));
			pb.setBd(rs.getDate("BillDate"));
			pb.setBdd(rs.getDate("BillDueDate"));
			pb.setPd(rs.getDate("PaymentDate"));
			pb.setStatus(rs.getString("PaymentStatus"));
			pb.setAmount(rs.getDouble("BillAmount"));
			
			detailsList.add(pb);
			
		}
		return detailsList;
	}
	
	public String returnName(int consNum) throws ClassNotFoundException, SQLException {
		
		Statement stat = Util.getConnection().createStatement();
		String name="";
		
		String sql = " select name from ElectricityBill where consumerNo="+consNum+" ";
		ResultSet rs = stat.executeQuery(sql);
		rs.next();
		
		name = rs.getString("name");
		
		return name;	
	}
	
	public List<PayBillUser> returnReceipt(int consNum) throws ClassNotFoundException, SQLException {
		
		String str="Paid";
		Statement stat = Util.getConnection().createStatement();
		
		List<PayBillUser> detailsList = new ArrayList<PayBillUser>();
		
		LocalDateTime dt = java.time.LocalDateTime.now();
		
		String sql = " update ElectricityBill set PaymentDate='"+dt+"', PaymentStatus='"+str+"' where consumerNo="+consNum+" ";
		stat.executeUpdate(sql);
		
		String sql1 = " select * from ElectricityBill where consumerNo="+consNum+" ";
		ResultSet rs = stat.executeQuery(sql1);
		
		while(rs.next()) {
				
				PayBillUser pb = new PayBillUser();
				
				pb.setConsNum(rs.getInt("consumerNo"));
				pb.setName(rs.getString("name"));
				pb.setElecProvider(rs.getString("ElectricityBiller"));
				pb.setConsump(rs.getInt("Consumption"));
				pb.setBd(rs.getDate("BillDate"));
				pb.setBdd(rs.getDate("BillDueDate"));
				pb.setPd(rs.getDate("PaymentDate"));
				pb.setStatus(rs.getString("PaymentStatus"));
				pb.setAmount(rs.getDouble("BillAmount"));
				
				detailsList.add(pb);
				
			}
			return detailsList;		
		
	}
	
	public boolean returnAccNo(int pin, String username) throws SQLException, ClassNotFoundException {
			
		Statement stat = Util.getConnection().createStatement();
        String sql = " select accNo from RegisterDetails where pin="+pin+" and username='"+username+"' ";
        ResultSet rs = stat.executeQuery(sql);
        return rs.next();     
	
	 }
	
	 public double returnBillAmount(int consNum) throws ClassNotFoundException, SQLException {
		 
		 Statement stat = Util.getConnection().createStatement();
		 double amount, balance;
		 
		 String sql = " select BillAmount from ElectricityBill where consumerNo="+consNum+" ";
		 ResultSet rs = stat.executeQuery(sql);
		 rs.next();
		 amount = rs.getDouble("BillAmount");
		 
		 return amount;
	 }
	 
	 public double returnBalance(String username) throws ClassNotFoundException, SQLException  {
		 
		 Statement stat = Util.getConnection().createStatement();
		 double balance;
		 
		 String sql = " select balance from RegisterDetails where username='"+username+"' ";
		 ResultSet rs = stat.executeQuery(sql);
		 rs.next();
		 balance = rs.getDouble("balance");
		 
		 return balance;
		 
	 }
	 
	 public int updateDebitBalance(int consNum, String username) throws ClassNotFoundException, SQLException {
		 
		 Statement stat = Util.getConnection().createStatement(); 
		 
		 double balance1, amount;
		 String descrip = "Utility bill";
		 String type = "Dr";
		 String to_name = ""; 
		 int accNo;
				 
		 String sql = " select ElectricityBiller from ElectricityBill where consumerNo="+consNum+" ";
		 ResultSet rs = stat.executeQuery(sql);
		 rs.next();
		 to_name = rs.getString("ElectricityBiller");
		 		 
		 String sql4 = " select accNo from RegisterDetails where username='"+username+"'";
		 ResultSet rs3 = stat.executeQuery(sql4);
		 rs3.next();
		 accNo = rs3.getInt("accNo");
		 
		 String sql2 = " select balance from RegisterDetails where username='"+username+"' ";
		 ResultSet rs1 = stat.executeQuery(sql2);
		 rs1.next();
		 balance1 = rs1.getDouble("balance");
		 
		 String sql3 = " select BillAmount from ElectricityBill where consumerNo="+consNum+" ";
		 ResultSet rs2 = stat.executeQuery(sql3);
		 rs2.next();
		 amount = rs2.getDouble("BillAmount");
		 
		 System.out.println("Bill Amount = "+amount);
		 
		 balance1 -= amount;
		 
		 balance1 = Math.round(balance1 * Math.pow(10, 3)) / Math.pow(10, 3);
		 
		 LocalDateTime dt = java.time.LocalDateTime.now();
		 
		 String sql5 = " insert into Transaction values("+accNo+", '"+dt+"' ,'"+to_name+"', "+amount+",'"+descrip+"', '"+type+"', "+balance1+") ";
	     int res = stat.executeUpdate(sql5);
	     
	     String sql6 = " update RegisterDetails set balance="+balance1+" where accNo="+accNo+" ";
	     stat.executeUpdate(sql6);
	     
	     return res;
		 
	 }
	
}
