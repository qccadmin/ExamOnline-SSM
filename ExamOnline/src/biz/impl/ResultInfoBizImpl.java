package biz.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import dao.ResultInfoDao;
import entity.ResultInfo;
import biz.ResultInfoBiz;

@Service
public class ResultInfoBizImpl implements ResultInfoBiz {
	@Resource
	private ResultInfoDao resultDao;
	public ResultInfoDao getResultDao() {
		return resultDao;
	}
	public void setResultDao(ResultInfoDao resultDao) {
		this.resultDao = resultDao;
	}
	@Override
	public int addResult(ResultInfo reultInfo) {
		return resultDao.addResult(reultInfo);
	}
	
	
	
}
