package entity;


/**
 * Title TitleInfo
 * 题目实体类
 * 
 * @author Administrator
 *
 */
public class TitleInfo {
	private int titleId;//题目id
	private int titleCat;//题目分类
	private String titleStem;//题干
	private String optionA;//选项
	private String optionB;
	private String optionC;
	private String optionD;
	private String answerRight;//正确答案
	private int answerScore;//题目分数
	private String analyze;//解析
	private PaperInfo paperInfo;//所属试卷
	
	
	public String getAnalyze() {
		return analyze;
	}
	public void setAnalyze(String analyze) {
		this.analyze = analyze;
	}
	public int getTitleId() {
		return titleId;
	}
	public void setTitleId(int titleId) {
		this.titleId = titleId;
	}
	public int getTitleCat() {
		return titleCat;
	}
	public void setTitleCat(int titleCat) {
		this.titleCat = titleCat;
	}
	public String getTitleStem() {
		return titleStem;
	}
	public void setTitleStem(String titleStem) {
		this.titleStem = titleStem;
	}
	public String getOptionA() {
		return optionA;
	}
	public void setOptionA(String optionA) {
		this.optionA = optionA;
	}
	public String getOptionB() {
		return optionB;
	}
	public void setOptionB(String optionB) {
		this.optionB = optionB;
	}
	public String getOptionC() {
		return optionC;
	}
	public void setOptionC(String optionC) {
		this.optionC = optionC;
	}
	public String getOptionD() {
		return optionD;
	}
	public void setOptionD(String optionD) {
		this.optionD = optionD;
	}
	public String getAnswerRight() {
		return answerRight;
	}
	public void setAnswerRight(String answerRight) {
		this.answerRight = answerRight;
	}
	public int getAnswerScore() {
		return answerScore;
	}
	public void setAnswerScore(int answerScore) {
		this.answerScore = answerScore;
	}
	public PaperInfo getPaperInfo() {
		return paperInfo;
	}
	public void setPaperInfo(PaperInfo paperInfo) {
		this.paperInfo = paperInfo;
	}
	public TitleInfo(int titleId, int titleCat, String titleStem,
			String optionA, String optionB, String optionC, String optionD,
			String answerRight, int answerScore, String analyze,
			PaperInfo paperInfo) {
		super();
		this.titleId = titleId;
		this.titleCat = titleCat;
		this.titleStem = titleStem;
		this.optionA = optionA;
		this.optionB = optionB;
		this.optionC = optionC;
		this.optionD = optionD;
		this.answerRight = answerRight;
		this.answerScore = answerScore;
		this.analyze = analyze;
		this.paperInfo = paperInfo;
	}
	public TitleInfo() {
		super();
	}
	@Override
	public String toString() {
		return "TitleInfo [titleId=" + titleId + ", titleCat=" + titleCat
				+ ", titleStem=" + titleStem + ", optionA=" + optionA
				+ ", optionB=" + optionB + ", optionC=" + optionC
				+ ", optionD=" + optionD + ", answerRight=" + answerRight
				+ ", answerScore=" + answerScore + ", analyze=" + analyze
				+ ", paperInfo=" + paperInfo + "]";
	}
	
	

}
