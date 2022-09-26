package kr.co.plantlibrary.login;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceimpl implements LoginService {

	@Autowired
	private LoginDAO dao;
	
	@Override
	public Map<String, String> login(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.login(map);
	}
	
	@Override
	public int register(LoginEntity loginEntity) {
		
		return dao.register(loginEntity);
	}

	@Override
	public int mypage_update(LoginEntity loginEntity) {
		// TODO Auto-generated method stub
		return dao.mypage_update(loginEntity);
	}

	@Override
	public LoginEntity mypage_lookup(String u_id) {
		// TODO Auto-generated method stub
		return dao.mypage_lookup(u_id);
	}

	
}
