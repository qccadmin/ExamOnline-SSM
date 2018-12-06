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

import dao.ExamResultDao;
import dao.ResultInfoDao;



import dao.StudentInfoDao;
import entity.ExamPlanInfo;
import dao.TeacherInfoDao;
import entity.PaperInfo;
import entity.ResultInfo;
import entity.ScoreInfo;
import entity.StudentInfo;
import entity.TeacherInfo;
import entity.TitleInfo;



/*
 * junit 单元测试
 */
public class StudentInfoTest {
	
	SqlSession session;
	StudentInfoDao dao1;
	TeacherInfoDao teacherDao;

	ResultInfoDao resultDao;
	ExamResultDao examResultDao;



	@Before
	public void before() throws IOException{
		Reader reader =Resources.getResourceAsReader("MyBatis-configuration.xml");
		SqlSessionFactory factory =new SqlSessionFactoryBuilder().build(reader);
		session=factory.openSession();
		dao1=session.getMapper(StudentInfoDao.class);
		teacherDao = session.getMapper(TeacherInfoDao.class);
		resultDao=session.getMapper(ResultInfoDao.class);
		examResultDao=session.getMapper(ExamResultDao.class);

	}
	//增加学生成绩
	
	@Test
	//查询学生成绩集合
	public void queryScoreById(){
		List<ScoreInfo> scoreInfoList = examResultDao.getScoreInfoById(4001);
		for (ScoreInfo scoreInfo : scoreInfoList) {
			System.out.println(scoreInfo);
		}
	}
	
	//获取学生总数
		@Test
		public void getStudentById(){
		System.out.println(dao1.getStudentById(150706001));
		}
	
	//根据id查询
	@Test
	public void getStudentTotal(){
	System.out.println(dao1.getStudentTotal());
	}
	//根据学生id修改密码
	@Test
	public void genggai(){
	StudentInfo studentInfo=new StudentInfo();
	studentInfo.setStudentId(150705001);
	studentInfo.setStudentPwd("1234");
	System.out.println(dao1.isResetPwdWithStu(studentInfo));	
	}
	
	//根据班级id查询学生集合
		@Test
		public void banji(){
			 List<StudentInfo> list = dao1.getStudentsByClassId(1);
			 for (StudentInfo studentInfo : list) {
				System.out.println(studentInfo);
			}
		}
		
		//根据学生id查询考试集合
		@Test
		public void kaoshi(){
			 List<ExamPlanInfo> list = dao1.getExamPlanInfoById(4001);
			 for (ExamPlanInfo examPlanInfo : list) {
				System.out.println(examPlanInfo);
			}
		}

		//学生登录
		@Test
		public void slogin(){
			StudentInfo student = new StudentInfo(150705,"123");
			System.out.println(dao1.studentLogin(student));
		}
		//教师登录
		@Test
		public void tlogin(){
			TeacherInfo teacher = new TeacherInfo(1501,"123");
			System.out.println(teacherDao.teacherLogin(teacher));

		}

		//增加考试答案
		@Test
		public void addResult(){
			ResultInfo result = new ResultInfo();
			StudentInfo studentInfo=dao1.getStudentById(4001);
			PaperInfo paperInfo=new PaperInfo();
			paperInfo.setPaperId(1);
			TitleInfo titleInfo=new TitleInfo();
			titleInfo.setTitleId(1);
			result.setStudentInfo(studentInfo);
			result.setPaperInfo(paperInfo);
			result.setStudentAnswer("A");
			result.setTitleCat(0);//0代表选择题，1代表客观题
			result.setCorrectState(0);//0代表未批改，1代表已经批改
			result.setTitleInfo(titleInfo);	
			System.out.println(resultDao.addResult(result));
		}

		
			
	@After
	public void after(){
		session.commit();   //增删改需要提交
		session.close();    //关闭资源
	}

}
