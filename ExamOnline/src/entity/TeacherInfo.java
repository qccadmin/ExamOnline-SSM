package entity;

import java.util.Date;

/**
 * Title TeacherInfo
 * 老师实体类
 * 
 * @author Administrator
 *
 */

public class TeacherInfo {
	private int teacherId;
	private String teacherName;
	private String teacherPwd;
	private int isAdmin;
	private String joindate;
	private String email;
	
	@Override
	public String toString() {
		return "TeacherInfo [teacherId=" + teacherId + ", teacherName="
				+ teacherName + ", teacherPwd=" + teacherPwd + ", isAdmin="
				+ isAdmin + ", joindate=" + joindate + ", email=" + email + "]";
	}
	public TeacherInfo(String teacherName, String teacherPwd, int isAdmin,
			String joindate, String email) {
		super();
		this.teacherName = teacherName;
		this.teacherPwd = teacherPwd;
		this.isAdmin = isAdmin;
		this.joindate = joindate;
		this.email = email;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}
	public int getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(int teacherId) {
		this.teacherId = teacherId;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public String getTeacherPwd() {
		return teacherPwd;
	}
	public void setTeacherPwd(String teacherPwd) {
		this.teacherPwd = teacherPwd;
	}
	public TeacherInfo(int teacherId, String teacherPwd) {
		super();
		this.teacherId = teacherId;
		this.teacherPwd = teacherPwd;
	}
	public TeacherInfo() {
		super();
	}
	
}
