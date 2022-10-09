package kr.co.plantlibrary.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	AdminDAO adminDAO;

	@Override
	public int countDisease() {
		// TODO Auto-generated method stub
		return adminDAO.countDisease();
	}

	@Override
	public List<Map<String, Object>> listPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.listPage(displayPost, postNum);
	}

}
