package controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import biz.Exam_summaryBiz;
import entity.ExamPlanInfo;
import entity.TeacherInfo;


@Controller
@RequestMapping("teacher")
public class Exam_summaryAction {
	@Resource
	private Exam_summaryBiz exam_summaryBiz;
	
	@RequestMapping("queryExamPlain")
	public String queryAll(Model model,HttpSession session){
		TeacherInfo ti=(TeacherInfo) session.getAttribute("teacher");
		if(ti==null){
			return "/login";
		}
		model.addAttribute("teacherName", ti.getTeacherName());
		List<ExamPlanInfo> summaryList = exam_summaryBiz.queryAll();
		List<TeacherInfo> teachers = exam_summaryBiz.queryTeachers();
		model.addAttribute("teachers", teachers);
		model.addAttribute("summaryList", summaryList);
		return "teacher/exam-summary";
	}
	@RequestMapping("queryExamPlainByTeacherId")
	public String queryByTeacherId(int teacherId,Model model,HttpSession session){
		TeacherInfo ti=(TeacherInfo) session.getAttribute("teacher");
		if(ti==null){
			return "/login";
		}
		model.addAttribute("teacherName", ti.getTeacherName());
		List<ExamPlanInfo> summaryList= exam_summaryBiz.queryByTeacherId(teacherId);
		List<TeacherInfo> teachers = exam_summaryBiz.queryTeachers();
		model.addAttribute("teachers", teachers);
		model.addAttribute("summaryList", summaryList);
		return "teacher/exam-summary";
	}
}
