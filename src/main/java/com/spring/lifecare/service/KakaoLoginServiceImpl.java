package com.spring.lifecare.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.spring.lifecare.persistence.UserDAO;
import com.spring.lifecare.vo.UserVO;

@Service
public class KakaoLoginServiceImpl {
	
	@Autowired
	UserDAO userDAO;
    
    public String getAccessToken (String authorize_code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";
        
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            
            //    POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            
            //    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=db39a7b6654b2f994af177b271416561");
            sb.append("&redirect_uri=http://localhost/lifecare/kakaoLogin");
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();
            
            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
 
            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);
            
            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
            
            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            
            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);
            
            br.close();
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        } 
        
        return access_Token;
    }
    
    public HashMap<String, Object> getUserInfo (String access_Token) {
        
        //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            
            //    요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);
            
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
            
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);
            
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
            
            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
            
            try {
            	String email = kakao_account.getAsJsonObject().get("email").getAsString();
                userInfo.put("email", email);
            }catch(Exception e) {
            	System.out.println("카카오에서 email 정보를 허용하지 않았습니다");
            }
            
            //카카오 토큰 id 가져오기
            String id = element.getAsJsonObject().get("id").getAsString();
            userInfo.put("id", id);
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        return userInfo;
    }
    
    //카카오토큰 id가 존재하는지 확인
    public Map<String, String> checkKakaoId(HashMap<String, Object> userInfo){
    	Map<String, String> user = userDAO.kakaoFindId((String)userInfo.get("id"));
    	
    	if(user != null) {
    		System.out.println("카카오 로그인 된 실제 아이디 : "+ (String)user.get("USERNAME")+"/ 받은 토큰 id :"+ (String)userInfo.get("id"));
    	}
    	return user;
    }
    
    //카카오에서 권한주기
    public void kakaoAutehntication(HttpServletRequest request, HttpServletResponse response, Map<String, String> user) {
    	//권한 manager 생성
    	AuthenticationManager am = new SampleAuthenticationManager();
    	
    	//실제 아이디 
    	String id = (String)user.get("USERNAME");
    	
	    try {
	        Authentication token = new UsernamePasswordAuthenticationToken(id, null);
	        Authentication result = am.authenticate(token);
	        SecurityContextHolder.getContext().setAuthentication(result);
	        
	        System.out.println("result getPrincipal() : "+result.getPrincipal());
	        
	        SecurityContext securityContext = SecurityContextHolder.getContext();
		    securityContext.setAuthentication(result);

		    // Create a new session and add the security context.
		    HttpSession session = request.getSession(true);
		    session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
	    } catch(AuthenticationException e) {
	        System.out.println("Authentication failed: " + e.getMessage());
	    }
	    
	    //손수 successHandler 태워주기
	    UserLoginSuccessHandler successHandler = new UserLoginSuccessHandler();
	    try {
	    	successHandler.onAuthenticationSuccess(request, response, SecurityContextHolder.getContext().getAuthentication());
	    }catch(Exception e) {
	    	System.out.print("내가 만든 successHanlder 에서 에러");
	    }
	    
	    System.out.println("Successfully authenticated. Security context contains: \n" +
	              SecurityContextHolder.getContext().getAuthentication());
	  
    }
    
}

//권한 부여
class SampleAuthenticationManager implements AuthenticationManager {
  static final List AUTHORITIES = new ArrayList();

  static {
    AUTHORITIES.add(new SimpleGrantedAuthority("ROLE_CUSTOMER"));
  }

  public Authentication authenticate(Authentication auth) throws AuthenticationException {
	  System.out.println("usernamepasswordAuthenticationToken 주기");
      return new UsernamePasswordAuthenticationToken(auth.getName(), null, AUTHORITIES);
  }
  
}