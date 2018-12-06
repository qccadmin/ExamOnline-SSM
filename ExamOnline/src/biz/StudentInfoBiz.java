package biz;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import entity.ExamPlanInfo;
import entity.Page;
import entity.StudentInfo;


public interface StudentInfoBiz {
	public List<StudentInfo> getStudents(Map<String, Object> map);

	public StudentInfo getStudentById(int studentId);

	public int isUpdateStudent(StudentInfo student);

	public int isDelStudent(int studentId);
	
	public int isAddStudent(StudentInfo student);
	
	public int getStudentTotal();
	
	//更改密码是否成功
	public int isResetPwdWithStu(StudentInfo studentInfo);
	
	public List<StudentInfo> getStudentsByClassId(int classId);
	//查询所有学生
	public List<StudentInfo> queryAll(Page p);
	
	//添加一个学生
	public boolean insert(StudentInfo studentInfo);
	//模糊查询
	public List<StudentInfo> fuzzyQuery(@Param("id")int classId,@Param("sName")String Name,@Param("page")Page page);
	//条件查询学生信息总条数
	public int fuzzyQueryCount(@Param("id")int classId,@Param("sName")String Name);

	
	public StudentInfo queryById(int studentId);

	//学生登录
	public StudentInfo studentLogin(StudentInfo student);
	// 通过用户名及密码核查用户登录
    public StudentInfo checkLogin(int studentid, String studentpwd);
    //通过学生id，班级查询某个考试安排
    public List<ExamPlanInfo> getExamPlanInfoById(int studentId);
    public List<StudentInfo> queryAllStudent();
    public List<StudentInfo> queryEmptyStudent();
    public boolean editClass(@Param("id")int teacherId);
    public boolean examState(int studentId,int paperId);
    
    public boolean batchAddStudent(InputStream in);
}
