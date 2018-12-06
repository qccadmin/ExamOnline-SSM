package entity;


/**
 * Title StudentInfo
 * 学生实体类
 * 
 * @author Administrator
 *
 */
public class StudentInfo {
	private int studentId;//学生账号
	private String studentName;//学生姓名
	private String studentPwd;//密码
	private ClassInfo classInfo;//对应班级ID
	private String birthday;
	private String school;
	private String address;
	private String phone;
	
	
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getStudentPwd() {
		return studentPwd;
	}
	public void setStudentPwd(String studentPwd) {
		this.studentPwd = studentPwd;
	}
	public ClassInfo getClassInfo() {
		return classInfo;
	}
	public void setClassInfo(ClassInfo classInfo) {
		this.classInfo = classInfo;
	}
	public StudentInfo(int studentId, String studentName, String studentPwd,
			ClassInfo classInfo) {
		super();
		this.studentId = studentId;
		this.studentName = studentName;
		this.studentPwd = studentPwd;
		this.classInfo = classInfo;
	}
	public StudentInfo(String studentName, String studentPwd,
			ClassInfo classInfo, String birthday, String school,
			String address, String phone) {
		super();
		this.studentName = studentName;
		this.studentPwd = studentPwd;
		this.classInfo = classInfo;
		this.birthday = birthday;
		this.school = school;
		this.address = address;
		this.phone = phone;
	}
	public StudentInfo() {
		super();
	}
	public StudentInfo(int studentId, String studentPwd) {
		super();
		this.studentId = studentId;
		this.studentPwd = studentPwd;
	}
	@Override
	public String toString() {
		return "StudentInfo [studentId=" + studentId + ", studentName="
				+ studentName + ", studentPwd=" + studentPwd + ", classInfo="
				+ classInfo + ", birthday=" + birthday + ", school=" + school
				+ ", address=" + address + ", phone=" + phone + "]";
	}
	

}
