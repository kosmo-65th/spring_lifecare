package com.spring.lifecare.service;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import sun.misc.IOUtils;

@Service
public class DrugServiceImpl implements DrugService {
	@Override
	public void searchDrug(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

		/*
		 * StringBuilder urlBuilder = new StringBuilder(
		 * "http://apis.data.go.kr/1470000/MdcinGrnIdntfcInfoService/getMdcinGrnIdntfcInfoList"
		 * ); URL urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") +
		 * "=58Rm0ocO44dWpDnMaulASGoUU%2BOw4nXiq6xj6%2F%2BSqqkWwKcGUmHOx%2FbSQyvv456ugnbmslYMMx%2FqHm5jGgqZiw%3D%3D"
		 * ); Service Key
		 * 
		 * 
		 * urlBuilder.append("&" + URLEncoder.encode("item_name","UTF-8") + "=" +
		 * URLEncoder.encode("알레기살정10밀리그람(페미로라스트칼륨)", "UTF-8")); 품목명
		 * urlBuilder.append("&" + URLEncoder.encode("entp_name","UTF-8") + "=" +
		 * URLEncoder.encode("현대약품(주)", "UTF-8")); 업체명 urlBuilder.append("&" +
		 * URLEncoder.encode("item_seq","UTF-8") + "=" + URLEncoder.encode("200402488",
		 * "UTF-8")); 품목일련번호 urlBuilder.append("&" +
		 * URLEncoder.encode("img_regist_ts","UTF-8") + "=" +
		 * URLEncoder.encode("20041222", "UTF-8")); 약학정보원 이미지 생성일 urlBuilder.append("&"
		 * + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1",
		 * "UTF-8")); 페이지번호 urlBuilder.append("&" +
		 * URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("3",
		 * "UTF-8")); 한 페이지 결과 수 urlBuilder.append("&" +
		 * URLEncoder.encode("edi_code","UTF-8") + "=" + URLEncoder.encode("642003260",
		 * "UTF-8")); 보험코드
		 * 
		 * URL url = new URL(urlBuilder.toString()); HttpURLConnection conn =
		 * (HttpURLConnection) url.openConnection(); conn.setRequestMethod("GET");
		 * conn.setRequestProperty("Content-type", "application/json");
		 * System.out.println("Response code: " + conn.getResponseCode());
		 * System.out.println("getResponseMessage : " + conn.getResponseMessage());
		 * 
		 * BufferedReader rd; if (conn.getResponseCode() >= 200 &&
		 * conn.getResponseCode() <= 300) { rd = new BufferedReader(new
		 * InputStreamReader(conn.getInputStream())); } else { rd = new
		 * BufferedReader(new InputStreamReader(conn.getErrorStream())); } StringBuilder
		 * sb = new StringBuilder(); String line; while ((line = rd.readLine()) != null)
		 * { sb.append(line); } rd.close(); conn.disconnect();
		 * System.out.println(sb.toString());
		 */
}

/*
 * String url =
 * "http://apis.data.go.kr/1470000/MdcinGrnIdntfcInfoService/getMdcinGrnIdntfcInfoList";
 * String serviceKey =
 * "3MPgGJKid%2BNBDQCgVo2mtFq%2BvdJzlIBXIjPXmN7UIAqJo4yzbw7lEFfaWnQ2nda3SnX0vB%2FknUXKCAMJd9hKRQ%3D%3D";
 * String decodeServiceKey = URLDecoder.decode(serviceKey, "UTF-8");
 * 
 * RestTemplate restTemplate = new RestTemplate(); HttpHeaders headers = new
 * HttpHeaders(); headers.setContentType(new
 * MediaType("application","json",Charset.forName("UTF-8"))); //Response Header
 * to UTF-8
 * 
 * UriComponents builder = UriComponentsBuilder.fromHttpUrl(url)
 * .queryParam("ServiceKey", decodeServiceKey) .queryParam("item_name",
 * item_name) //품목명 .queryParam("entp_name", entp_name) //업체명
 * .queryParam("_type", "json") .build(false); //자동으로 encode해주는 것을 막기 위해 false
 * 
 * Object response = restTemplate.exchange(builder.toUriString(),
 * HttpMethod.POST, new HttpEntity<String>(headers), String.class); return
 * response; }
 */
