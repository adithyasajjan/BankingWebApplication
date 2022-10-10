package ForgotPassword;

import java.sql.SQLException;
import java.sql.Statement;

import Deposit.Util;

public class ForgotPasswordDao {
	
	public int updatePassword(String passwd, String name) throws ClassNotFoundException, SQLException {
		
		Statement stat = Util.getConnection().createStatement();
		String sql = " update RegisterDetails set passwd='"+passwd+"' where username='"+name+"' ";
		return stat.executeUpdate(sql);
		
	}
}
