package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import entity.ScoreInfo;

@Repository
public interface GradeDetailsDao {
	public int SelectALLNum(int id);
	public List<ScoreInfo> seacheList(@Param("id") int id,@Param("pianyi") int pianyi,@Param("row") int row);
	public int deleteScore(int id);
	public List<Map> downloadList(@Param("id") int paperId);
	
}
