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

import dao.Member_manageDao;
import entity.ExamByClassMap;
import entity.Page;

public class Member_manageTest {
	SqlSession session;
	Member_manageDao member_manageDao;
	@Before
	public void before() throws IOException{
		Reader reader =Resources.getResourceAsReader("MyBatis-configuration.xml");
		SqlSessionFactory factory =new SqlSessionFactoryBuilder().build(reader);
		session=factory.openSession();
		member_manageDao = session.getMapper(Member_manageDao.class);
	}
	@Test
	public void queryById(){
		int classId = 1;
		List<ExamByClassMap> list = member_manageDao.queryByClassId(classId);
		for (ExamByClassMap examPlanInfo : list) {
			System.out.println(examPlanInfo.toString());
		}
	}
	@Test
	public void queryAll(){
		Page page = new Page();
		page.setPianyi(0);
		List<ExamByClassMap> list = member_manageDao.queryAll(page);
		for (ExamByClassMap examPlanInfo : list) {
			System.out.println(examPlanInfo);
		}
	}
	@Test
	public void count(){
		int count = member_manageDao.count();
		System.out.println(count);
	}
	@After
	public void after(){
		session.commit();   //增删改需要提交
		session.close();    //关闭资源
	}
}
