package dao;

import java.util.List;

import entity.ExamPlanInfo;
import entity.ScoreInfo;

public interface ExamResultDao {

	public int addExamResult(ScoreInfo scoreInfo);
	
	public List<ScoreInfo> getScoreInfoById(int studentId);
}
