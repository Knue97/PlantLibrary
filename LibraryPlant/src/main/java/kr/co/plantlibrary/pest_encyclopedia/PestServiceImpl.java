package kr.co.plantlibrary.pest_encyclopedia;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PestServiceImpl implements PestService{
	
	@Autowired
	private PestDAO pestDAO;

	@Override
	public List<PestEntity> listAll() throws Exception {
		// TODO Auto-generated method stub
		return pestDAO.listAll();
	}
	
	@Override
	public List<PestEntity> highHits() throws Exception {
		// TODO Auto-generated method stub
		return pestDAO.highHits();
	}

	@Override
	public PestEntity detail(int pe_id) throws Exception {
		// TODO Auto-generated method stub
		pestDAO.updateHits(pe_id); // 조회수 증가
		return pestDAO.detail(pe_id);
	}

	@Override
	public List<PestEntity> search(String searchWord) throws Exception {
		// TODO Auto-generated method stub
		return pestDAO.search(searchWord);
	}

	@Override
	public int register(PestEntity PestEntity) throws Exception {
		// TODO Auto-generated method stub
		return pestDAO.register(PestEntity);
	}

	@Override
	public int update(PestEntity PestEntity) throws Exception {
		// TODO Auto-generated method stub
		return pestDAO.update(PestEntity);
	}

	@Override
	public int delete(int pe_id) throws Exception {
		// TODO Auto-generated method stub
		return pestDAO.delete(pe_id);
	}

	@Override
	public int checkPest(String pe_name) throws Exception {
		// TODO Auto-generated method stub
		return pestDAO.checkPest(pe_name);
	}
	


}
