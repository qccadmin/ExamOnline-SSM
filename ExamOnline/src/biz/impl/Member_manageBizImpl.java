package biz.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import biz.Member_manageBiz;
import dao.Member_manageDao;
import entity.ClassInfo;
import entity.ExamByClassMap;
import entity.ExamPlanInfo;
import entity.Page;
import entity.StudentInfo;

@Service
public class Member_manageBizImpl implements Member_manageBiz{
	@Resource
	private Member_manageDao member_manageDao;

	@Override
	public List<ExamByClassMap> queryAll(Page p) {
		/*List<ExamByClassMap> queryAll = member_manageDao.queryAll();
		StudentInfo student = new StudentInfo();
		List<ExamPlanInfo> list = new ArrayList<ExamPlanInfo>();
		for (ExamByClassMap examByClassMap : queryAll) {
			ExamPlanInfo exam = new ExamPlanInfo();
			exam.getPaperInfo().setPaperName(examByClassMap.getPaperName());
			student.setStudentId(examByClassMap.getStudentId());
			student.setStudentName(examByClassMap.getStudentName());
			exam.getClassInfo().getStudents().add(student);
			exam.setExamState(examByClassMap.getExamState());
			list.add(exam);
		}
		return list;*/
		int size = p.getRows();
		int page = p.getPage();
		int count = member_manageDao.count();// 总条数
		count = count % size == 0 ? (count / size) : (count / size + 1);
		if((int) count==0){
			return null;
		}
		//页面容错处理
		page=page<1?1:page;
		page=page>count?count:page;
		
		p.setPage(page);
		p.setPianyi((page-1)*size);
		p.setPagecount(count);
		p.setShang((page-1)<1?1:(page-1));
		p.setXia((page+1)>count?count:(page+1));
		return member_manageDao.queryAll(p);
	}

	@Override
	public List<ClassInfo> queryClass() {
		return member_manageDao.queryClass();
	}

	@Override
	public List<ExamByClassMap> queryByClassId(int classId) {
		return member_manageDao.queryByClassId(classId);
	}


}
