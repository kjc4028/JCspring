package spring.jc.web;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"}) //이 경로에 xml파일을 이용해서 스프링이 로딩

// 스프링이 로딩되게 하는 부분
public class MyBatisTest {

	@Inject    //스프링이 생성해서 주입해 줌
	private SqlSessionFactory sqlFactory;
	
	@Test
	public void testFactory(){
		System.out.println(sqlFactory);
	}

	
	
	@Test
	public void testSession() throws Exception {
		try(SqlSession session = sqlFactory.openSession() ) {
			System.out.println(session);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
