package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import entity.CourseInfo;
import entity.PaperInfo;
import entity.TitleInfo;

@Repository
public interface SubjectLibraryDao {
	public List<CourseInfo> seachCourseByTeacherID(int id);//查询单个老师课程
	public List<PaperInfo> seachPaperByCourseID(int id);//通过课程id获取
	public List<PaperInfo> seachPaperNoTit(int id);//这个老师，查询没有考题的试卷
	public int insertExcelTit(TitleInfo ti);//excel插入数据
	public List<TitleInfo> seachPaperByPaperId(@Param("id")int id,@Param("teacherid")int teacherid);//根据试卷号查题目
	public int updateTitle(@Param("ti")TitleInfo ti,@Param("teacherId")int teacherId);
	public int deleteTitle(@Param("titid")int titid,@Param("teacherId")int teacherId);
	public int Updatepaperinfo(int paperId);
}
