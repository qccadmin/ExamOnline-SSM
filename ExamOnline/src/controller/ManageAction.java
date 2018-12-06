package controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import biz.ClassInfoBiz;
import biz.StudentInfoBiz;
import biz.TeacherInfoBiz;
import entity.ClassInfo;
import entity.Page;
import entity.StudentInfo;
import entity.TeacherInfo;

@Controller
@RequestMapping("manage")
public class ManageAction {
	@Resource
	private TeacherInfoBiz teacherInfoBiz;
	@Resource
	private ClassInfoBiz classInfoBiz;
	@Resource
	private StudentInfoBiz studentInfoBiz;

	public StudentInfoBiz getStudentInfoBiz() {
		return studentInfoBiz;
	}

	public void setStudentInfoBiz(StudentInfoBiz studentInfoBiz) {
		this.studentInfoBiz = studentInfoBiz;
	}

	public ClassInfoBiz getClassInfoBiz() {
		return classInfoBiz;
	}

	public void setClassInfoBiz(ClassInfoBiz classInfoBiz) {
		this.classInfoBiz = classInfoBiz;
	}

	public TeacherInfoBiz getTeacherInfoBiz() {
		return teacherInfoBiz;
	}

	public void setTeacherInfoBiz(TeacherInfoBiz teacherInfoBiz) {
		this.teacherInfoBiz = teacherInfoBiz;
	}

	@RequestMapping("index")
	public String admin(Model model, Page p, HttpServletRequest request) {
		int currentpage = 1;
		List<TeacherInfo> teacherInfoList = null;
		if (request.getParameter("page") != null) {
			teacherInfoList = teacherInfoBiz.queryAll(p);
			currentpage = Integer.parseInt(request.getParameter("page"));
			p.setPage(currentpage);
		} else {
			teacherInfoList = teacherInfoBiz.queryAll(p);
			p.setPage(currentpage);
		}
		model.addAttribute("teacherInfoList", teacherInfoList);
		model.addAttribute("p", p);
		return "manage/index";
	}
	
	@RequestMapping("batchAddTeacher")
	@ResponseBody
	public String batchAddTeacher(@RequestParam("file") MultipartFile file) {
		String filename = file.getOriginalFilename();
		boolean bool = filename.endsWith(".xls");
		if (bool) {
			try {
				InputStream in = file.getInputStream();
				if (in == null) {
					return "文件上传失败！";
				} else {
					if(teacherInfoBiz.batchAddTeacher(in)){
						return "批量添加成功！";
					}else{
						return "批量添加失败！";
					}
				}
			} catch (IOException e) {
				e.printStackTrace();
				return "批量添加失败！";
			}
		} else {
			return "批量添加失败！";
		}
	}
	
