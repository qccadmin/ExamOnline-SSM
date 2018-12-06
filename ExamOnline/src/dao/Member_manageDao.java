package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.ClassInfo;
import entity.ExamByClassMap;
import entity.ExamPlanInfo;
import entity.Page;

public interface Member_manageDao {
	
	//查询所有考试安排
	public List<ExamByClassMap> queryAll(Page page);

	// 通过老师查询安排
	public List<ExamByClassMap> queryByClassId(int classId);
	
	//计算总数
	public int count();
	
	//查询班级
	public List<ClassInfo> queryClass();

}
