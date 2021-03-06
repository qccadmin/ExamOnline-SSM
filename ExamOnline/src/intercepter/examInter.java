package intercepter;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import dao.StudentInfoDao;
import entity.StudentInfo;

public class examInter extends HandlerInterceptorAdapter{

	@Resource
	private StudentInfoDao sid;
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		Object o = request.getSession().getAttribute("student");
		StudentInfo si=(StudentInfo) o;
		if(si!=null){
			return super.preHandle(request, response, handler);
		}else{
			RequestDispatcher dispatcher=request.getRequestDispatcher("/student/login.jsp");
			dispatcher.forward(request, response);
			return false;
		}
	}

	
}