	@RequestMapping("mubanTeacherExcel")
	@ResponseBody
	public String downTeacherMUban(HttpServletResponse resp,HttpServletRequest req){
		int downSize=1048;
		try {
			resp.setHeader("Content-disposition", "attachment;filename="+new String("ExcelTeacherRead.xls".getBytes("utf-8"), "ISO_8859_1") );
			//开始下载，try中包含可以省去关闭流步骤
			InputStream in = req.getServletContext().getResourceAsStream("/WEB-INF/"+"ExcelTeacherRead.xls");
			OutputStream out=resp.getOutputStream();
			byte[] buf=new byte[downSize];
			int num;
			while((num=in.read(buf))>0){
				out.write(buf, 0, downSize);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "susses";
	}
	@RequestMapping("classmanage")
	public String getClass(Model model, Page p, HttpServletRequest request) {
		int currentpage = 1;
		List<ClassInfo> classInfoList = null;
		List<TeacherInfo> TeacherInfoList = teacherInfoBiz.queryAllTeacher();
		List<StudentInfo> StudentInfoList = studentInfoBiz.queryEmptyStudent();
		if (request.getParameter("page") != null) {
			classInfoList = classInfoBiz.queryAll(p);
			currentpage = Integer.parseInt(request.getParameter("page"));
			p.setPage(currentpage);
		} else {
			classInfoList = classInfoBiz.queryAll(p);
			p.setPage(currentpage);
		}
		model.addAttribute("StudentInfoList", StudentInfoList);
		model.addAttribute("TeacherInfoList", TeacherInfoList);
		model.addAttribute("classInfoList", classInfoList);
		model.addAttribute("p", p);
		return "manage/classmanage";
	}

	@RequestMapping("studentmanage")
	public String getstudent(Model model, Page p, HttpServletRequest request) {
		int currentpage = 1;
		List<StudentInfo> studentInfoList = null;
		List<ClassInfo> classAll = classInfoBiz.queryAllClass();
		if (request.getParameter("page") != null) {
			studentInfoList = studentInfoBiz.queryAll(p);
			currentpage = Integer.parseInt(request.getParameter("page"));
			p.setPage(currentpage);
			model.addAttribute("choose", 0);
		} else {
			studentInfoList = studentInfoBiz.queryAll(p);
			p.setPage(currentpage);
		}
		model.addAttribute("classAll", classAll);
		model.addAttribute("studentInfoList", studentInfoList);
		model.addAttribute("p", p);
		return "manage/studentmanage";
	}
	
	@RequestMapping("batchAddStudent")
	@ResponseBody
	public String batchAddStudent(@RequestParam("file") MultipartFile file) {
		String filename = file.getOriginalFilename();
		boolean bool = filename.endsWith(".xls");
		if (bool) {
			try {
				InputStream in = file.getInputStream();
				if (in == null) {
					return "文件上传失败！";
				} else {
						if(studentInfoBiz.batchAddStudent(in)){
							return "批量添加成功！";
						}else{
							return "批量添加失败！";
						}
					
				}
			} catch (IOException e) {
				e.printStackTrace();
				return "批量添加失败！";
			}
		} else {
			return "批量添加失败！";
		}
	}

	@RequestMapping("mubanStudentExcel")
	@ResponseBody
	public String downMUban(HttpServletResponse resp,HttpServletRequest req){
		int downSize=1048;
		try {
			resp.setHeader("Content-disposition", "attachment;filename="+new String("ExcelStudentRead.xls".getBytes("utf-8"), "ISO_8859_1") );
			//开始下载，try中包含可以省去关闭流步骤
			InputStream in = req.getServletContext().getResourceAsStream("/WEB-INF/"+"ExcelStudentRead.xls");
			OutputStream out=resp.getOutputStream();
			byte[] buf=new byte[downSize];
			int num;
			while((num=in.read(buf))>0){
				out.write(buf, 0, downSize);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "susses";
	}
	@RequestMapping("toupdateteacher")
	@ResponseBody
	public TeacherInfo toUpdateTeacher(int id) {
		return teacherInfoBiz.queryById(id);
	}

	@RequestMapping("updateteacher")
	@ResponseBody
	public boolean updateTeacher(TeacherInfo teacherInfo) {

		return teacherInfoBiz.update(teacherInfo);

	}

	@RequestMapping("insertteacher")
	@ResponseBody
	public boolean insertTeacher(TeacherInfo teacherInfo) {
		return teacherInfoBiz.insert(teacherInfo);
	}

	@RequestMapping("queryTeacherInfolist")
	public String queryTeacherByName(String queryName, Page p,
			HttpServletRequest request, Model model) {
		List<TeacherInfo> teacherInfoList = teacherInfoBiz.queryByName(
				queryName, p);
		int currentpage = 1;
		if (request.getParameter("page") != null) {
			currentpage = Integer.parseInt(request.getParameter("page"));
		}
		int count = teacherInfoBiz.queryByNameCount(queryName);
		count = count % (p.getRows()) == 0 ? (count / (p.getRows())) : (count
				/ (p.getRows()) + 1);
		if (count == 0) {
			count = 1;
		}
		p.setPage(currentpage);
		p.setPagecount(count);
		model.addAttribute("queryName", queryName);
		model.addAttribute("teacherInfoList", teacherInfoList);
		model.addAttribute("p", p);
		return "manage/index";
	}

	@RequestMapping("deleteteacher")
	@ResponseBody
	public boolean deleteTeacher(int id) {
		return teacherInfoBiz.delete(id);
	}

	@RequestMapping("insertclass")
	@ResponseBody
	public boolean insert(String name, String teacherstr, String studentstr) {
		return classInfoBiz.insertClass(name, teacherstr, studentstr);
	}

	@RequestMapping("queryClassInfolist")
	public String queryClassByName(String queryName, Page p,
			HttpServletRequest request, Model model) {
		List<TeacherInfo> TeacherInfoList = teacherInfoBiz.queryAllTeacher();
		List<StudentInfo> StudentInfoList = studentInfoBiz.queryEmptyStudent();
		List<ClassInfo> classInfoList = classInfoBiz.queryByName(queryName, p);
		int currentpage = 1;
		if (request.getParameter("page") != null) {
			currentpage = Integer.parseInt(request.getParameter("page"));
		}
		int count = classInfoBiz.queryByNameCount(queryName);
		count = count % (p.getRows()) == 0 ? (count / (p.getRows())) : (count
				/ (p.getRows()) + 1);
		if (count == 0) {
			count = 1;
		}
		p.setPage(currentpage);
		p.setPagecount(count);
		model.addAttribute("queryName", queryName);
		model.addAttribute("classInfoList", classInfoList);
		model.addAttribute("TeacherInfoList", TeacherInfoList);
		model.addAttribute("StudentInfoList", StudentInfoList);
		model.addAttribute("p", p);
		return "manage/classmanage";
	}

	@RequestMapping("toupdateclass")
	@ResponseBody
	public int toUpdateClass(int id, Model model) {
		return id;
	}

	@RequestMapping("editclass")
	public String editclass(HttpServletRequest request, Model model) {
		int id = Integer.parseInt(request.getParameter("classId1"));
		ClassInfo classInfo = classInfoBiz.queryAllInfoByClassId(id);
		model.addAttribute("className", classInfo.getClassName());
		model.addAttribute("classId", id);
		model.addAttribute("deleteTeacherList", classInfo.getTeachers());
		model.addAttribute("addTeacherList", classInfo.getNoteachers());
		model.addAttribute("deleteStudentList", classInfo.getStudents());
		model.addAttribute("addStudentList", classInfo.getNostudents());
		return "manage/editclass";
	}

	@RequestMapping("updateclass")
	@ResponseBody
	public boolean updateClass(HttpServletRequest request, int cid,String cname, String deleteteacherstr,
			String addteacherstr, String deletestudentstr, String addstudentstr,Model model) {
		return classInfoBiz.editClass(cid, cname, deleteteacherstr, addteacherstr, deletestudentstr, addstudentstr);
	}

	@RequestMapping("deleteclass")
	@ResponseBody
	public boolean deleteClass(int id) {
		return classInfoBiz.delete(id);
	}

	@RequestMapping("insertstudent")
	@ResponseBody
	public boolean insertstudent(StudentInfo studentInfo) {
		return studentInfoBiz.insert(studentInfo);
	}

	@RequestMapping("queryStudentInfolist")
	public String queryStudentByName(String queryName, int choose, Page p,
			HttpServletRequest request, Model model) {
		List<ClassInfo> classAll = classInfoBiz.queryAllClass();
		List<StudentInfo> studentInfoList = studentInfoBiz.fuzzyQuery(choose,
				queryName, p);
		int currentpage = 1;
		if (request.getParameter("page") != null) {
			currentpage = Integer.parseInt(request.getParameter("page"));
		}
		int count = studentInfoBiz.fuzzyQueryCount(choose, queryName);
		count = count % (p.getRows()) == 0 ? (count / (p.getRows())) : (count
				/ (p.getRows()) + 1);
		if (count == 0) {
			count = 1;
		}
		p.setPage(currentpage);
		p.setPagecount(count);
		model.addAttribute("classAll", classAll);
		model.addAttribute("queryName", queryName);
		model.addAttribute("choose", choose);
		model.addAttribute("studentInfoList", studentInfoList);
		model.addAttribute("p", p);
		return "manage/studentmanage";
	}

	@RequestMapping("toupdatestudent")
	@ResponseBody
	public StudentInfo toUpdateStudent(int id) {
		return studentInfoBiz.queryById(id);
	}

	@RequestMapping("updatestudent")
	@ResponseBody
	public boolean updateStudent(StudentInfo studentInfo) {
		return studentInfoBiz.isUpdateStudent(studentInfo) > 0;
	}

	@RequestMapping("deletestudent")
	@ResponseBody
	public boolean deleteStudent(int id) {
		return studentInfoBiz.isDelStudent(id) > 0;
	}
}
