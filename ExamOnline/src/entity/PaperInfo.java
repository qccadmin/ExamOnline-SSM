package entity;

/**
 * Title PaperInfo
 * 试卷表实体类
 * 
 * @author Administrator
 *
 */
public class PaperInfo {
	private int paperId;//试卷ID
	private String paperName;//试卷名称:包括班级、课程{期中期末考试}
	private CourseInfo courseInfo;//对应课程ID
	public int getPaperId() {
		return paperId;
	}
	public void setPaperId(int paperId) {
		this.paperId = paperId;
	}
	public String getPaperName() {
		return paperName;
	}
	public void setPaperName(String paperName) {
		this.paperName = paperName;
	}
	public CourseInfo getCourseInfo() {
		return courseInfo;
	}
	public void setCourseInfo(CourseInfo courseInfo) {
		this.courseInfo = courseInfo;
	}
	public PaperInfo(int paperId, String paperName, CourseInfo courseInfo) {
		super();
		this.paperId = paperId;
		this.paperName = paperName;
		this.courseInfo = courseInfo;
	}
	public PaperInfo() {
		super();
	}
	@Override
	public String toString() {
		return "PaperInfo [paperId=" + paperId + ", paperName=" + paperName
				+ ", courseInfo=" + courseInfo + "]";
	}
	

}
