package biz.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import biz.StudentStateBiz;
import dao.StudentStateDao;
import entity.StudentState;

@Service
public class StudentStateBizImpl implements StudentStateBiz{
@Resource
private StudentStateDao studentStateDao;
	@Override
	public int addState(int paperId, int studentId, int studentState) {
		StudentState ss=studentStateDao.queryState(paperId, studentId);
		if(ss!=null){
			if(ss.getStateFlag()==1){
				studentStateDao.updateState(paperId, studentId, studentState);
				return 0 ;
			}
		}
		return studentStateDao.addState(paperId, studentId, studentState);
	}

	@Override
	public int queryState(int paperId, int studentId) {
		StudentState state = studentStateDao.queryState(paperId, studentId);
		if(state!=null){
			return state.getStateFlag();
		}
		return 0;
	}
	
}
