package com.spring.lifecare.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

@Service
public class NaverLoginServiceImpl implements NaverLoginService{
	String clientId = "LFKH6Ooda771daTdxSSO";
	String clientSecret = "GWXuQveGk8";//애플리케이션 클라이언트 시크릿값";
	
	
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
	
	public void callback(HttpServletRequest request) throws UnsupportedEncodingException {
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
	    		String email = (String)resObj.get("email");
	    		String name = (String)resObj.get("name");
	        } catch (Exception e) {
	        	e.printStackTrace();
	        }
	    }

		
	}
	
	
	
}
