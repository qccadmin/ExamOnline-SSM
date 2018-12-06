package controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import biz.ExamGradeBiz;
import entity.EchartSeries;
import entity.TeacherInfo;

@Controller
@RequestMapping("teacher")
public class ExamGradeAction {
	
	@Resource
	private ExamGradeBiz eg;
	
	@RequestMapping("exam-grade")
	private String examGrade(Model m,HttpSession session){
		TeacherInfo ti=(TeacherInfo) session.getAttribute("teacher");
		if(ti==null){
			return "/login";
		}
		m.addAttribute("teacherName", ti.getTeacherName());
		m.addAttribute("list", eg.seacherPaperState());
		return "teacher/exam-grade";
	}

	@RequestMapping("shExSc")
	@ResponseBody
	public List<String> showExamScore(int id){
		return eg.seacherScore(id);
	}
	
	@RequestMapping("shExScZX")
	@ResponseBody
	public List<EchartSeries> showExamScoreZX(int id){
		return eg.seacherScoreClass(id);
	}
}
