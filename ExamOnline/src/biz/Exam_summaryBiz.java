package biz;

import java.util.List;

import entity.ExamPlanInfo;
import entity.TeacherInfo;

public interface Exam_summaryBiz {
	// 查询所有考试
	public List<ExamPlanInfo> queryAll();

	// 查询所有老师
	public List<TeacherInfo> queryTeachers();

	// 根据老师姓名查询相关考试安排
	public List<ExamPlanInfo> queryByTeacherId(int teacherId);
}
