package dao;

import org.springframework.stereotype.Repository;

import entity.ResultInfo;

@Repository
public interface ResultInfoDao {
	//添加考试答案
	public int addResult(ResultInfo resultInfo);
	
	
}
