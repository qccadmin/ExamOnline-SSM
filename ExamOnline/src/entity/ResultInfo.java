package entity;

/**
 * Title ResultInfo
 * 考生答案表实体类
 * 
 * @author Administrator
 *
 */
public class ResultInfo {
	private int resultId;//考生答案表ID
	private PaperInfo paperInfo;//对应试卷Id
	private StudentInfo studentInfo;//对应学生ID
	private int titleCat;//题目分类
	private TitleInfo titleInfo;//具体题目
	private String studentAnswer;//学生答案
	private int correctState;//是否批改，0未批改
	public int getResultId() {
		return resultId;
	}
	public void setResultId(int resultId) {
		this.resultId = resultId;
	}
	public int getTitleCat() {
		return titleCat;
	}
	public void setTitleCat(int titleCat) {
		this.titleCat = titleCat;
	}
	public String getStudentAnswer() {
		return studentAnswer;
	}
	public void setStudentAnswer(String studentAnswer) {
		this.studentAnswer = studentAnswer;
	}
	public int getCorrectState() {
		return correctState;
	}
	public void setCorrectState(int correctState) {
		this.correctState = correctState;
	}
	public PaperInfo getPaperInfo() {
		return paperInfo;
	}
	public void setPaperInfo(PaperInfo paperInfo) {
		this.paperInfo = paperInfo;
	}
	public StudentInfo getStudentInfo() {
		return studentInfo;
	}
	public void setStudentInfo(StudentInfo studentInfo) {
		this.studentInfo = studentInfo;
	}
	public TitleInfo getTitleInfo() {
		return titleInfo;
	}
	public void setTitleInfo(TitleInfo titleInfo) {
		this.titleInfo = titleInfo;
	}
	public ResultInfo(int resultId, PaperInfo paperInfo,
			StudentInfo studentInfo, int titleCat, TitleInfo titleInfo,
			String studentAnswer, int correctState) {
		super();
		this.resultId = resultId;
		this.paperInfo = paperInfo;
		this.studentInfo = studentInfo;
		this.titleCat = titleCat;
		this.titleInfo = titleInfo;
		this.studentAnswer = studentAnswer;
		this.correctState = correctState;
	}
	public ResultInfo() {
		super();
	}
	@Override
	public String toString() {
		return "ResultInfo [resultId=" + resultId + ", paperInfo=" + paperInfo
				+ ", studentInfo=" + studentInfo + ", titleCat=" + titleCat
				+ ", titleInfo=" + titleInfo + ", studentAnswer="
				+ studentAnswer + ", correctState=" + correctState + "]";
	}
	

}
