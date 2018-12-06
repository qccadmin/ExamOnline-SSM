package entity;

/**
 * Title CourseInfo
 * 课程实体类
 * 
 * @author Administrator
 *
 */
public class CourseInfo {
	private int courseId;
	private String courseName;
	private TeacherInfo teacherInfo;
	public TeacherInfo getTeacherInfo() {
		return teacherInfo;
	}
	public void setTeacherInfo(TeacherInfo teacherInfo) {
		this.teacherInfo = teacherInfo;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	
	public CourseInfo(int courseId, String courseName, TeacherInfo teacherInfo) {
		super();
		this.courseId = courseId;
		this.courseName = courseName;
		this.teacherInfo = teacherInfo;
	}
	public CourseInfo() {
		super();
	}
	@Override
	public String toString() {
		return "CourseInfo [courseId=" + courseId + ", courseName="
				+ courseName + ", teacherInfo=" + teacherInfo + "]";
	}
	
}
