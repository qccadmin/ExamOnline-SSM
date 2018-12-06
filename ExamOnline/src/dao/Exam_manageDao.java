package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.ExamPlanInfo;
import entity.Page;
import entity.TeacherInfo;

public interface Exam_manageDao {
	// 分页查询
	public List<ExamPlanInfo> queryAllByPage(Page page);

	// 计算考试安排总条数
	public int count();

	// 通过老师查询安排
	public List<ExamPlanInfo> queryByTeacherId(int teacherId);

	// 查询所有老师
	public List<TeacherInfo> queryTeachers();

	// 开始考试
	public int startExam(int examplanId);

	// 结束考试
	public int endExam(int examplanId);

}
