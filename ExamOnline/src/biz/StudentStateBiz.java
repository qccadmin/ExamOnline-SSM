package biz;


public interface StudentStateBiz {
	// 增加学生考试状态
	public int addState(int paperId, int studentId, int studentState);

	// 查询学生考试状态
	public int queryState(int paperId, int studentId);
}
