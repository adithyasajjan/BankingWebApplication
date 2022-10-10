package Fastag;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import Transaction.Util;

public class FastagDao {
	
	public List<FastagUsers> returnDetails(String vehiNum) throws ClassNotFoundException, SQLException{
		
		Statement stat = Util.getConnection().createStatement();
		
		List<FastagUsers> fastagDetails = new ArrayList<FastagUsers>();
		String sql = " select name, vehicleName from Fastag where vehicleNum='"+vehiNum+"' "; 
		ResultSet rs = stat.executeQuery(sql);
		while(rs.next()) {
			
			FastagUsers fu = new FastagUsers();
			
			fu.setName(rs.getString("name"));
			fu.setVehiName(rs.getString("vehicleName"));
			
			fastagDetails.add(fu);
		}
		
		return fastagDetails;
		
	}
	
	public int debitAmount(int pin, String username, double amount) throws ClassNotFoundException, SQLException {
		
		Statement stat = Util.getConnection().createStatement();
		
		double balance1;
		String type = "Dr";
        String to_name = "FASTag";
        String descrip="Recharge";
        int accNo;
        
        String sql4 = " select accNo from RegisterDetails where pin="+pin+" and username='"+username+"'";
        ResultSet rs4 = stat.executeQuery(sql4);
        rs4.next();
        accNo = rs4.getInt("accNo");
		
        String sql = " select balance from RegisterDetails where username='"+username+"' and pin="+pin+" ";
        ResultSet rs = stat.executeQuery(sql);
        rs.next();
        balance1 = rs.getDouble(1);
        balance1 -= amount;
        
        balance1 = Math.round(balance1 * Math.pow(10, 3)) / Math.pow(10, 3);
        
        LocalDateTime dt = java.time.LocalDateTime.now();
        
        String sql2 = " insert into Transaction values("+accNo+", '"+dt+"' ,'"+to_name+"', "+amount+",'"+descrip+"', '"+type+"', "+balance1+") ";
        int res = stat.executeUpdate(sql2);

        String sql3 = " update RegisterDetails set balance="+balance1+" where accNo="+accNo+" ";
        stat.executeUpdate(sql3);

        return res;
	}
}
