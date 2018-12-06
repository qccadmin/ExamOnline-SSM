package biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.ClassInfo;
import entity.Page;

public interface ClassInfoBiz {
	//添加班级
		public int insert(ClassInfo classInfo);
		//查询全部班级
		public List<ClassInfo> queryAllClass();
		public List<ClassInfo> queryAll(Page p);
		//根据名字模糊查询
		public List<ClassInfo> queryByName(@Param("classname")String classname,@Param("page")Page page);
		//更新班级
		public boolean update(ClassInfo classInfo);
		//删除班级
		public boolean delete(int classId);
		//查询班级人数
		public int queryStudentCountsByClassId(int classId);
		//根据id查询班级
		public ClassInfo queryById(int classId);
		//全部班级信息总条数
		public int queryAllCount();
		//查询名字模糊查询班级信息条数
		public int queryByNameCount(@Param("classname")String classname);
		
		public boolean insertTC(@Param("classId")int classId,@Param("teacherId")int teacherId);
		
		public boolean insertClass(String name,String teacherstr,String studentstr);
		//
		public ClassInfo queryAllInfoByClassId(int classId); 
		
		public boolean editClass(int cid,String cname, String deleteteacherstr,
				String addteacherstr, String deletestudentstr, String addstudentstr);
		public boolean deleteTC(@Param("classId")int classId,@Param("teacherId")int teacherId);
}
