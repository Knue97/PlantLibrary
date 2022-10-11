package kr.co.plantlibrary.controller;


import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;

import kr.co.plantlibrary.login.KakaoLoginBO;
import kr.co.plantlibrary.login.LoginDAO;
import kr.co.plantlibrary.login.LoginEntity;
import kr.co.plantlibrary.login.LoginService;
import kr.co.plantlibrary.login.NaverLoginBO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/login")
public class LoginController {
	
	@Setter(onMethod_ = @Autowired)
	private LoginService service;
	
	@Setter(onMethod_ = @Autowired )
	private NaverLoginBO naverLoginBO;
 
	@Autowired
	private MailSendService mailService;
	
	@Setter(onMethod_ = @Autowired )
	private KakaoLoginBO kakaoLoginBO;
	
	
	private String apiResult = null;

	@GetMapping("/login")
	public String loginForm(Model model, HttpSession httpSession) {
		log.info("======================Login Form==================");
		String naverUrl = naverLoginBO.getAuthorization(httpSession);
		String kakaoUrl = kakaoLoginBO.getAutorizationUrl(httpSession);
		model.addAttribute("naverUrl", naverUrl);
		model.addAttribute("kakaoUrl", kakaoUrl);
		return "login/login";
	}
	
	//네이버 로그인 성공시  callback호출 메소드
	@RequestMapping(value = "/callbacknaver", method = {RequestMethod.GET,RequestMethod.POST} )
	public String loginNaver(@RequestParam String code, @RequestParam String state, HttpSession session  ) throws Exception {
		log.info("===================Naver Login Callback====================");
		
		OAuth2AccessToken accessToken;
		accessToken = naverLoginBO.getAccessToken(session, code, state);
		
		//로그인 사용자 정보를 읽어온다.
		
		apiResult = naverLoginBO.getUserProfile(accessToken);
		
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject;
		
		jsonObject = (JSONObject) jsonParser.parse(apiResult);
		JSONObject response_obj = (JSONObject) jsonObject.get("response");
		//프로필 조회
		Map<String, String> sessionMap = new HashMap<String, String>();
		sessionMap.put("u_email", (String) response_obj.get("email"));
		sessionMap.put("u_nickname", (String) response_obj.get("nickname"));
		sessionMap.put("u_name", (String) response_obj.get("name"));
		sessionMap.put("u_mobile", (String) response_obj.get("mobile"));
		sessionMap.put("api", "naver");
			
		session.setAttribute("user", sessionMap);
		
		return "redirect:/";
	}
	
	//카카오 로그인 성공시 callback
	@RequestMapping(value = "/callbackkakao", method = {RequestMethod.GET,RequestMethod.POST})
	public String loginKakao(@RequestParam String code, @RequestParam String state, HttpSession session) throws Exception{
		log.info("===================Kakao Login Callback===================");
		
		OAuth2AccessToken accessToken;
		accessToken = kakaoLoginBO.getAccessToken(session, code, state);
		
		//로그인 사용자 정보를 읽어온다
		
		apiResult = kakaoLoginBO.getUserProfile(accessToken);
		
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject;
		
		jsonObject = (JSONObject) jsonParser.parse(apiResult);
		JSONObject response_obj = (JSONObject) jsonObject.get("kakao_account");
		JSONObject response_obj2 = (JSONObject) response_obj.get("profile");
		//프로필 조회
		Map<String, String> sessionMap = new HashMap<String, String>();
		sessionMap.put("u_email",(String) response_obj.get("email"));
		sessionMap.put("u_nickname", (String) response_obj2.get("nickname"));
		sessionMap.put("api", "kakao");
		
		session.setAttribute("user", sessionMap);
		
		return "redirect:/";
				
	}
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		log.info("=========================Logout==================");
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
		sessionMap.put("api", "none");
		log.info(sessionMap);
		session.setAttribute("user", sessionMap);		
		
		return "redirect:/";
		
	}
	//이메일 인증
		@GetMapping("/register/mailCheck")
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
	@GetMapping(value = "/findpage")
	public String findpage() {
		
		
		return "login/findpage";
	}

	@PostMapping(value = "/findpage_ok")
	public String findpage_ok(LoginEntity loginEntity ,Model model) throws Exception {
		log.info("u_password" + loginEntity.getU_id());
		
		service.findPassword(loginEntity.getU_email(), loginEntity.getU_id(),loginEntity.getU_password());
		model.addAttribute("loginEntity", loginEntity.getU_email());
		
		return "login/findpage_ok";
	}
}
