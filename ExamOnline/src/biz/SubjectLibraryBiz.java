package biz;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.CourseInfo;
import entity.PaperInfo;
import entity.TitleInfo;

public interface SubjectLibraryBiz {
	public List<CourseInfo> seachCourseByTeacherID(int id);//查询单个老师课程
	public List<PaperInfo> seachPaperByCourseID(int id);//通过课程id获取
	public List<PaperInfo> seachPaperNoTit(int id);//这个老师，查询没有考题的试卷
	public int insertExcelTit(InputStream in,int paperId);//excel插入数据
	public List<TitleInfo> seachPaperByPaperId(int id, int teacherid);//根据试卷号查题目
	public int updateTitle(TitleInfo ti,int teacherId);
	public int deleteTitle(int titid,int teacherId);
	public int Updatepaperinfo(int paperId);
}
