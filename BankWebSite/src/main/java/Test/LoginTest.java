package Test;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.sql.SQLException;

import org.junit.jupiter.api.Test;

import Register.Validation;
import login.LoginDao;
import login.LoginUser;

public class LoginTest {
	LoginDao ld = new LoginDao();
	
	@Test
	public void loginUserTestPos() throws Exception{
		
		LoginUser lu = new LoginUser();
		lu.setuName("Adithya");
		lu.setPassWd("Adithya123#");
		
		assertTrue(ld.loginUser(lu) == true);
	}
	
	@Test
	public void loginUserTestNeg() throws Exception{
		
		LoginUser lu = new LoginUser();
		lu.setuName("Adithya");
		lu.setPassWd("Adithya");
		
		assertFalse(ld.loginUser(lu) == true);
	}
}	
