package controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import biz.ExamResultBiz;
import biz.StudentInfoBiz;
import biz.StudentStateBiz;
import biz.TitleInfoBiz;
import entity.StudentInfo;
import entity.TitleInfo;

@Controller
@RequestMapping("exam")
public class StudentTestAction {

	@Resource
	private TitleInfoBiz tib;
	
	@Resource
	private StudentInfoBiz sib;
	
	
	@Resource
	private StudentStateBiz ssb;
	
	@Autowired
	private ExamResultBiz erb;
	
	@RequestMapping("{paperId}/kaoshi")
	public String getTitleInfoAll(Model m,@PathVariable("paperId")int paperId,HttpSession session){
		Object o = session.getAttribute("student");
		StudentInfo si=(StudentInfo) o;
		boolean b=sib.examState(si.getStudentId(), paperId);
		System.out.println("===="+b);
		if(!b){
			m.addAttribute("exammsg", "您不在考试队列或考试已经结束！");
			return "student/student";
		}
		if(ssb.queryState(paperId, si.getStudentId())==2){
			m.addAttribute("exammsg", "您已参加考试！请查看成绩");
			return "student/student";
		}
		Map<String,List<TitleInfo>> list=tib.getTitleFenLei(tib.getTitleInfoAll(paperId));
		m.addAttribute("list", list);
		m.addAttribute("first", "1");
		m.addAttribute("second", "2");
		m.addAttribute("third", "3");
		m.addAttribute("fourth", "4");
		m.addAttribute("paperId",paperId);
		m.addAttribute("exammsg", "");
		ssb.addState(paperId, si.getStudentId(), 1);
		return "student/StudentTest";
	}
	
	@RequestMapping("score")
	@ResponseBody
	public String hahaahh(@RequestParam("I") int id,
			@RequestParam("a") String[] answer,
			@RequestParam("t") int[] titid,HttpSession session) {
		StudentInfo si=(StudentInfo) session.getAttribute("student");
//		System.out.println(si);
		boolean b=sib.examState(si.getStudentId(), id);
		if(!b){
			return "抱歉，考试已经结束，您未成功参与本次考试！";
		}
		int haha=ssb.queryState(id, si.getStudentId());
		if(haha!=1){
			return "您重复提交题卷！";
		}
		int sum =erb.calScore(id, titid, answer, si.getStudentId());
		ssb.addState(id, si.getStudentId(), 2);
		return "本次考试得分："+sum;
	}
}
