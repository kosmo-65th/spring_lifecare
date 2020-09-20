<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/resources/setting/setting.jsp"%>
<%@ page import="org.jsoup.Jsoup"%>
<%@ page import="org.jsoup.nodes.Document"%>
<%@ page import="org.jsoup.nodes.Element"%>
<%@ page import="org.jsoup.select.Elements"%>
<%@ page import="java.util.Iterator"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${path_resources}css/covid19css.css">
<head>
<meta charset="UTF-8">
<title>코로나 바이러스 현황</title>
</head>
<body>

<%@include file="../common/header.jsp"%>
	<%

    // 파싱할 사이트를 적어준다(해당 사이트에 대한 태그를 다 긁어옴)
 	Document doc2 = Jsoup.connect("http://ncov.mohw.go.kr/").get();
	      //System.out.println(doc2.data());
	      //System.out.println(doc2.body());
	      // list 속성안에 li 요소 데이터들을 긁어온다
	
	      Elements posts1 = doc2.body().getElementsByClass("liveNum");
	        
	      Elements posts2 = doc2.body().getElementsByClass("regional_patient_status_A");
	      
	      
	      String tit = "";
	      String num = "";
	       
	//Iterator을 사용하여 하나씩 값 가져오기
	Iterator<Element> ie1 = posts1.select(".tit").iterator(); 
	Iterator<Element> ie2 = posts1.select(".num").iterator();
	while (ie1.hasNext()) {
		String str = ie1.next().text()+" : "+ie2.next().text()+"<br>";
		String[] strarr = {str};
		
			%>
			<table>
				<tr>
				<%
				for(int i = 0; i<=strarr.length; i++){
					%>
					<td>
					</td>
					<%
				}
				%>
				</tr>
			</table>
		<%= str %>
	 <%
	}
%>
<%= posts2 %>
<%@include file="../common/footer.jsp"%>
</body>
</html>