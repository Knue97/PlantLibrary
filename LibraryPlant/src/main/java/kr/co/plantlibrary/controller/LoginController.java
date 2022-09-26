package kr.co.plantlibrary.controller;


import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.plantlibrary.login.LoginEntity;
import kr.co.plantlibrary.login.LoginService;
import kr.co.plantlibrary.login.NaverLoginBO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/login")
public class LoginController {
	@Setter(onMethod_ = @Autowired )
	private LoginService service;
	
	@Setter(onMethod_ = @Autowired )
	private NaverLoginBO naverLoginBO;
 
	@Autowired
	private MailSendService mailService;
	private String apiResult = null;

	@GetMapping("/login")
	public String loginForm(Model model, HttpSession httpSession) {
		log.info("======================Login Form==================");
		String naverUrl = naverLoginBO.getAuthorization(httpSession);
		
		model.addAttribute("naverUrl", naverUrl);
		return "login/login";
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:/";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam Map<String, String> map, HttpServletRequest request) {
		log.info("=================Login==============");
		
		log.info("map: " + map);
		HttpSession session = request.getSession();
		Map<String, String> sessionMap	= service.login(map);
		log.info(sessionMap);
		session.setAttribute("user", sessionMap);
		
		return "redirect:/";
		
	}
	//이메일 인증
		@GetMapping("/mailCheck")
		@ResponseBody
		public String mailCheck(String email) {
			System.out.println("이메일 인증 요청이 들어옴!");
			System.out.println("이메일 인증 이메일 : " + email);
			return mailService.joinEmail(email);
			
				
		}
	
	@GetMapping("/register")
	public String regisgerForm() {
		log.info("===============Login RegisterForm================");
		
		
		return "login/register";
	}
	
	@PostMapping("/register")
	public String register(LoginEntity loginEntity,String pwC,Model model,HttpServletResponse response) throws Exception {
		log.info("==============Login Register==============");
		
		log.info(loginEntity);
		
		if(loginEntity.getU_password().equals(pwC)&&loginEntity.getU_password() != "") {
			int result = service.register(loginEntity);
			
			log.info("result : " + result);
			
			return "login/regresult";
		}
		else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비밀번호를 다시확인해주세요.');history.go(-1);</script>");
			out.flush();
			out.close();
			return "login/register";
		}
		
		
	}
}
