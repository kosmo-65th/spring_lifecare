package com.spring.lifecare.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.spring.lifecare.persistence.UserDAO;

@Service
public class NaverLoginServiceImpl implements NaverLoginService{
	@Autowired
	UserDAO userDAO;
	
	String clientId = "LFKH6Ooda771daTdxSSO";
	String clientSecret = "GWXuQveGk8";//애플리케이션 클라이언트 시크릿값";
	
	/*
	public void naverLogin(HttpSession session) throws UnsupportedEncodingException {
	    String redirectURI = URLEncoder.encode("http://127.0.0.1/lifecare/naverLogin", "UTF-8");
	    SecureRandom random = new SecureRandom();
	    String state = new BigInteger(130, random).toString();
	    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	    apiURL += "&client_id=" + clientId;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&state=" + state;
	    session.setAttribute("state", state);
	}
	*/
	
	public HashMap<String, Object> callback(HttpServletRequest request) throws UnsupportedEncodingException {
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		
		String code = request.getParameter("code");
	    String state = request.getParameter("state");
	    String redirectURI = URLEncoder.encode("http://127.0.0.1/lifecare/naverLogin", "UTF-8");
	    String apiURL;
	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	    apiURL += "client_id=" + clientId;
	    apiURL += "&client_secret=" + clientSecret;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&code=" + code;
	    apiURL += "&state=" + state;
	    String access_token = "";
	    String refresh_token = "";
	    System.out.println("apiURL="+apiURL);
	    
	    try {
			  URL url = new URL(apiURL);
			  HttpURLConnection con = (HttpURLConnection)url.openConnection();
			  con.setRequestMethod("GET");
			  int responseCode = con.getResponseCode();
			  BufferedReader br;
			  System.out.print("responseCode="+responseCode);
			  if(responseCode==200) { // 정상 호출
			    br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			  } else {  // 에러 발생
			    br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			  }
			  String inputLine;
	      
			  StringBuffer res = new StringBuffer();
			  while ((inputLine = br.readLine()) != null) {
			    res.append(inputLine);
			  }
			  br.close();
			  if(responseCode==200) {
		    	System.out.println(res.toString());
	    		JSONParser parsing = new JSONParser();
	    		Object obj = parsing.parse(res.toString());
	    		JSONObject jsonObj = (JSONObject)obj;
	    			        
	    		access_token = (String)jsonObj.get("access_token");
	    		refresh_token = (String)jsonObj.get("refresh_token");
	    		
	    		System.out.println("access Token :" +access_token);
	    		System.out.println("refresh_token :" +refresh_token);
			  }
	    } catch (Exception e) {
	      System.out.println(e);
	    }
	    
	    
	    
	    if(access_token != null) { // access_token을 잘 받아왔다면
	    	try {
	    		String header = "Bearer "+ access_token;
	    		String apiurl = "https://openapi.naver.com/v1/nid/me";
	    		URL url = new URL(apiurl);
	    		HttpURLConnection con = (HttpURLConnection)url.openConnection();
	    		con.setRequestMethod("GET");
	    		con.setRequestProperty("Authorization", header);
	    		int responseCode = con.getResponseCode();
	    		BufferedReader br;
	    		if(responseCode==200) { // 정상 호출
	    		 br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	    		} else {  // 에러 발생
	    		br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	    		}
	    		String inputLine;
	    		StringBuffer res = new StringBuffer();
	    		 while ((inputLine = br.readLine()) != null) {
	    			 res.append(inputLine);
	    		}
	    		br.close();
	    		
	    		JSONParser parsing = new JSONParser();
	    		Object obj = parsing.parse(res.toString());
	    		JSONObject jsonObj = (JSONObject)obj;
	    		JSONObject resObj = (JSONObject)jsonObj.get("response");
	    		 
	    		//왼쪽 변수 이름은 원하는 대로 정하면 된다. 
	    		//단, 우측의 get()안에 들어가는 값은 와인색 상자 안의 값을 그대로 적어주어야 한다.
	    		
	    		
	    		String naverCode = (String)resObj.get("id");
	    		System.out.println("naverCode : "+naverCode);
	    		userInfo.put("id", naverCode);
	    		
	    		
	    		if(resObj.containsKey("email")) {
	    			String email = (String)resObj.get("email");
	    			System.out.println("email : "+email);
	    			userInfo.put("email", email);
	    		}
	    		if(resObj.containsKey("name")) {
	    			String name = (String)resObj.get("name");
		    		System.out.println("name : "+name);
		    		userInfo.put("name", name);
	    		}
	        } catch (Exception e) {
	        	e.printStackTrace();
	        }
	    }
	    return userInfo;
	}
	
	
	//네이버 id가 존재하는지 확인
    public Map<String, String> checkNaverId(HashMap<String, Object> userInfo){
    	Map<String, String> user = userDAO.naverFindId((String)userInfo.get("id"));
    	
    	if(user != null) {
    		System.out.println("카카오 로그인 된 실제 아이디 : "+ (String)user.get("USERNAME")+"/ 받은 토큰 id :"+ (String)userInfo.get("id"));
    	}
    	
    	return user;
    }
	
    //카카오에서 권한주기
    public void naverAutehntication(HttpServletRequest request, HttpServletResponse response, Map<String, String> user) {
    	//권한 manager 생성
    	OutLoginAuthenticationManager am = new OutLoginAuthenticationManager();
    	
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
