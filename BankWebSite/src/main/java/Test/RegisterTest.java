package Test;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.jupiter.api.Test;

import Register.Validation;

public class RegisterTest {
	
	Validation val = new Validation();
	
	@Test
	public void userNameTestPos() {
		
		
		String name = "Adithya";
		
		assertTrue(val.validateName(name) == true);
	}
	
	@Test
	public void userNameTestNeg() {
			
			
			String name = "Adithya123";
			
			assertFalse(val.validateName(name) == true);
	}
	
	@Test
	public void passwordTestPos() {
			
		String passwd = "Adithya123#";
		
		assertTrue(val.validatePassword(passwd) == true);
	}
	
	@Test
	public void passwordTestNeg() {
			
		String passwd = "Adithya";
		
		assertFalse(val.validatePassword(passwd) == true);
	}
	
	@Test
	public void confirmPasswordTestPos() {
			
		String passwd1 = "Adithya123#";
		String passwd2 = "Adithya123#";
		
		assertTrue(val.validatePasswords(passwd1, passwd2) == true);
	}
	
	@Test
	public void confirmPasswordTestNeg() {
			
		String passwd1 = "Adithya123#";
		String passwd2 = "Adithya123*";
		
		assertFalse(val.validatePasswords(passwd1, passwd2) == true);
	}
	
	@Test 
	public void amountTestPos() {
		
		double amount = 3000.50;
		
		assertTrue(val.validateAmount(amount) == true);
			
	}
	
	@Test 
	public void amountTestNeg() {
		
		double amount = 500;
		
		assertFalse(val.validateAmount(amount) == true);
			
	}
}
