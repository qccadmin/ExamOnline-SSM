package biz.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import util.DownLoadExcel;
import biz.GradeDetailsBiz;
import dao.GradeDetailsDao;
import entity.ScoreInfo;
@Service
public class GradeDetailsBizImpl implements GradeDetailsBiz{
	
	@Resource
	private GradeDetailsDao gdd;
	
	private static DownLoadExcel dle =new DownLoadExcel();
	
	public int SelectALLNum(int id){
		
		return gdd.SelectALLNum(id);
	}
	
	public List<ScoreInfo> seacheList(int id,int pianyi,int row){
		int num=SelectALLNum(id);
		if(row<=1){
			row=5;
		}
		int max=num%row!=0?num/row+1:num/row;
		pianyi=pianyi>max?max:pianyi;
		pianyi=pianyi<=0?1:pianyi;
		return gdd.seacheList(id, (pianyi-1)*row, row);
	}

	@Override
	public int deleteScore(int id) {
		// TODO Auto-generated method stub
		return gdd.deleteScore(id);
	}

	@Override
	public String downloadList(int paperId,int teacherId,String path) {
		// TODO Auto-generated method stub
		List<Map> list= gdd.downloadList(paperId);
		if(list==null){
			return "";
		}
		String[] title = "学号,姓名,班级,总分".split(",");
		String[] column = "studentId,studentName,className,sumSco".split(",");
		String fileName = System.currentTimeMillis()+"-"+teacherId;
		dle.getOutputFile(title, column, list, fileName,path);
		return fileName;
	}
}
