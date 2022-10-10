package MobileRecharge;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;

public class PaymentDao {

	public int updateDebit(int pin, String username, double amount, String operator) throws ClassNotFoundException, SQLException {
		
		Statement stat = Util.getConnection().createStatement();
		
		double balance1;
		String type = "Dr";
        String to_name = operator;
        String descrip="Mobile Recharge";
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
