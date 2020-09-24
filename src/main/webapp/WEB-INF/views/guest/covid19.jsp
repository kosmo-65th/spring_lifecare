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
	<!-- 코로나 css -->
   <link rel="stylesheet" href="${path_resources}css/covid19css.css">
   <link rel="stylesheet" href="${path_resources}css/covid19_3css.css">
   <link rel="stylesheet" href="${path_resources}css/covid19_4css.css">
   <!-- 코로나 css -->
   
   <!-- CSS -->
   
   <!-- 코로나  js -->
   <script src="${path_resources}js/covid19_1.js"></script>
   <script src="${path_resources}js/covid19_2.js"></script>
   <script src="${path_resources}js/covid19_3.js"></script>
   <script src="${path_resources}js/covid19_4.js"></script>
   <script src="${path_resources}js/covid19_5.js"></script>
   <script src="${path_resources}js/covid19_6.js"></script> 
   <script src="${path_resources}js/covid19_7.js"></script>
   <!-- 코로나  js -->
    <script type="text/javascript">
	    $(function(){
			$('#abc').hide();	
		})
    </script>
<head>
<meta charset="UTF-8">
<title>코로나 바이러스 현황</title>
</head>
		<%
			Document doc1 = Jsoup.connect("http://ncov.mohw.go.kr/bdBoardList_Real.do?brdId=1&brdGubun=13&ncvContSeq=&contSeq=&board_id=&gubun=").get();
			Elements posts3 = doc1.body().getElementsByClass("data_table midd mgt24");
			
			Document doc2 = Jsoup.connect("http://ncov.mohw.go.kr/bdBoardList_Real.do?brdId=1&brdGubun=11&ncvContSeq=&contSeq=&board_id=&gubun=").get();
			Elements posts4 = doc2.body().getElementsByClass("caseTable");
			Elements posts5 = doc2.body().getElementsByClass("data_table");
			
			Document doc3 = Jsoup.connect("http://ncov.mohw.go.kr/").get();
			Elements posts6 = doc3.body().getElementsByClass("regional_patient_status_A");
			Elements posts7 = doc3.body().getElementsByClass("wrap nj");
		%>
<body>
<%@include file="./../common/header.jsp" %>
<div align="center">
	<%= posts6 %>
	<div id="abc"><%=posts7 %></div>
	<%= posts4 %>
	<%= posts3 %>
	<%= posts5 %>
</div>
<%@include file="./../common/footer.jsp" %>
 
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-159814989-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date()); 

  gtag('config', 'UA-159814989-1');
</script>
<script>

$(function(){
	//검사현황
	IS_data = {
	    label: ["결과음성", "검사중", "결과양성"],
	    figure: [parseInt("2,186,008".replace(",")), parseInt("22,536".replace(",")), parseInt("23,045".replace(","))]
	};
	
	//전국 파이
	RPR_A_MAIN_data = {
		label : ["대구","기타","서울","경기","경북"],
		figure : [7125,5239,4995,4174,1512]
	};
	
	//WPS
	WPS_data = {
	    date: ["09.15","09.16","09.17","09.18","09.19","09.20","09.21"],
	    complete_day:[389,432,233,228,199,188,90],
	    confirm_day:[106,113,153,126,110,82,70],
	   //cure_total:[3146,2827,2742,2635,2545,2434,2412],
	   //complete_total:[18878,19310,19543,19771,19970,20158,20248]
	};
	
	ISChart();
	WPSChart();
	RPRAMainChart();		
	RPSAChart();
	RPSACityRatio();
});

	</script>
	
</body>
</html>