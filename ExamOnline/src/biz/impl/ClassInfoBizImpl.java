package biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.ClassInfoDao;
import entity.ClassInfo;
import entity.Page;
import entity.StudentInfo;
import entity.TeacherInfo;
import biz.ClassInfoBiz;
import biz.StudentInfoBiz;
import biz.TeacherInfoBiz;
@Service
public class ClassInfoBizImpl implements ClassInfoBiz{

	@Resource
	private ClassInfoDao cid;
	
	@Resource
	private TeacherInfoBiz teacherInfoBiz;
	@Resource
	private StudentInfoBiz studentInfoBiz;
	
	public ClassInfoDao getCid() {
		return cid;
	}

	public void setCid(ClassInfoDao cid) {
		this.cid = cid;
	}

	@Override
	public int insert(ClassInfo classInfo) {
		return cid.insert(classInfo);
	}

	@Override
	public List<ClassInfo> queryAll(Page p) {
		int size = p.getRows();
		int page = p.getPage();
		int count = cid.queryAllCount();
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
		List<ClassInfo> list = cid.queryAll(p);
		for (ClassInfo classInfo : list) {
			classInfo.setClassSize(cid.queryStudentCountsByClassId(classInfo.getClassId()));
		}
		return list;
	}

	@Override
	public List<ClassInfo> queryByName(String classname,Page p) {
		int size = p.getRows();
		int page = p.getPage();
		int count = cid.queryByNameCount(classname);
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
		List<ClassInfo> list = cid.queryByName(classname, p);
		for (ClassInfo classInfo : list) {
			classInfo.setClassSize(cid.queryStudentCountsByClassId(classInfo.getClassId()));
		}
		return list;
	}

	@Override
	public boolean update(ClassInfo classInfo) {
		return cid.update(classInfo);
	}

	@Override
	public boolean delete(int classId) {
		return cid.delete(classId);
	}

	@Override
	public int queryStudentCountsByClassId(int classId) {
		return cid.queryStudentCountsByClassId(classId);
	}

	@Override
	public ClassInfo queryById(int classId) {
		return cid.queryById(classId);
	}

	@Override
	public int queryAllCount() {
		return cid.queryAllCount();
	}

	@Override
	public int queryByNameCount(String classname) {
		return cid.queryByNameCount(classname);
	}

	@Override
	public List<ClassInfo> queryAllClass() {
		return cid.queryAllClass();
	}

	@Override
	public boolean insertTC(int classId, int teacherId) {
		
		return cid.insertTC(classId, teacherId);
	}

	@Override
	public boolean insertClass(String name, String teacherstr, String studentstr) {
		String[] teacherlist = teacherstr.split(",");
		teacherlist[0] = null;
		String[] studentlist = studentstr.split(",");
		studentlist[0] = null;
		boolean teacherFlag = false;
		boolean classFlag = false;
		boolean studentFlag = false;
		ClassInfo classInfo= new ClassInfo(name);
		classFlag = insert(classInfo)>0;
		int classid = classInfo.getClassId();
		if(teacherlist.length >1){
		for (String string : teacherlist) {
			if(string != null){
				int teacherId = Integer.parseInt(string);
				teacherFlag = insertTC(classid, teacherId);
			}
		}
		}else{
			teacherFlag = true;
		}
		if(teacherlist.length >1){
		for (String string1 : studentlist) {
			if(string1 != null){
				int studentId = Integer.parseInt(string1);

				StudentInfo studentInfo= studentInfoBiz.queryById(studentId);

				ClassInfo classinfo = new ClassInfo(classid);

				studentInfo.setClassInfo(classinfo);
				studentFlag = studentInfoBiz.isUpdateStudent(studentInfo)>0;
			}
		}
		}else{
			studentFlag=true;
		}
		return (teacherFlag&&classFlag&&studentFlag);
	}

	@Override
	public ClassInfo queryAllInfoByClassId(int classId) {
		ClassInfo classInfo = new ClassInfo();
		List<TeacherInfo> teacherList = teacherInfoBiz.queryByClassId(classId);
		List<StudentInfo> studentList = studentInfoBiz.getStudentsByClassId(classId);
		List<TeacherInfo> noTeacherList = teacherInfoBiz.queryNoByClassId(classId);
		List<StudentInfo> noStudentList = studentInfoBiz.queryEmptyStudent();
		ClassInfo classInfo1 = queryById(classId);
		classInfo.setStudents(studentList);
		classInfo.setTeachers(teacherList);
		classInfo.setNoteachers(noTeacherList);
		classInfo.setNostudents(noStudentList);
		classInfo.setClassId(classId);
		classInfo.setClassName(classInfo1.getClassName());
		return classInfo;
	}

	@Override
	public boolean editClass(int cid, String cname, String deleteteacherstr,
			String addteacherstr, String deletestudentstr, String addstudentstr) {
			ClassInfo classInfo = new ClassInfo();
			classInfo.setClassId(cid);
			classInfo.setClassName(cname);
			boolean editclassFlag = update(classInfo);
			boolean deleteteacherFlag = false;
			boolean addteacherFlag = false;
			boolean deletestudentFlag = false;
			boolean addstudentFlag = false;
			String[] deleteteacher = deleteteacherstr.split(",");
			deleteteacher[0] = null;
			String[] addteacher = addteacherstr.split(",");
			addteacher[0] = null;
			String[] deletestudent = deletestudentstr.split(",");
			deletestudent[0] = null;
			String[] addstudent = addstudentstr.split(",");
			addstudent[0] = null;
			if(deleteteacher.length >1){
				for (String string : deleteteacher) {
					if(string!=null){
						int teacherId = Integer.parseInt(string);
						deleteteacherFlag =deleteTC(cid,teacherId);
					}
				}
			}else{
				deleteteacherFlag = true;
			}
			if(addteacher.length >1){
				for (String string : addteacher) {
					if(string!=null){
						int teacherId = Integer.parseInt(string);
						addteacherFlag =insertTC(cid,teacherId);
					}
				}
			}else{
				addteacherFlag = true;
			}
			if(deletestudent.length >1){
				for (String string : deletestudent) {
					if(string!=null){
						int studentId = Integer.parseInt(string);
						deletestudentFlag = studentInfoBiz.editClass(studentId);
					}
				}
			}else{
				deletestudentFlag = true;
			}
			if(addstudent.length >1){
				for (String string : addstudent) {
					if(string!=null){
						int studentId = Integer.parseInt(string);
						StudentInfo studentInfo= studentInfoBiz.queryById(studentId);
						ClassInfo classinfo = new ClassInfo(cid);
						studentInfo.setClassInfo(classinfo);
						addstudentFlag = studentInfoBiz.isUpdateStudent(studentInfo)>0;
					}
				}
			}else{
				addstudentFlag = true;
			}
			
		return (editclassFlag&&deleteteacherFlag&&addteacherFlag&&deletestudentFlag&&addstudentFlag);
	}

	@Override
	public boolean deleteTC(int classId, int teacherId) {

		return cid.deleteTC(classId, teacherId);
	}

}
