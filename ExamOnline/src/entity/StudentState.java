package entity;


/**
 * Title StudentInfo
 * 学生某试卷状态表实体类
 * 
 * @author Administrator
 *
 */
public class StudentState {
	private int stateId;//某学生对于某试卷的id（学生一对多）
	private PaperInfo paperInfo;//试卷ID
	private StudentInfo studentInfo;//学生ID
	private int StateFlag;//学生状态（0：未考试，1：正在考试，2：结束考试）
	public int getStateId() {
		return stateId;
	}
	public void setStateId(int stateId) {
		this.stateId = stateId;
	}
	public int getStateFlag() {
		return StateFlag;
	}
	public void setStateFlag(int stateFlag) {
		StateFlag = stateFlag;
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
	public StudentState(int stateId, PaperInfo paperInfo,
			StudentInfo studentInfo, int stateFlag) {
		super();
		this.stateId = stateId;
		this.paperInfo = paperInfo;
		this.studentInfo = studentInfo;
		StateFlag = stateFlag;
	}
	public StudentState() {
		super();
	}
	@Override
	public String toString() {
		return "StudentState [stateId=" + stateId + ", paperInfo=" + paperInfo
				+ ", studentInfo=" + studentInfo + ", StateFlag=" + StateFlag
				+ "]";
	}
	

}
