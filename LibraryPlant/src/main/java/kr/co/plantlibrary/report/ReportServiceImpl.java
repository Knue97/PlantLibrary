package kr.co.plantlibrary.report;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReportServiceImpl implements ReportService{

	@Autowired
	ReportDAO dao;
	
	@Override
	public int register(ReportEntity reportEntity) throws Exception {
		// TODO Auto-generated method stub
		return dao.register(reportEntity);
	}
	
	
}
