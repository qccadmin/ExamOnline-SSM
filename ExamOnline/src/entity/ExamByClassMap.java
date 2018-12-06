package entity;

public class ExamByClassMap {
	private int examplanId;
	private String paperName;
	private int studentId;
	private String studentName;
	private int examState;
	public int getExamplanId() {
		return examplanId;
	}
	public void setExamplanId(int examplanId) {
		this.examplanId = examplanId;
	}
	public String getPaperName() {
		return paperName;
	}
	public void setPaperName(String paperName) {
		this.paperName = paperName;
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
	public int getExamState() {
		return examState;
	}
	public void setExamState(int examState) {
		this.examState = examState;
	}
	public ExamByClassMap(int examplanId, String paperName, int studentId,
			String studentName, int examState) {
		super();
		this.examplanId = examplanId;
		this.paperName = paperName;
		this.studentId = studentId;
		this.studentName = studentName;
		this.examState = examState;
	}
	public ExamByClassMap() {
		super();
	}
	@Override
	public String toString() {
		return "ExamByClassMap [examplanId=" + examplanId + ", paperName="
				+ paperName + ", studentId=" + studentId + ", studentName="
				+ studentName + ", examState=" + examState + "]";
	}
	
}
