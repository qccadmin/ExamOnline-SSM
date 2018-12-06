package entity;

/**
 * Title ExamPlanInfo
 * 考试安排实体类
 * 
 * @author Administrator
 *
 */
public class ExamPlanInfo {
	private int examplanId;//考试安排ID
	private PaperInfo paperInfo;//对应试卷
	private ClassInfo classInfo;//对应班级
	private String startTime;//开始时间
	private String overTime;//结束时间
	private int examState;//考试状态（0：未开考 1：已结束 2:正在进行）
	public int getExamplanId() {
		return examplanId;
	}
	public void setExamplanId(int examplanId) {
		this.examplanId = examplanId;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getOverTime() {
		return overTime;
	}
	public void setOverTime(String overTime) {
		this.overTime = overTime;
	}
	public int getExamState() {
		return examState;
	}
	public void setExamState(int examState) {
		this.examState = examState;
	}
	public PaperInfo getPaperInfo() {
		return paperInfo;
	}
	public void setPaperInfo(PaperInfo paperInfo) {
		this.paperInfo = paperInfo;
	}
	public ClassInfo getClassInfo() {
		return classInfo;
	}
	public void setClassInfo(ClassInfo classInfo) {
		this.classInfo = classInfo;
	}
	public ExamPlanInfo(int examplanId, PaperInfo paperInfo,
			ClassInfo classInfo, String startTime, String overTime,
			int examState) {
		super();
		this.examplanId = examplanId;
		this.paperInfo = paperInfo;
		this.classInfo = classInfo;
		this.startTime = startTime;
		this.overTime = overTime;
		this.examState = examState;
	}
	public ExamPlanInfo() {
		super();
	}
	@Override
	public String toString() {
		return "ExamPlanInfo [examplanId=" + examplanId + ", paperInfo="
				+ paperInfo + ", classInfo=" + classInfo + ", startTime="
				+ startTime + ", overTime=" + overTime + ", examState="
				+ examState + "]";
	}
	

}
