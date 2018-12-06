package biz;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Page;
import entity.TeacherInfo;

public interface TeacherInfoBiz {
	//添加教师
		public boolean insert(TeacherInfo teacherInfo);
		//查询所有教师
		public List<TeacherInfo> queryAll(Page page);
		//利用教职工名模糊查询
		public List<TeacherInfo> queryByName(@Param("teachername")String teachername,Page page);
		//根据教职工号删除
		public boolean delete(int teacherId);
		//更新教师信息
		public boolean update(TeacherInfo teacherInfo);
		//根据教职工号查找
		public TeacherInfo queryById(int id);
		//教师信息总条数
		public int queryAllCount();
		//教职工名模糊查询信息总条数
		public int queryByNameCount(@Param("teachername")String teachername);

		
		public List<TeacherInfo> queryAllTeacher();
		//教师与管理员登录
		public TeacherInfo teacherLogin(TeacherInfo teacher);
		public List<TeacherInfo> queryByClassId(@Param("id")int classId);
		//查找非本班级老师
		public List<TeacherInfo> queryNoByClassId(@Param("id")int classId);
		public boolean batchAddTeacher(InputStream in);
}
