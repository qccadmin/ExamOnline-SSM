package controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.ExamPlanInfo;
import entity.ScoreInfo;
import entity.StudentInfo;
import biz.ExamResultBiz;


@Controller("student")
public class StudentHistoryAction {
	@Resource
	ExamResultBiz examResultBiz;

	public ExamResultBiz getExamResultBiz() {
		return examResultBiz;
	}

	public void setExamResultBiz(ExamResultBiz examResultBiz) {
		this.examResultBiz = examResultBiz;
	}
	
	/**
	 * 学生查看考试安排
	 */
	@RequestMapping("history")
	@ResponseBody
	public List<ScoreInfo> examPlan(HttpSession session,Model model){
		StudentInfo student=(StudentInfo) session.getAttribute("student");
		int studentId =Integer.valueOf(student.getStudentId());
		List<ScoreInfo> scoreInfoList = examResultBiz.getScoreInfoById(studentId);
		 for (ScoreInfo scoreInfo : scoreInfoList) {
				System.out.println(scoreInfo);
			}
		model.addAttribute("scoreInfoList",scoreInfoList);
		return scoreInfoList;
	}

}
