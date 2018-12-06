package dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import entity.ExamPlanInfo;
import entity.TeacherInfo;

@Repository
public interface Exam_summaryDao {
	//查询所有考试
	public List<ExamPlanInfo> queryAll();
	
	//查询所有老师
	public List<TeacherInfo> queryTeachers();
	
	//根据老师姓名查询相关考试安排 
	public List<ExamPlanInfo> queryByTeacherId(int teacherId);
}
