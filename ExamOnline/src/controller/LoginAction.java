package controller;




import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import biz.StudentInfoBiz;
import biz.TeacherInfoBiz;
import entity.StudentInfo;
import entity.TeacherInfo;
import entity.User;

@Controller
@RequestMapping("login")
public class LoginAction {
	@Resource
	private StudentInfoBiz  sbiz;
	public StudentInfoBiz getSbiz() {
		return sbiz;
	}
	public void setSbiz(StudentInfoBiz sbiz) {
		this.sbiz = sbiz;
	}
	@Resource
	private TeacherInfoBiz tbiz;
	@RequestMapping("showlogin")
	public String getlogin(){		
		return "student/login";
	}
	@RequestMapping("studentlogin")
	@ResponseBody
	public StudentInfo studentLogin(User s,HttpSession session,HttpServletRequest request,HttpServletResponse response,Model model){
		StudentInfo student = new StudentInfo(s.getUid(),s.getUpwd());
		StudentInfo stu = sbiz.studentLogin(student);
		session.setAttribute("user", s);
		System.out.println("stu:"+stu);
		if(stu!=null){
			remember(request, response, s);
			stu.setStudentPwd(s.getUpwd());
			session.setAttribute("student", stu);
			return stu;
		}
		model.addAttribute("msg", "登录失败，请重新登录");
		return null;
	}
	@RequestMapping("teacherlogin")
	@ResponseBody
	public TeacherInfo teacherLogin(User t,Model model,HttpSession session,HttpServletRequest request,HttpServletResponse response){
//		System.out.println("教师信息:"+t);
		TeacherInfo teacher = new TeacherInfo(t.getUid(),t.getUpwd());
		session.setAttribute("user", t);
		TeacherInfo teach = tbiz.teacherLogin(teacher);	
		if(teach!=null){
			int flag = teach.getIsAdmin();
			remember(request, response, t);
			if(flag == 1){
				System.out.println("非教师");
				return null;
			}
			session.setAttribute("teacher", teach);
			return teach;
		}
		model.addAttribute("msg", "登录失败，请重新登录");
		return null;
	}
	@RequestMapping("adminlogin")
	@ResponseBody
	public TeacherInfo adminLogin(User t,Model model,HttpSession session,HttpServletRequest request,HttpServletResponse response){
		TeacherInfo teacher = new TeacherInfo(t.getUid(),t.getUpwd());
		TeacherInfo teach = tbiz.teacherLogin(teacher);
		session.setAttribute("user", t);
	//	System.out.println("管理员信息:"+teach);
		if(teach!=null){
			int flag = teach.getIsAdmin();
			remember(request, response, t);
			if(flag == 0){
				System.out.println("非管理员");
				return null;
			}
			session.setAttribute("admin", teach);
			return teach;
		}
		model.addAttribute("msg", "登录失败，请重新登录");
		return null;
	}
	@RequestMapping("exit")
	public String exit(HttpSession session){
		session.invalidate();
		return "index";
	}

	
	//记住用户名、密码
	public void remember(HttpServletRequest request,HttpServletResponse response,User u){ 
		String remFlag = request.getParameter("remFlag");
		String message = u.getUid()+","+u.getUpwd();	
		if("1".equals(remFlag)){//"1"表示用户勾选记住密码,"0"表示用户未勾选记住密码
			message = message+",1";
            Cookie userCookie=new Cookie("message",message); 
            userCookie.setMaxAge(24*60*60);
            userCookie.setPath("/");
            response.addCookie(userCookie);
        }else{
        //	System.out.println("未记住密码");
        	Cookie userCookie=new Cookie("message",message); 
            userCookie.setMaxAge(0);
            userCookie.setPath("/");
            response.addCookie(userCookie);
        }
	}
}
