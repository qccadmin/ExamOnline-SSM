package biz.impl;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import util.readStudentExcel;
import util.readTitleExcel;
import dao.ClassInfoDao;
import dao.StudentInfoDao;
import biz.StudentInfoBiz;
import entity.ClassInfo;
import entity.ExamPlanInfo;
import entity.Page;
import entity.PaperInfo;
import entity.StudentInfo;
import entity.TitleInfo;


@Service
public class StudentInfoBizImpl implements StudentInfoBiz {
	@Resource
	private StudentInfoDao studentInfoDao;
	@Resource
	private ClassInfoDao classInfoDao;
	

	public ClassInfoDao getClassInfoDao() {
		return classInfoDao;
	}

	public void setClassInfoDao(ClassInfoDao classInfoDao) {
		this.classInfoDao = classInfoDao;
	}

	public StudentInfoDao getStudentInfoDao() {
		return studentInfoDao;
	}

	public void setStudentInfoDao(StudentInfoDao studentInfoDao) {
		this.studentInfoDao = studentInfoDao;
	}
	

	@Override
	public List<StudentInfo> getStudents(Map<String, Object> map) {
		return studentInfoDao.getStudents(map);
	}

	@Override
	public StudentInfo getStudentById(int studentId) {
		return studentInfoDao.getStudentById(studentId);
	}

	@Override
	public int isUpdateStudent(StudentInfo student) {
		return studentInfoDao.isUpdateStudent(student);
	}

	@Override
	public int isDelStudent(int studentId) {
		
		return studentInfoDao.isDelStudent(studentId);
	}

	@Override
	public int isAddStudent(StudentInfo student) {
		
		return studentInfoDao.isAddStudent(student);
	}

	@Override
	public int getStudentTotal() {
		return studentInfoDao.getStudentTotal();
	}

	@Override
	public List<StudentInfo> getStudentsByClassId(int classId) {
		return studentInfoDao.getStudentsByClassId(classId);
	}

	@Override
	public int isResetPwdWithStu(StudentInfo studentInfo) {
		return studentInfoDao.isResetPwdWithStu(studentInfo);
	}

	@Override
	public List<StudentInfo> queryAll(Page p) {
		int size = p.getRows();
		int page = p.getPage();
		int count = studentInfoDao.getStudentTotal();
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
		List<StudentInfo> list = studentInfoDao.queryAll(p);
		for (StudentInfo studentInfo : list) {
			if(studentInfo.getClassInfo()!=null){	
				studentInfo.getClassInfo().setClassName(classInfoDao.queryById(studentInfo.getClassInfo().getClassId()).getClassName());
			}
		}
		return list;
	}

	@Override
	public boolean insert(StudentInfo studentInfo) {
		return studentInfoDao.insert(studentInfo);
	}

	@Override
	public List<StudentInfo> fuzzyQuery(int classId, String Name, Page p) {
		int size = p.getRows();
		int page = p.getPage();
		int count = studentInfoDao.fuzzyQueryCount(classId, Name);
		count = count % size == 0 ? (count / size) : (count / size + 1);
		if(count ==0){
			return null;
		}
		page=page<1?1:page;
		page=page>count?count:page;
		p.setPage(page);
		p.setPianyi((page-1)*size);
		p.setPagecount(count);
		p.setShang((page-1)<1?1:(page-1));
		p.setXia((page+1)>count?count:(page+1));
		List<StudentInfo> list = studentInfoDao.fuzzyQuery(classId, Name, p);
		for (StudentInfo studentInfo : list) {
			if(studentInfo.getClassInfo()!=null){
				studentInfo.getClassInfo().setClassName(classInfoDao.queryById(studentInfo.getClassInfo().getClassId()).getClassName());				
			}
		}
		return list;
	}

	@Override
	public int fuzzyQueryCount(int classId, String Name) {
		return studentInfoDao.fuzzyQueryCount(classId, Name);
	}

	@Override
	public StudentInfo queryById(int studentId) {
		StudentInfo studentInfo = studentInfoDao.queryById(studentId);
		if(studentInfo.getClassInfo()!=null){
			studentInfo.getClassInfo().setClassName(classInfoDao.queryById(studentInfo.getClassInfo().getClassId()).getClassName());				
		}
		return studentInfo;
	}


	@Override
	public StudentInfo studentLogin(StudentInfo student) {
		return studentInfoDao.studentLogin(student);
	}

	@Override
	public StudentInfo checkLogin(int studentid, String studentpwd) {
		//根据用户名实例化用户对象
        StudentInfo student = studentInfoDao.getStudentById(studentid);
        if (student != null && student.getStudentPwd().equals(studentpwd)) {
            return student;
        }
        return null;
	}

	@Override
	public List<ExamPlanInfo> getExamPlanInfoById(int studentId) {
		return studentInfoDao.getExamPlanInfoById(studentId);
	}

	@Override
	public List<StudentInfo> queryAllStudent() {
		// TODO Auto-generated method stub
		return studentInfoDao.queryAllStudent();
	}

	@Override
	public List<StudentInfo> queryEmptyStudent() {
		// TODO Auto-generated method stub
		return studentInfoDao.queryEmptyStudent();
	}

	@Override
	public boolean editClass(int teacherId) {
		// TODO Auto-generated method stub
		return studentInfoDao.editClass(teacherId);
	}

	@Override
	public boolean examState(int studentId, int paperId) {
		ExamPlanInfo epi=studentInfoDao.examState(studentId, paperId);
		if(epi==null){
			return false;
		}else if(1==epi.getExamState()){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean batchAddStudent(InputStream in) {
		boolean flag = true;
		readStudentExcel re=new readStudentExcel();
		List<StudentInfo> list=re.ReadExcel(in);
		for(int i=0;i<list.size();i++){
			flag = flag&&insert(list.get(i));
		}
		return flag;
	}
}