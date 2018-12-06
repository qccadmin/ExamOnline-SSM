package biz;

import java.util.List;

import entity.EchartSeries;
import entity.PaperInfo;
import entity.ScoreInfo;

public interface ExamGradeBiz {
	public List<PaperInfo> seacherPaperState();
	public List<String> seacherScore(int id);
	public List<EchartSeries> seacherScoreClass(int id);
	public List<ScoreInfo> seacherScoreClassScore(int id,int classId);
}
