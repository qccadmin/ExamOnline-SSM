package biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import biz.ExamResultBiz;
import dao.ExamResultDao;
import dao.TitleInfoDao;
import entity.PaperInfo;
import entity.ScoreInfo;
import entity.StudentInfo;
import entity.TitleInfo;

@Service
public class ExamResultBizImpl implements ExamResultBiz {
	@Resource
	ExamResultDao examResultDao;
	
	
	@Autowired
	TitleInfoDao titleInfoDao;

	// �������
	public int calScore(int paperId,int[] titles,String[] answers,int StudentId){
		List<TitleInfo> list = titleInfoDao.getTitleByPaperId(paperId);
		int sum=0;
		for (TitleInfo ti:list) {
			for(int j=0;j<titles.length;j++){
				if(ti.getTitleCat()!=4){
					if(ti.getTitleId()==titles[j]){
						if(ti.getAnswerRight().equals(answers[j])){
							sum+=ti.getAnswerScore();
						}
					}
				}else{
					
				}
			}
		}
		ScoreInfo si=new ScoreInfo();
		StudentInfo stu=new StudentInfo();
		PaperInfo pi=new PaperInfo();
		pi.setPaperId(paperId);
		stu.setStudentId(StudentId);
		si.setStudentInfo(stu);
		si.setPaperInfo(pi);
		si.setObjectSco(sum);
		si.setSumSco(sum);
		addExamResult(si);
		return sum ;
	}

	@Override
	public int addExamResult(ScoreInfo scoreInfo) {
		return examResultDao.addExamResult(scoreInfo);
	}

	@Override
	public List<ScoreInfo> getScoreInfoById(int studentId) {
		return examResultDao.getScoreInfoById(studentId);
	}

}
