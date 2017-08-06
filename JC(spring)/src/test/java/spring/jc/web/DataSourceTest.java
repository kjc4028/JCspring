package spring.jc.web;


import java.sql.Connection;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"}) //�� ��ο� xml������ �̿��ؼ� �������� �ε�

// �������� �ε��ǰ� �ϴ� �κ�
public class DataSourceTest {

	@Inject    //�������� �����ؼ� ������ ��
	private DataSource ds;

	@Test
	public void testConnection() throws Exception{
		
		try(Connection con = ds.getConnection()){
			System.out.println(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
