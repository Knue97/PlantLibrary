package kr.co.plantlibrary.modifyrequest;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ModifyRequestServiceImpl implements ModifyRequestService{

	@Autowired
	ModifyRequestDAO modifyRequestDAO;
	
	@Override
	public int register(ModifyRequestEntity modifyRequestEntity) throws Exception {
		// TODO Auto-generated method stub
		return modifyRequestDAO.register(modifyRequestEntity);
	}

	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return modifyRequestDAO.count();
	}

	@Override
	public List<Map<String,Object>> listPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return modifyRequestDAO.listPage(displayPost, postNum);
	}

	@Override
	public String getName(Map<String,Integer> map) throws Exception {
		// TODO Auto-generated method stub
		return modifyRequestDAO.getName(map);
	}

	@Override
	public ModifyRequestEntity detail(int mr_no) throws Exception {
		// TODO Auto-generated method stub
		return modifyRequestDAO.detail(mr_no);
	}

	@Override
	public int delete(int mr_no) throws Exception {
		// TODO Auto-generated method stub
		return modifyRequestDAO.delete(mr_no);
	}
	
	
}
