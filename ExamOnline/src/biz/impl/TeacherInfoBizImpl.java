package biz.impl;

import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import util.readStudentExcel;
import util.readTeacherExcel;
import dao.TeacherInfoDao;
import entity.Page;
import entity.StudentInfo;
import entity.TeacherInfo;
import biz.TeacherInfoBiz;
@Service
public class TeacherInfoBizImpl implements TeacherInfoBiz{

	@Resource
	private TeacherInfoDao teacherDao;
	
	
	public TeacherInfoDao getTeacherDao() {
		return teacherDao;
	}

	public void setTeacherDao(TeacherInfoDao teacherDao) {
		this.teacherDao = teacherDao;
	}

	@Override
	public boolean insert(TeacherInfo teacherInfo) {
		return teacherDao.insert(teacherInfo);
	}

	@Override
	public List<TeacherInfo> queryAll(Page p) {
		int size = p.getRows();
		int page = p.getPage();
		int count = teacherDao.queryAllCount();
		count = count % size == 0 ? (count / size) : (count / size + 1);
		if((int) count==0){
			return null;
		}
		
		page=page<1?1:page;
		page=page>count?count:page;
		
		p.setPage(page);
		p.setPianyi((page-1)*size);
		p.setPagecount(count);
		p.setShang((page-1)<1?1:(page-1));
		p.setXia((page+1)>count?count:(page+1));
		return teacherDao.queryAll(p);
	}

	@Override
	public List<TeacherInfo> queryByName(String teachername,Page p) {
		int size = p.getRows();
		int page = p.getPage();
		int count = teacherDao.queryByNameCount(teachername);
		count = count % size == 0 ? (count / size) : (count / size + 1);
		if((int) count==0){
			return null;
		}
		
		page=page<1?1:page;
		page=page>count?count:page;
		
		p.setPage(page);
		p.setPianyi((page-1)*size);
		p.setPagecount(count);
		p.setShang((page-1)<1?1:(page-1));
		p.setXia((page+1)>count?count:(page+1));
		return teacherDao.queryByName(teachername,p);
	}

	@Override
	public boolean delete(int teacherId) {
		return teacherDao.delete(teacherId);
	}

	@Override
	public TeacherInfo queryById(int id) {
		return teacherDao.queryById(id);
	}

	@Override
	public boolean update(TeacherInfo teacherInfo) {
		return teacherDao.update(teacherInfo);
	}

	@Override
	public int queryAllCount() {
		return teacherDao.queryAllCount();
	}

	@Override
	public int queryByNameCount(String teachername) {
		return teacherDao.queryByNameCount(teachername);
	}

	@Override
	public List<TeacherInfo> queryAllTeacher() {
		return teacherDao.queryAllTeacher();
	}

	@Override
	public TeacherInfo teacherLogin(TeacherInfo teacher) {
		return teacherDao.teacherLogin(teacher);
	}

	@Override
	public List<TeacherInfo> queryByClassId(int classId) {
		return teacherDao.queryByClassId(classId);
	}

	@Override
	public List<TeacherInfo> queryNoByClassId(int classId) {
		return teacherDao.queryNoByClassId(classId);
	}

	@Override
	public boolean batchAddTeacher(InputStream in) {
		boolean flag = true;
		readTeacherExcel re=new readTeacherExcel();
		List<TeacherInfo> list=re.ReadExcel(in);
		for(int i=0;i<list.size();i++){
			flag = flag&&insert(list.get(i));
		}
		return flag;
	}

}
