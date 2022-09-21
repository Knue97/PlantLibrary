package kr.co.plantlibrary.login;

import java.util.Map;

public interface LoginDAO {
	
	public Map<String, String> login(Map<String, String> map);
	
	public int register(LoginEntity loginEntity);
}
