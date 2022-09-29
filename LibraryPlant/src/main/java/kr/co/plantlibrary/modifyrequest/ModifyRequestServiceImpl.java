package kr.co.plantlibrary.modifyrequest;

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
	
	
}
