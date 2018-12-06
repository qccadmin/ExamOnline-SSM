package dao;

import org.apache.ibatis.annotations.Param;

import entity.StudentState;

public interface StudentStateDao {
	// 增加学生考试状态
	public int addState(@Param("paperId") int paperId,
			@Param("studentId") int studentId, @Param("stateFlag") int stateFlag);

	// 查询学生考试状态
	public StudentState queryState(@Param("paperId") int paperId,
			@Param("studentId") int studentId);

	// 更新考试状态
	public int updateState(@Param("paperId") int paperId,
			@Param("studentId") int studentId, @Param("stateFlag") int stateFlag);
}
