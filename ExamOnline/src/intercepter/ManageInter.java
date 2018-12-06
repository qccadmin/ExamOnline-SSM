package intercepter;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import dao.TeacherInfoDao;
import entity.TeacherInfo;

public class ManageInter extends HandlerInterceptorAdapter{

	@Resource
	private TeacherInfoDao tid;
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		Object o = request.getSession().getAttribute("admin");
//		System.out.println(o);
		TeacherInfo ti=(TeacherInfo) o;
		if(ti!=null){
			return super.preHandle(request, response, handler);
		}else{
			RequestDispatcher dispatcher=request.getRequestDispatcher("/student/login.jsp");
			dispatcher.forward(request, response);
			return false;
		}
	}

	
}
