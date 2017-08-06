package spring.jc.web;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;



public class OrackConnectionTest {

	
	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	
	private static final String URL = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	
	private static final String USER = "admin";
	
	private static final String PW = "admin";
	
	
	@Test
	public void testConnection() throws Exception {
		Class.forName(DRIVER);
		
		try(Connection con = DriverManager.getConnection(URL, USER, PW)) {
			System.out.println(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
