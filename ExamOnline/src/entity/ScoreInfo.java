package entity;


/**
 * Title ScoreInfo
 * 成绩表实体类
 * 
 * @author Administrator
 *
 */
public class ScoreInfo {
	private int scoreId;//成绩ID,主键
	private StudentInfo studentInfo;//对应学生ID
	private PaperInfo paperInfo;//对应试卷ID
	private int objectSco;//主观题分数总分
	private int subjectSco;//客观题分数总分
	private int sumSco;//某学生某试卷总分
	public int getScoreId() {
		return scoreId;
	}
	public void setScoreId(int scoreId) {
		this.scoreId = scoreId;
	}
	public int getObjectSco() {
		return objectSco;
	}
	public void setObjectSco(int objectSco) {
		this.objectSco = objectSco;
	}
	public int getSubjectSco() {
		return subjectSco;
	}
	public void setSubjectSco(int subjectSco) {
		this.subjectSco = subjectSco;
	}
	public int getSumSco() {
		return sumSco;
	}
	public void setSumSco(int sumSco) {
		this.sumSco = sumSco;
	}
	public StudentInfo getStudentInfo() {
		return studentInfo;
	}
	public void setStudentInfo(StudentInfo studentInfo) {
		this.studentInfo = studentInfo;
	}
	public PaperInfo getPaperInfo() {
		return paperInfo;
	}
	public void setPaperInfo(PaperInfo paperInfo) {
		this.paperInfo = paperInfo;
	}
	public ScoreInfo(int scoreId, StudentInfo studentInfo, PaperInfo paperInfo,
			int objectSco, int subjectSco, int sumSco) {
		super();
		this.scoreId = scoreId;
		this.studentInfo = studentInfo;
		this.paperInfo = paperInfo;
		this.objectSco = objectSco;
		this.subjectSco = subjectSco;
		this.sumSco = sumSco;
	}
	public ScoreInfo() {
		super();
	}
	@Override
	public String toString() {
		return "ScoreInfo [scoreId=" + scoreId + ", studentInfo=" + studentInfo
				+ ", paperInfo=" + paperInfo + ", objectSco=" + objectSco
				+ ", subjectSco=" + subjectSco + ", sumSco=" + sumSco + "]";
	}
	
	

}
