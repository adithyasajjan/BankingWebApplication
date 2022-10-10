package Test;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.jupiter.api.Test;

import Balance.BalanceDao;
import Balance.BalanceUser;

public class BalanceTest {
	BalanceDao bd = new BalanceDao();
	
	@Test
	public void balanceTestPos() throws Exception{
		
		BalanceUser bu = new BalanceUser();
		bu.setPin(1234);
		String name = "Adithya";
		assertTrue(bd.returnAccNo(bu, name) == true);
	}
	
	@Test
	public void balanceTestNeg() throws Exception{
		
		BalanceUser bu = new BalanceUser();
		bu.setPin(1233);
		String name = "Adithya";
		assertFalse(bd.returnAccNo(bu, name) == true);
	}
}
