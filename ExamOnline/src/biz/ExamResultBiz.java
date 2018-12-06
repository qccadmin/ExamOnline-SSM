package biz;

import java.util.List;

import entity.ScoreInfo;

public interface ExamResultBiz {

	public int addExamResult(ScoreInfo scoreInfo);
	
	public List<ScoreInfo> getScoreInfoById(int studentId);
	public int calScore(int paperId,int[] titles,String[] answers,int StudentId);
}
