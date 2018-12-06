package biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.Exam_manageDao;
import entity.ExamPlanInfo;
import entity.Page;
import entity.TeacherInfo;
import biz.Exam_manageBiz;
import biz.Exam_summaryBiz;

@Service
public class Exam_manageBizImpl implements Exam_manageBiz{
	@Resource
	private Exam_manageDao exam_manageDao;
	@Override
	public List<ExamPlanInfo> queryAllByPage(Page p) {
		int size = p.getRows();
		int page = p.getPage();
		int count = exam_manageDao.count();// 总条数
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
		
		return exam_manageDao.queryAllByPage(p);
	}
	@Override
	public List<ExamPlanInfo> queryByTeacherId(int teacherId) {
		return exam_manageDao.queryByTeacherId(teacherId);
	}
	@Override
	public List<TeacherInfo> queryTeachers() {
		return exam_manageDao.queryTeachers();
	}
	@Override
	public int startExam(int examplanId) {
		return exam_manageDao.startExam(examplanId);
	}
	@Override
	public int endExam(int examplanId) {
		return exam_manageDao.endExam(examplanId);
	}

}
