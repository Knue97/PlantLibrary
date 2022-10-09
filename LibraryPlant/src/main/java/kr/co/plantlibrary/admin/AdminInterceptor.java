package kr.co.plantlibrary.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		Map<String, String> map = (Map<String, String>)session.getAttribute("user");
		
		String u_state = null;
		if(map != null) {
			u_state = String.valueOf(map.get("u_state"));
		}
		
		if(map == null) { // 로그인 안되어있는 경우
			response.sendRedirect(request.getContextPath() + "/login/login");
			return false;
		} else if(Integer.parseInt(u_state) != 99 ) { // 로그인했지만 관리자가 아닌 경우
			response.sendRedirect(request.getContextPath() + "/");
			return false;
		}else
			return true;
		
		
	}

}
