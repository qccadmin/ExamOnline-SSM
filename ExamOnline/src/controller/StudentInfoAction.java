package controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import biz.StudentInfoBiz;
import entity.ExamPlanInfo;
import entity.StudentInfo;

@Controller
@RequestMapping("student")
public class StudentInfoAction {
	@Resource
	private StudentInfoBiz studentInfoBiz;
	
	public StudentInfoBiz getStudentInfoBiz() {
		return studentInfoBiz;
	}
	public void setStudentInfoBiz(StudentInfoBiz studentInfoBiz) {
		this.studentInfoBiz = studentInfoBiz;
	}
	
	
	/**
	 * 学生修改密码
	 */
	@RequestMapping("reset/{pwd}/{studentId}")
	public void isResetPwd(
			@PathVariable("pwd") String pwd,
			@PathVariable("studentId") int studentId,
			HttpServletResponse response) throws IOException {
		StudentInfo studentInfo =new StudentInfo();
		studentInfo.setStudentId(studentId);
		studentInfo.setStudentPwd(pwd);
		int row = studentInfoBiz.isResetPwdWithStu(studentInfo);
		if (row > 0) {
			response.getWriter().print("t");
		} else {
			response.getWriter().print("f");			
		}
	
	}
	/**
	 * 学生查看考试安排
	 */
	@RequestMapping("examPlan")
	public String examPlan(HttpSession session,Model model){
		StudentInfo student=(StudentInfo) session.getAttribute("student");
		int studentId =Integer.valueOf(student.getStudentId());
		List<ExamPlanInfo> examPlans=  studentInfoBiz.getExamPlanInfoById(studentId);
		 for (ExamPlanInfo examPlanInfo : examPlans) {
				System.out.println(examPlanInfo);
			}
		model.addAttribute("examPlans",examPlans);
		
		return "student/student";
	}
	

}
