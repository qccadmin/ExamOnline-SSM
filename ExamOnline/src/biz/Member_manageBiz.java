package biz;

import java.util.List;

import entity.ClassInfo;
import entity.ExamByClassMap;
import entity.ExamPlanInfo;
import entity.Page;

public interface Member_manageBiz {

	// 查询所有考试安排
	public List<ExamByClassMap> queryAll(Page page);

	// 查询班级
	public List<ClassInfo> queryClass();

	// 通过老师查询安排
	public List<ExamByClassMap> queryByClassId(int classId);

}
