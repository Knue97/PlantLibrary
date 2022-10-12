package kr.co.plantlibrary.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.plantlibrary.report.ReportEntity;

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

	@Override
	public int countPlant() {
		// TODO Auto-generated method stub
		return adminDAO.countPlant();
	}

	@Override
	public List<Map<String, Object>> plantListPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.plantListPage(displayPost, postNum);
	}

	@Override
	public int countReport() {
		// TODO Auto-generated method stub
		return adminDAO.countReport();
	}

	@Override
	public List<Map<String, Object>> reportListPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.reportListPage(displayPost, postNum);
	}

	@Override
	public ReportEntity reportDetail(int r_no) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.reportDetail(r_no);
	}

	@Override
	public int updateReportState(int r_no, int r_state) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.updateReportState(r_no, r_state);
	}

    @Override
    public int countUser() {
        // TODO Auto-generated method stub
        return adminDAO.countUser();
    }

    @Override
    public List<Map<String, Object>> userListPage(int displayPost, int postNum) throws Exception {
        // TODO Auto-generated method stub
        return adminDAO.userListPage(displayPost, postNum);
    }

    @Override
    public int updateUserState(String u_id, int u_state) throws Exception {
        // TODO Auto-generated method stub
        return adminDAO.updateUserState(u_id, u_state);
    }

    @Override
    public int deleteUser(String u_id) throws Exception {
        // TODO Auto-generated method stub
        return adminDAO.deleteUser(u_id);
    }
	
	
}
