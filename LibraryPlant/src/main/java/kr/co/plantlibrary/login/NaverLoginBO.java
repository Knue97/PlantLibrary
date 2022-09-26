package kr.co.plantlibrary.login;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

public class NaverLoginBO {
	
	/*인증 요청문을 구성하는 파라미터 */
	//client_id: 어플리케이션 등록 후 발급단은 아이디
	//response_type: 인증 과정에 대한 구분값, code로 값이 고정
	//redirect_url: 네이버 로그인 인증의 결과를 전달받을 콜백 URL
	//state: 어플리케이션이 생성한 상태 코드
	private final static String CLIENT_ID = "_Zp8xQ3iw6u560Vv7K8K";
	private final static String CLIENT_SECRET = "xpQdx96TEd";
	private final static String REDIRECT_URL = "http://localhost:8080/plantlibrary/login/callbacknaver";
	private final static String SESSION_STATE = "oauth_state";
	
	//프로필 조회 API URL
	private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
	
	//네이버 아이디로 인증 URL 생성  Method
	public String getAuthorization(HttpSession session) {
		
		//세션 유효성 검증을 위하여 난수 생성
		String state = generateRandomString();
		
		setSession(session, state);
		
		//Scribe에서 제공하는 인증 URL 생성 기능을 이요하여 인증 URL 생성
		OAuth20Service auth20Service = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET).callback(REDIRECT_URL).state(state).build(NaverOAuthApi.instance());
		return auth20Service.getAuthorizationUrl(); 
	}
	
	//네이버 아이디로 callback 처리 및 AccessToken 획득 Method
	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException{
		
		//callback으로 전달받은 세션검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인
		String sessionState = getSession(session);
		if(StringUtils.pathEquals(sessionState, state)) {
			OAuth20Service auth20Service = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET).callback(REDIRECT_URL).state(state).build(NaverOAuthApi.instance());
			
			OAuth2AccessToken accessToken = auth20Service.getAccessToken(code);
			return accessToken;
		}
		
		return null;
	}
	
	//세션 유효성 검증을 위한 난수 생성기
	private String generateRandomString() {
		return UUID.randomUUID().toString();
	}
	
	//http session에 데이터 저장
	private void setSession(HttpSession session, String state ) {
		session.setAttribute(SESSION_STATE, state);
	}
	
	//http session에서 데이터 가져오기
	private String getSession(HttpSession session) {
		return (String)session.getAttribute(SESSION_STATE);
	}
	
	//Access Token을 이용하여 네이버 사용자 프로필 API를 호출
	public String getUserProfile(OAuth2AccessToken accessToken) throws IOException{
		
		OAuth20Service auth20Service = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET).callback(REDIRECT_URL).build(NaverOAuthApi.instance());
		
		OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, auth20Service);
		auth20Service.signRequest(accessToken, request);
		Response response = request.send();
		return response.getBody();
	}
}
