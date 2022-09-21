package kr.co.plantlibrary.login;

import java.util.Map;

public interface LoginService {
	
	public Map<String, String> login(Map<String, String> map);
	
	public int register(LoginEntity loginEntity);
}
