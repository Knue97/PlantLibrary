package kr.co.plantlibrary.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@GetMapping("/register")
	public String regisgerForm() {
		log.info("===============Login RegisterForm================");
		
		return "login/register";
	}
	
	@PostMapping("/register")
	public String register(LoginEntity loginEntity,Model model) {
		log.info("==============Login Register==============");
		
		log.info(loginEntity);
		
		int result = service.register(loginEntity);
		
		log.info("result : " + result);
		
		return "login/regresult";
	}
}
