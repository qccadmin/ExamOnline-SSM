package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import entity.ClassInfo;
import entity.PaperInfo;
import entity.ScoreInfo;

@Repository
public interface ExamGradeDao {
	public List<PaperInfo> seacherPaperState();
	public List<ScoreInfo> seacherScore(int id);
	public List<ClassInfo> seacherScoreClass(int id);
	public List<ScoreInfo> seacherScoreClassScore(@Param("id") int id,@Param("classId") int classId);
	
}
