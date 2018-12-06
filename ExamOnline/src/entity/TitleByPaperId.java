package entity;

public class TitleByPaperId {
	private String paperName;    //试卷名字
	private int titleId;         //题目ID
	private String titleStem;    //题目名字
	private int titleCat;        //题目类型
	private String answerRight;  //正确答案
	public String getPaperName() {
		return paperName;
	}
	public void setPaperName(String paperName) {
		this.paperName = paperName;
	}
	public int getTitleId() {
		return titleId;
	}
	public void setTitleId(int titleId) {
		this.titleId = titleId;
	}
	public String getTitleStem() {
		return titleStem;
	}
	public void setTitleStem(String titleStem) {
		this.titleStem = titleStem;
	}
	public int getTitleCat() {
		return titleCat;
	}
	public void setTitleCat(int titleCat) {
		this.titleCat = titleCat;
	}
	public String getAnswerRight() {
		return answerRight;
	}
	public void setAnswerRight(String answerRight) {
		this.answerRight = answerRight;
	}
	public TitleByPaperId(String paperName, int titleId, String titleStem,
			int titleCat, String answerRight) {
		this.paperName = paperName;
		this.titleId = titleId;
		this.titleStem = titleStem;
		this.titleCat = titleCat;
		this.answerRight = answerRight;
	}
	public TitleByPaperId() {}
	@Override
	public String toString() {
		return "TitleByPaperId [paperName=" + paperName + ", titleId="
				+ titleId + ", titleStem=" + titleStem + ", titleCat="
				+ titleCat + ", answerRight=" + answerRight + "]";
	}
	
}
