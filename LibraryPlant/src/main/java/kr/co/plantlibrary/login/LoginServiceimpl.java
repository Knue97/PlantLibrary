package kr.co.plantlibrary.login;

import java.util.Map;

import javax.inject.Inject;
import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import kr.co.plantlibrary.controller.MailSendService;
import kr.co.plantlibrary.controller.MailUtils;
import kr.co.plantlibrary.controller.TempKey;

@Service
public class LoginServiceimpl implements LoginService {

	@Autowired
	private LoginDAO dao;
	@Inject
	private JavaMailSender mailSender;
	
	
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

	@Override
	public int mypage_updatepw(LoginEntity loginEntity) {
		// TODO Auto-generated method stub
		return dao.mypage_updatepw(loginEntity);
	}

	@Override
	public int userIdcheck(String u_id) {
		// TODO Auto-generated method stub
		return dao.userIdcheck(u_id);
	}

	@Override
	public int userNicknamecheck(String u_nickname) {
		// TODO Auto-generated method stub
		return dao.userNicknamecheck(u_nickname);
	}

	@Override
	public void findPassword(String u_email, String u_id, String u_password) throws Exception{
		String memberKey = new TempKey().getKey(6,false);
			dao.findPassword(u_email, u_id, u_password);
			 MailUtils sendMail = new MailUtils(mailSender);
			 sendMail.setSubject("[PlantLibrary 커뮤니티 임시 비밀번호 입니다.]"); //메일제목
				sendMail.setText(
						"<h1>임시비밀번호 발급</h1>" +
								"<br/>"+u_id+"님 "+
								"<br/>비밀번호 찾기를 통한 임시 비밀번호입니다."+
								"<br/>임시비밀번호 :   <h2>"+memberKey+"</h2>"+
								"<br/>로그인 후 비밀번호 변경을 해주세요."+
								"<a href='http://localhost:8080/plantlibrary/login/login"+
								">로그인 페이지</a>");
				sendMail.setFrom("rudtjqdnekd@naver.com", "PlantLibrary");
				sendMail.setTo(u_email);
				sendMail.send();
				LoginEntity tmp = new LoginEntity();
				tmp.setU_id(u_id);
				tmp.setU_password(memberKey);
				mypage_updatepw(tmp);
	}

	@Override
	public int findPasswordCheck(LoginEntity loginEntity) {
		// TODO Auto-generated method stub
		return dao.findPasswordCheck(loginEntity);
	}

	@Override
	public int userEmailcheck(String u_email) {
		// TODO Auto-generated method stub
		return dao.userEmailcheck(u_email);
	}

    @Override
    public int leave(String u_id) {
        // TODO Auto-generated method stub
        return dao.leave(u_id);
    }



	
}
