package biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.ScoreInfo;

public interface GradeDetailsBiz {
	public int SelectALLNum(int id);
	public List<ScoreInfo> seacheList(int id,int pianyi,int row);
	public int deleteScore(int id);
	public String downloadList(int paperId,int teacherId,String path);
}
