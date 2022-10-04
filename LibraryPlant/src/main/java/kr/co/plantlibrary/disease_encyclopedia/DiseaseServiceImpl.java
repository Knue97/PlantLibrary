package kr.co.plantlibrary.disease_encyclopedia;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DiseaseServiceImpl implements DiseaseService{
	
	@Autowired
	private DiseaseDAO diseaseDAO;

	@Override
	public List<DiseaseEntity> listAll() throws Exception {
		// TODO Auto-generated method stub
		return diseaseDAO.listAll();
	}

	@Override
	public List<DiseaseEntity> highHits() throws Exception {
		// TODO Auto-generated method stub
		return diseaseDAO.highHits();
	}
	
	@Override
	public DiseaseEntity detail(int di_id) throws Exception {
		// TODO Auto-generated method stub
		diseaseDAO.updateHits(di_id); // 조회수 증가
		return diseaseDAO.detail(di_id);
	}

	@Override
	public List<DiseaseEntity> search(String searchWord) throws Exception {
		// TODO Auto-generated method stub
		return diseaseDAO.search(searchWord);
	}


	@Override
	public int register(DiseaseEntity diseaseEntity) throws Exception {
		// TODO Auto-generated method stub
		return diseaseDAO.register(diseaseEntity);
	}

	@Override
	public int update(DiseaseEntity diseaseEntity) throws Exception {
		// TODO Auto-generated method stub
		return diseaseDAO.update(diseaseEntity);
	}

	@Override
	public int delete(int di_id) throws Exception {
		// TODO Auto-generated method stub
		return diseaseDAO.delete(di_id);
	}

	@Override
	public List<String> aliasList() throws Exception {
		// TODO Auto-generated method stub
		return diseaseDAO.aliasList();
	}

	@Override
	public int checkDisease(String di_alias) throws Exception {
		// TODO Auto-generated method stub
		return diseaseDAO.checkDisease(di_alias);
	}




}
