package biz.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import biz.ExamGradeBiz;
import dao.ExamGradeDao;
import entity.ClassInfo;
import entity.EchartSeries;
import entity.PaperInfo;
import entity.ScoreInfo;

@Service
public class ExamGradeBizImpl implements ExamGradeBiz{
	
	@Resource
	private ExamGradeDao eg;
	
	public List<PaperInfo> seacherPaperState(){
		
		return eg.seacherPaperState();
	}

	@SuppressWarnings("null")
	@Override
	public List<String> seacherScore(int id) {
		// TODO Auto-generated method stub
		List<ScoreInfo> list=eg.seacherScore(id);
		int num60=0,num70=0,num80=0,num90=0,num100=0;
		for(ScoreInfo si:list){
			if(si.getSumSco()>=90){
				num100++;
			}else if(si.getSumSco()>=80){
				num90++;
			}else if(si.getSumSco()>=70){
				num80++;
			}else if(si.getSumSco()>=60){
				num70++;
			}else{
				num60++;
			}
		}
		List<String> liStr=new ArrayList<String>();
		liStr.add(num60+"");
		liStr.add(num70+"");liStr.add(num80+"");liStr.add(num90+"");liStr.add(num100+"");
		return liStr;
	}

	@Override
	public List<EchartSeries> seacherScoreClass(int id) {
		// TODO Auto-generated method stub
		List<ClassInfo> list=eg.seacherScoreClass(id);
		List<EchartSeries> es=new ArrayList<EchartSeries>();
		for(ClassInfo ci:list){
			List<ScoreInfo> lci=seacherScoreClassScore(id,ci.getClassId());
			int num60=0,num70=0,num80=0,num90=0,num100=0;
			String className="";
			for(ScoreInfo si:lci){
				if(si.getSumSco()>=90){
					num100++;
				}else if(si.getSumSco()>=80){
					num90++;
				}else if(si.getSumSco()>=70){
					num80++;
				}else if(si.getSumSco()>=60){
					num70++;
				}else{
					num60++;
				}
				className=si.getStudentInfo().getClassInfo().getClassName();
			}
			List<String> liStr=new ArrayList<String>();
			liStr.add(num60+"");
			liStr.add(num70+"");liStr.add(num80+"");liStr.add(num90+"");liStr.add(num100+"");
			es.add(new EchartSeries(className,"line",liStr));
		}
		return es;
	}

	@Override
	public List<ScoreInfo> seacherScoreClassScore(int id, int classId) {
		// TODO Auto-generated method stub
		return eg.seacherScoreClassScore(id, classId);
	}
}
