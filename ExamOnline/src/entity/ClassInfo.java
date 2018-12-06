package entity;

import java.util.List;


/**
 * Title ClassInfo
 * 班级实体类
 * 
 * @author Administrator
 *
 */

public class ClassInfo {
	private int classId;//班级ID
	private String className;//班级名称
	private List<StudentInfo> students;//学生集合
	private List<TeacherInfo> teachers;//老师集合
	private List<TeacherInfo> noteachers;//非班级老师
	private List<StudentInfo> nostudents;//非本班级学生集合
	private int classSize;
	
	
	public List<StudentInfo> getNostudents() {
		return nostudents;
	}
	public void setNostudents(List<StudentInfo> nostudents) {
		this.nostudents = nostudents;
	}
	public List<TeacherInfo> getNoteachers() {
		return noteachers;
	}
	public void setNoteachers(List<TeacherInfo> noteachers) {
		this.noteachers = noteachers;
	}
	public List<TeacherInfo> getTeachers() {
		return teachers;
	}
	public void setTeachers(List<TeacherInfo> teachers) {
		this.teachers = teachers;
	}
	public int getClassSize() {
		return classSize;
	}
	public void setClassSize(int classSize) {
		this.classSize = classSize;
	}
	public List<StudentInfo> getStudents() {
		return students;
	}
	public void setStudents(List<StudentInfo> students) {
		this.students = students;
	}
	public int getClassId() {
		return classId;
	}
	public void setClassId(int classId) {
		this.classId = classId;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public ClassInfo(String className) {
		super();
		this.className = className;
	}
	
	
	public ClassInfo(String className, List<StudentInfo> students, int classSize) {
		super();
		this.className = className;
		this.students = students;
		this.classSize = classSize;
	}
	public ClassInfo() {
		super();
	}

	public ClassInfo(int classId) {
		super();
		this.classId = classId;
	}
	@Override
	public String toString() {
		return "ClassInfo [classId=" + classId + ", className=" + className
				+ ", students=" + students + ", teachers=" + teachers
				+ ", noteachers=" + noteachers + ", nostudents=" + nostudents
				+ ", classSize=" + classSize + "]";
	}
	
	
	
}
