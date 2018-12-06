package dao;

import java.awt.print.Paper;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.ClassInfo;
import entity.CourseInfo;
import entity.ExamPlanInfo;
import entity.Page;
import entity.PaperInfo;

public interface Lesson_infoDao {
	//锟斤拷锟斤拷跃锟�
	public int addExamPaper(PaperInfo paperInfo);
	
	//锟斤拷询锟斤拷锟叫匡拷锟皆帮拷锟斤拷
	public List<ExamPlanInfo> queryAll();
	
	//锟斤拷询锟斤拷锟叫课筹拷
	public List<CourseInfo> queryCourse(int teacherId);
	
	//锟斤拷询锟斤拷锟斤拷锟皆撅拷
	public List<Paper> queryPaper(int teacherId);
	
	//锟斤拷询锟斤拷锟叫班级
	public List<ClassInfo> queryClass(int teacherId);
	
	//锟斤拷涌锟斤拷园锟斤拷锟�
	public int addExamPlan(@Param("paperId")int paperId,@Param("classId")int classId);
	
	//锟斤拷锟姐考锟皆帮拷锟斤拷锟斤拷锟斤拷锟斤拷
	public int count();
	
	//锟斤拷页锟斤拷询
	public List<ExamPlanInfo> queryAllByPage(Page page);
	
	//删锟斤拷锟皆帮拷锟斤拷
	public int deletePlan(int examplanId);
}
