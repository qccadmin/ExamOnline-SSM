package biz.impl;

import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import util.readTitleExcel;
import biz.SubjectLibraryBiz;
import dao.SubjectLibraryDao;
import entity.CourseInfo;
import entity.PaperInfo;
import entity.TitleInfo;

@Service
public class SubjectLibraryBizImpl implements SubjectLibraryBiz {

	@Resource
	private SubjectLibraryDao sld;
	@Override
	public List<CourseInfo> seachCourseByTeacherID(int id) {
		// TODO Auto-generated method stub
		return sld.seachCourseByTeacherID(id);
	}

	@Override
	public List<PaperInfo> seachPaperByCourseID(int id) {
		// TODO Auto-generated method stub
		return sld.seachPaperByCourseID(id);
	}

	@Override
	public List<PaperInfo> seachPaperNoTit(int id) {
		// TODO Auto-generated method stub
		return sld.seachPaperNoTit(id);
	}

	@Override
	public int insertExcelTit(InputStream in,int paperId) {
		readTitleExcel re=new readTitleExcel();
		List<TitleInfo> list=re.ReadExcel(in);
		int sum=0;
		int num=0;
		for(int i=0;i<list.size();i++){
			PaperInfo pi=new PaperInfo();
			pi.setPaperId(paperId);
			list.get(i).setPaperInfo(pi);
			num=sld.insertExcelTit(list.get(i));
			sum+=num;
		}
		if(sum>0){
			Updatepaperinfo(paperId);
		}
		return num;
	}

	@Override
	public List<TitleInfo> seachPaperByPaperId(int id,int teacherid) {
		
		return sld.seachPaperByPaperId(id, teacherid);
	}

	@Override
	public int updateTitle(TitleInfo ti, int teacherId) {
		// TODO Auto-generated method stub
		return sld.updateTitle(ti, teacherId);
	}

	@Override
	public int deleteTitle(int titid, int teacherId) {
		// TODO Auto-generated method stub
		return sld.deleteTitle(titid, teacherId);
	}

	@Override
	public int Updatepaperinfo(int paperId) {
		// TODO Auto-generated method stub
		return sld.Updatepaperinfo(paperId);
	}

}
