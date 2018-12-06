package controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import biz.Member_manageBiz;
import entity.ClassInfo;
import entity.ExamByClassMap;
import entity.Page;
import entity.TeacherInfo;

@Controller
@RequestMapping("teacher")
public class Member_manageAction {
	@Resource
	private Member_manageBiz member_manageBiz;
	
	@RequestMapping("queryMemberManage")
	public String queryAll(Page page,Model model,HttpSession session){
		TeacherInfo ti=(TeacherInfo) session.getAttribute("teacher");
		if(ti==null){
			return "/login";
		}
		model.addAttribute("teacherName", ti.getTeacherName());
		List<ExamByClassMap> examPlans = member_manageBiz.queryAll(page);
		List<ClassInfo> classes = member_manageBiz.queryClass();
		model.addAttribute("p", page);
		model.addAttribute("classes", classes);
		model.addAttribute("examPlans", examPlans);
		return "teacher/member-manage";
	}
	
	@RequestMapping("queryMemberById")
	public String queryMemberById(int classId,Model model,HttpSession session){
		TeacherInfo ti=(TeacherInfo) session.getAttribute("teacher");
		if(ti==null){
			return "/login";
		}
		model.addAttribute("teacherName", ti.getTeacherName());
		List<ExamByClassMap> examPlans = member_manageBiz.queryByClassId(classId);
		List<ClassInfo> classes = member_manageBiz.queryClass();
		model.addAttribute("classes", classes);
		model.addAttribute("examPlans", examPlans);
		return "teacher/member-manage";
	}
}
