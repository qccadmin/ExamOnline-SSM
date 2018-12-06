package biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.Exam_summaryDao;
import entity.ExamPlanInfo;
import entity.TeacherInfo;
import biz.Exam_summaryBiz;

@Service
public class Exam_summaryBizImpl implements Exam_summaryBiz {
	@Resource
	private Exam_summaryDao exam_summaryDao;
	@Override
	public List<ExamPlanInfo> queryAll() {
		return exam_summaryDao.queryAll();
	}
	@Override
	public List<TeacherInfo> queryTeachers() {
		return exam_summaryDao.queryTeachers();
	}
	@Override
	public List<ExamPlanInfo> queryByTeacherId(int teacherId) {
		return exam_summaryDao.queryByTeacherId(teacherId);
	}

}
