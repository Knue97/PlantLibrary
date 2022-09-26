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

public class KakaoLoginBO {
	
	//카카오 로그인 정보
	private final static String KAKAO_CLIENT_ID = "15301703f94b881c168373894ceda277";
	private final static String KAKAO_CLIENT_SECRET = "as3nA5qZmo12XFDHBicQEt7iMTcfWNGK";
	private final static String KAKAO_REDIRECT_URI = "http://localhost:8080/plantlibrary/login/callbackkakao";
	private final static String SESSION_STATE = "kakao_oauth_state";
	private final static String PROFILE_API_URL = "https://kapi.kakao.com/v2/user/me";
	
	public String getAutorizationUrl(HttpSession session) {
		String state = generateRandomString();
		setSession(session, state);
		OAuth20Service auth20Service = new ServiceBuilder().apiKey(KAKAO_CLIENT_ID).apiSecret(KAKAO_CLIENT_SECRET).callback(KAKAO_REDIRECT_URI).state(state).build(KakaoOAuthApi.instance());
		return auth20Service.getAuthorizationUrl();
	}
	
	public OAuth2AccessToken getAccessToken(HttpSession session,String code, String state) throws IOException {
		String sessionState = getSession(session);
		if(StringUtils.pathEquals(sessionState, state)) {
			OAuth20Service auth20Service = new ServiceBuilder().apiKey(KAKAO_CLIENT_ID).apiSecret(KAKAO_CLIENT_SECRET).callback(KAKAO_REDIRECT_URI).state(state).build(KakaoOAuthApi.instance());
			
			OAuth2AccessToken accessToken = auth20Service.getAccessToken(code);
			return accessToken;
		}
		return null;
	}
	
	public String getUserProfile(OAuth2AccessToken accessToken) throws Exception{
		OAuth20Service auth20Service = new ServiceBuilder().apiKey(KAKAO_CLIENT_ID).apiSecret(KAKAO_CLIENT_SECRET).callback(KAKAO_REDIRECT_URI).build(KakaoOAuthApi.instance());
		OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, auth20Service);
		auth20Service.signRequest(accessToken, request);
		Response response = request.send();
		return response.getBody();
	}
	
	private String generateRandomString() {
		return UUID.randomUUID().toString();
	}
	
	private void setSession(HttpSession session, String state) {
		session.setAttribute(SESSION_STATE, state);
	}
	
	private String getSession(HttpSession session) {
		return (String) session.getAttribute(SESSION_STATE);
	}
}
