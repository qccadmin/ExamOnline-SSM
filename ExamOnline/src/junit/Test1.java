package junit;

import java.io.IOException;
import java.io.Reader;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;





/*
 * junit 单元测试
 */
public class Test1 {
	
	SqlSession session;


	@Before
	public void before() throws IOException{
		Reader reader =Resources.getResourceAsReader("MyBatis-configuration.xml");
		SqlSessionFactory factory =new SqlSessionFactoryBuilder().build(reader);
		session=factory.openSession();
		
		 
	}
	
	@Test
	public void getAll(){
		
	}
	
	
	
	@After
	public void after(){
		session.commit();   //增删改需要提交
		session.close();    //关闭资源
	}

}
