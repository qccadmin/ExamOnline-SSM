package controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.ExamPlanInfo;
import entity.Page;
import entity.TeacherInfo;
import biz.Exam_manageBiz;

@Controller
@RequestMapping("teacher")
public class Exam_manageAction {
	@Resource 
	private Exam_manageBiz exam_manageBiz;
	
	@RequestMapping("queryExamManage")
	public String queryAll(Page page,Model model,HttpSession session){
		TeacherInfo ti=(TeacherInfo) session.getAttribute("teacher");
		if(ti==null){
			return "/login";
		}
		model.addAttribute("teacherName", ti.getTeacherName());
		List<ExamPlanInfo> examPlans = exam_manageBiz.queryAllByPage(page);
		model.addAttribute("examPlans", examPlans);
		List<TeacherInfo> teachers = exam_manageBiz.queryTeachers();
		model.addAttribute("teachers", teachers);
		model.addAttribute("p", page);
		return "teacher/exam-manage";
	}
	@RequestMapping("queryExamManageByTeacherId")
	public String queryByTeacherId(int teacherId,Model model,HttpSession session){
		TeacherInfo ti=(TeacherInfo) session.getAttribute("teacher");
		if(ti==null){
			return "/login";
		}
		model.addAttribute("teacherName", ti.getTeacherName());
		List<ExamPlanInfo> examPlans= exam_manageBiz.queryByTeacherId(teacherId);
		List<TeacherInfo> teachers = exam_manageBiz.queryTeachers();
		model.addAttribute("teachers", teachers);
		model.addAttribute("examPlans", examPlans);
		return "teacher/exam-manage";
	}
	@RequestMapping("startExam")
	@ResponseBody
	public int startExam(int examplanId){
		return exam_manageBiz.startExam(examplanId);
	}
	
	@RequestMapping("endExam")
	@ResponseBody
	public int endExam(int examplanId){
		return exam_manageBiz.endExam(examplanId);
	}
}
