package intercepter;


import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class LoginInter extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		Object user = request.getSession().getAttribute("user");
		if (user!=null) {
			return super.preHandle(request, response, handler);
		} else {
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/student/login.jsp");
			dispatcher.forward(request, response);
			return false;
		}
	}
}
