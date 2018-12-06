package junit;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import dao.TitleInfoDao;
import entity.TitleByPaperId;
import entity.TitleInfo;

public class TitleTest {
	SqlSession session;
	TitleInfoDao titleDao;

	@Before
	public void before() throws IOException{
		Reader reader =Resources.getResourceAsReader("MyBatis-configuration.xml");
		SqlSessionFactory factory =new SqlSessionFactoryBuilder().build(reader);
		session=factory.openSession();
		titleDao = session.getMapper(TitleInfoDao.class);
	}
	//根据试卷ID查找相应试题
	@Test
	public void titleByPaperId(){
		List<TitleInfo> list = titleDao.getTitleByPaperId(1);
		for (TitleInfo titleByPaperId : list) {
			System.out.println(titleByPaperId);
		}
	}		
	@After
	public void after(){
		session.commit();   //增删改需要提交
		session.close();    //关闭资源
	}

}
