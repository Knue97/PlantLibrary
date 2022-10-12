package kr.co.plantlibrary.login;

import java.util.Map;


public interface LoginService {
	
	public Map<String, String> login(Map<String, String> map);
	
	public int register(LoginEntity loginEntity);
	
	public int mypage_update(LoginEntity loginEntity);
	
	public int mypage_updatepw(LoginEntity loginEntity);
	
	public LoginEntity mypage_lookup(String u_id);

	public int userIdcheck(String u_id);
	
	public int userNicknamecheck(String u_nickname);
	
	public int userEmailcheck(String u_email);
	
	public void findPassword(String u_email,String u_id,String u_password) throws Exception;
	
	public int findPasswordCheck(LoginEntity loginEntity);
	
	public int leave(String u_id);
}
