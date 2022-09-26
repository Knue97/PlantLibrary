package kr.co.plantlibrary.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.plantlibrary.login.LoginEntity;
import kr.co.plantlibrary.login.LoginService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private LoginService service;

	@GetMapping(value = "/mypage")
	public String mypage() {
		
		return "user/mypage";
	}
	
	@GetMapping(value = "/mypage_update")
	public String mypage_update() {
		
		return "user/mypage_update";
	}
	
	@PostMapping(value = "/mypage_update")
	public String mypage_update(LoginEntity loginEntity,HttpServletRequest request) {
		log.info("=====update=====");
		
		service.mypage_update(loginEntity);
		log.info(loginEntity);
		
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		
		LoginEntity entity = service.mypage_lookup(loginEntity.getU_id());
		session.setAttribute("user", entity);
		
		
		return "redirect:/user/mypage";
	}
	@GetMapping(value = "/mypage_updatepw")
	public String mypage_updatepw() {
		
		return "user/mypage_updatepw";
	}
	
	@PostMapping(value = "/mypage_updatepw")
	public String mypage_updatepw(LoginEntity loginEntity,HttpServletRequest request,String pwC,HttpServletResponse response) throws Exception {
		log.info("=====update=====");
		
		if(loginEntity.getU_password().equals(pwC)&&loginEntity.getU_password() != "") {
		
		service.mypage_updatepw(loginEntity);
		log.info(loginEntity);
		
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		
		LoginEntity entity = service.mypage_lookup(loginEntity.getU_id());
		session.setAttribute("user", entity);
		
		
		return "redirect:/user/mypage";
		}
		else{
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비밀번호를 다시확인해주세요.');history.go(-1);</script>");
			out.flush();
			out.close();
			return "user/mypage_updatepw";
		}
	}
	
}
