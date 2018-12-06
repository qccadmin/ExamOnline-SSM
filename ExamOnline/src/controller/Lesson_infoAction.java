package controller;

import java.awt.print.Paper;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import biz.Lesson_infoBiz;
import entity.ClassInfo;
import entity.CourseInfo;
import entity.ExamPlanInfo;
import entity.Page;
import entity.PaperInfo;
import entity.TeacherInfo;

@Controller
@RequestMapping("teacher")
public class Lesson_infoAction {
	@Resource
	private Lesson_infoBiz lesson_infoBiz;
	
	@RequestMapping("searchExamPlan")
	public String searchAll(Page page,Model model,HttpSession session) {
		TeacherInfo ti=(TeacherInfo) session.getAttribute("teacher");
		if(ti==null){
			return "/login";
		}
		model.addAttribute("teacherName", ti.getTeacherName());
		//List<ExamPlanInfo> examPlans = lesson_infoBiz.queryAll();
		List<ExamPlanInfo> examPlans = lesson_infoBiz.queryAllByPage(page);
		List<CourseInfo> courses = lesson_infoBiz.queryCourse(ti.getTeacherId());
		List<Paper> papers = lesson_infoBiz.queryPaper(ti.getTeacherId());
		List<ClassInfo> classes = lesson_infoBiz.queryClass(ti.getTeacherId());
		model.addAttribute("p", page);
		model.addAttribute("classes", classes);
		model.addAttribute("courses", courses);
		model.addAttribute("examPlans", examPlans);
		model.addAttribute("papers", papers);
		return "teacher/lesson-info";
	}
	
	@RequestMapping("addPaperInfo")
	@ResponseBody
	public int addPaperInfo(PaperInfo paperInfo,Model model){
		int result = lesson_infoBiz.addExamPaper(paperInfo);
		return result; 
	}
	@RequestMapping("addExamPlan")
	@ResponseBody
	public int addExamPlan(int paperId,String tempString,Model model){
		return lesson_infoBiz.addExamPlan(paperId, tempString);
	}	
	
	@RequestMapping("deleteExamPlan")
	@ResponseBody
	public int deletePlan(int examplanId){
		return lesson_infoBiz.deletePlan(examplanId);
	}
}
