package biz;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.Exam_manageDao;
import entity.ExamPlanInfo;
import entity.Page;
import entity.TeacherInfo;

public interface Exam_manageBiz {
	// 分页查询
	public List<ExamPlanInfo> queryAllByPage(Page page);

	public List<ExamPlanInfo> queryByTeacherId(int teacherId);

	public List<TeacherInfo> queryTeachers();

	// 开始考试
	public int startExam(int examplanId);
	//结束考试
	public int endExam(int examplanId);
}
