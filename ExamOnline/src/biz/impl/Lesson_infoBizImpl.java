package biz.impl;

import java.awt.print.Paper;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import biz.Lesson_infoBiz;
import dao.Lesson_infoDao;
import entity.ClassInfo;
import entity.CourseInfo;
import entity.ExamPlanInfo;
import entity.Page;
import entity.PaperInfo;

@Service
public class Lesson_infoBizImpl implements Lesson_infoBiz {
	@Resource
	private Lesson_infoDao lesson_infoDao;

	@Override
	public List<ExamPlanInfo> queryAll() {
		return lesson_infoDao.queryAll();
	}

	@Override
	public List<CourseInfo> queryCourse(int teacherId) {
		return lesson_infoDao.queryCourse(teacherId);
	}

	@Override
	public int addExamPaper(PaperInfo paperInfo) {
		return lesson_infoDao.addExamPaper(paperInfo);
	}

	@Override
	public List<Paper> queryPaper(int teacherId) {
		return lesson_infoDao.queryPaper(teacherId);
	}

	@Override
	public List<ClassInfo> queryClass(int teacherId) {
		return lesson_infoDao.queryClass(teacherId);
	}

	@Override
	public int addExamPlan(int paperId, String tempString) {
		String temp1[] = tempString.split(",");
		int sum = 0, classId, rs;
		for (int i = 0; i < temp1.length; i++) {
			classId = Integer.parseInt(temp1[i]);
			rs = lesson_infoDao.addExamPlan(paperId, classId);
			sum = sum + rs;
		}
		return sum;
	}
	@Override
	public List<ExamPlanInfo> queryAllByPage(Page p) {
		int size = p.getRows();
		int page = p.getPage();
		int count = lesson_infoDao.count();// 锟斤拷锟斤拷锟斤拷
		count = count % size == 0 ? (count / size) : (count / size + 1);
		if((int) count==0){
			return null;
		}
		//页锟斤拷锟捷�锟斤拷
		page=page<1?1:page;
		page=page>count?count:page;
		
		p.setPage(page);
		p.setPianyi((page-1)*size);
		p.setPagecount(count);
		p.setShang((page-1)<1?1:(page-1));
		p.setXia((page+1)>count?count:(page+1));
		
		return lesson_infoDao.queryAllByPage(p);
	}

	@Override
	public int count() {
		return lesson_infoDao.count();
	}

	@Override
	public int deletePlan(int examplanId) {
		return lesson_infoDao.deletePlan(examplanId);
	}

	
}
