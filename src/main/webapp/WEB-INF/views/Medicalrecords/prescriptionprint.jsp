<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery 추가 -->
<script src="${path_resources}setting/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		window.print();
	});
</script>
<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  overflow:hidden;padding:10px 5px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-lboi{border-color:inherit;ign:left;vertical-align:middle}
.tg .tg-9wq8{border-color:inherit;text-align:center;vertical-align:middle}
.tg .tg-dq1s{font-size:10px;text-align:right;vertical-align:bottom}
.tg .tg-baqh{text-align:center;vertical-align:top}
.tg .tg-cji8{border-color:inherit;font-size:18px;text-align:center;vertical-align:middle}
.tg .tg-c3ow{border-color:inherit;text-align:center;vertical-align:middle}
.tg .tg-c4ow{border-color:inherit;text-align:center;vertical-align:middle;width:135px}
.tg .tg-8hvc{border-color:inherit;font-size:32px;text-align:center;vertical-align:middle}
.tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
.tg .tg-9pky{border-color:inherit;text-align:left;vertical-align:middle}
.tg .tg-dvpl{border-color:inherit;text-align:right;vertical-align:top}
.tg .tg-dvp{border-color:inherit;text-align:right;vertical-align:middel}
.tg .tg-nrix{text-align:center;vertical-align:middle}
.tg .tg-0lax{text-align:left;vertical-align:top}
</style>
</head>
<body>
<div align="center">
<table class="tg"  style = "margin-bottom:20px;">
<thead>
  <tr>
    <th class="tg-8hvc" colspan="11" style = "background-color:#E8E8E8">처 &nbsp;&nbsp;&nbsp;&nbsp;   방   &nbsp;&nbsp;&nbsp;&nbsp; 전</th>
    <th class="tg-9wq8" colspan="3" style="width:100px; background-color:#E8E8E8;">교부번호</th>
    <th class="tg-9pky" colspan="6" style="width:163px">${dto.diagnosis_num}</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-c3ow" style="width: 40px; text-align: center; background-color:#E8E8E8;">보험<br>종류</td>
    <td class="tg-0pky" style="width: 100px; text-align: center;">❶의료보험</td>
    <td class="tg-0pky" style="width: 100px; text-align: center;">②의료급여</td>
    <td class="tg-0pky" style="width: 100px; text-align: center;">③산제보험</td>
    <td class="tg-0pky" style="width: 100px; text-align: center;">④자동차보험</td>
    <td class="tg-0pky" style="width: 100px; text-align: center;">⑤기타(         )</td>
    <td class="tg-c3ow" colspan="5" style = "background-color:#E8E8E8">요양기관번호</td>
    <td class="tg-9pky" colspan="8">120710</td>
  </tr>
  <tr>
    <td class="tg-9wq8" rowspan="2" style = "background-color:#E8E8E8">환자</td>
    <td class="tg-c3ow" style = "background-color:#E8E8E8">성명</td>
    <td class="tg-0pky" colspan="4">${dto.customer_name}</td>
    <td class="tg-c3ow" rowspan="2" style = "background-color:#E8E8E8">의료기관(병원)</td>
    <td class="tg-c3ow" colspan="4" style = "background-color:#E8E8E8">명&nbsp;&nbsp;&nbsp;&nbsp;칭</td>
    <td class="tg-0pky" colspan="8">LifeCare</td>
  </tr>
  <tr>
    <td class="tg-c3ow" style = "background-color:#E8E8E8">출생년도</td>
    <td class="tg-9pky" colspan="4">${dto.customer_year}년</td>
    <td class="tg-c3ow" colspan="4" style = "background-color:#E8E8E8">전&nbsp;&nbsp;&nbsp;&nbsp;화</td>
    <td class="tg-0pky" colspan="8">010-7220-7446</td>
  </tr>
  <tr>
    <td class="tg-9wq8" rowspan="2" style = "background-color:#E8E8E8">질병<br>분류<br>기호</td>
    <td class="tg-c3ow" style = "background-color:#E8E8E8">질병코드 </td>
    <td class="tg-9pky" colspan="4">${dto.disease_code}</td>
    <td class="tg-c3ow" rowspan="2" style = "background-color:#E8E8E8">의료기관(약국)</td>
    <td class="tg-c3ow" colspan="4" style = "background-color:#E8E8E8">약국<br>팩스</td>
    <td class="tg-9pky" colspan="8">02-2025-4113</td>
  </tr>
  <tr>
    <td class="tg-c3ow" style = "background-color:#E8E8E8">질병명</td>
    <td class="tg-9pky" colspan="4">${dto.disease_name}</td>
    <td class="tg-c3ow" colspan="4" style = "background-color:#E8E8E8">e_mail<br>주소</td>
    <td class="tg-9pky" colspan="8">sunrise555@empas.com</td>
  </tr>
  <tr>
    <td class="tg-9wq8" rowspan="2" style = "background-color:#E8E8E8">처&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;방<br>의료인의<br>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명</td>
    <td class="tg-dvp" colspan="4" rowspan="2"><span style = "font-size : 32px;">${dto.doctor_name}<img src="${path_resources}images/lifecaresign.png" width="80px" height="80px" style = "align:bottom"/></span></td>
    <td class="tg-c3ow" colspan="6" style = "background-color:#E8E8E8">면허종별</td>
    <td class="tg-9pky" colspan="8">의사</td>
  </tr>
  <tr>
    <td class="tg-c3ow" colspan="6" style = "background-color:#E8E8E8">면허번호</td>
    <td class="tg-9pky" colspan="8">${dto.doctor_num}</td>
  </tr>
  <tr>
    <td class="tg-0pky" colspan="19">※환자의 요구가 있는 때에는 질병분류기호를 기재하지 아니합니다.</td>
  </tr>
  <tr>
    <td class="tg-cji8" colspan="3" style = "background-color:#E8E8E8">처  &nbsp;&nbsp;&nbsp;&nbsp;방 &nbsp;&nbsp;&nbsp;&nbsp; 의&nbsp;&nbsp;  &nbsp;&nbsp;약 &nbsp;&nbsp;&nbsp;&nbsp; 품 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명&nbsp;&nbsp;&nbsp;&nbsp;  칭</td>
    <td class="tg-c4ow" style = "background-color:#E8E8E8">제조회사</td>
    <td class="tg-c4ow" style = "background-color:#E8E8E8">효능 및 효과</td>
    <td class="tg-c4ow" style = "background-color:#E8E8E8">보관 방법</td>
    <td class="tg-cji8" colspan="8" style = "background-color:#E8E8E8">보관 기간</td>
    <td class="tg-cji8" colspan="5" style = "background-color:#E8E8E8">조&nbsp;&nbsp;&nbsp;제&nbsp;&nbsp;&nbsp;시&nbsp;&nbsp;&nbsp;참&nbsp;&nbsp;&nbsp;고&nbsp;&nbsp;&nbsp;사&nbsp;&nbsp;&nbsp;항</td>
  </tr>
    <tr>
  <c:if test = "${dto.drug1 == 0}">
    <td class="tg-0pky" colspan="19" style = "text-align:center">처방된 약이 없습니다.</td>
  </c:if>  
  </tr>
  <tr>
  <c:if test = "${dto.drug1 != 0}">
    <td class="tg-0pky" colspan="3">${dto.drug_name1}<br>(${dto.drug1})</td>
    <td class="tg-0pky">${dto.drug_enptname1}</td>
    <td class="tg-0pky">${dto.drug_category1}</td>
    <td class="tg-0pky">${dto.drug_storage1}</td>
    <td class="tg-0pky" colspan="8">${dto.drug_expiration_date1}</td>
    <td class="tg-0pky" colspan="5"></td>
  </c:if>  
  </tr>
  <tr>
  <c:if test = "${dto.drug2 != 0}">
    <td class="tg-0pky" colspan="3">${dto.drug_name2}<br>(${dto.drug2})</td>
    <td class="tg-0pky">${dto.drug_enptname2}</td>
    <td class="tg-0pky">${dto.drug_category2}</td>
    <td class="tg-0pky">${dto.drug_storage2}</td>
    <td class="tg-0pky" colspan="8">${dto.drug_expiration_date2}</td>
    <td class="tg-0pky" colspan="5"></td>
  </c:if>
  </tr>
  <tr>
  <c:if test = "${dto.drug3 != 0}">
    <td class="tg-0pky" colspan="3">${dto.drug_name3}<br>(${dto.drug3})</td>
    <td class="tg-0pky">${dto.drug_enptname3}</td>
    <td class="tg-0pky">${dto.drug_category3}</td>
    <td class="tg-0pky">${dto.drug_storage3}</td>
    <td class="tg-0pky" colspan="8">${dto.drug_expiration_date3}</td>
    <td class="tg-0pky" colspan="5"></td>
  </c:if>
  </tr>
  <tr>
  <c:if test = "${dto.drug4 != 0}">
    <td class="tg-0pky" colspan="3">${dto.drug_name4}<br>(${dto.drug4})</td>
    <td class="tg-0pky">${dto.drug_enptname4}</td>
    <td class="tg-0pky">${dto.drug_category4}</td>
    <td class="tg-0pky">${dto.drug_storage4}</td>
    <td class="tg-0pky" colspan="8">${dto.drug_expiration_date4}</td>
    <td class="tg-0pky" colspan="5"></td>
  </c:if>  
  </tr>
  <tr>
  <c:if test = "${dto.drug5 != 0}">
    <td class="tg-0pky" colspan="3">${dto.drug_name5}<br>(${dto.drug5})</td>
    <td class="tg-0pky">${dto.drug_enptname5}</td>
    <td class="tg-0pky">${dto.drug_category5}</td>
    <td class="tg-0pky">${dto.drug_storage5}</td>
    <td class="tg-0pky" colspan="8">${dto.drug_expiration_date5}</td>
    <td class="tg-0pky" colspan="5"></td>
  </c:if>
  </tr>  
  <tr>
    <td class="tg-c3ow" colspan="19">주사제 처방내역(원내조제 ㅁ, 원외처방ㅁ)</td>
  </tr>
  <tr>
    <td class="tg-0pky" style = "text-align:center; background-color:#E8E8E8">사용<br>기간</td>
    <td class="tg-9pky" colspan="2">교부일로부터(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3&nbsp;&nbsp;&nbsp;&nbsp;)일간</td>
    <td class="tg-9pky" colspan="16">*사용기간내에 약국에 제출하여야 합니다.</td>
  </tr>
  <tr>
    <td class="tg-c3ow" colspan="19">의&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;약&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;품&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;역</td>
  </tr>
  <tr>
    <td class="tg-nrix" rowspan="4" style = "background-color:#E8E8E8">조<br><br>제<br><br>내<br><br>역</td>
    <td class="tg-baqh" colspan="2" style = "background-color:#E8E8E8">조제기관 명칭</td>
    <td class="tg-0lax" colspan="4"></td>
    <td class="tg-nrix" colspan="12" style = "background-color:#E8E8E8">처방의 변경, 수정, 확인대체세 그 내용등</td>
  </tr>
  <tr>
    <td class="tg-baqh" colspan="2" style = "background-color:#E8E8E8">조제약사 성명</td>
    <td class="tg-dq1s" colspan="4">(서명 또는 날인)</td>
    <td class="tg-0lax" colspan="12" rowspan="3"></td>
  </tr>
  <tr>
    <td class="tg-baqh" colspan="2" style = "background-color:#E8E8E8">조　제　량</td>
    <td class="tg-0lax" colspan="4"></td>
  </tr>
  <tr>
    <td class="tg-baqh" colspan="2" style = "background-color:#E8E8E8">조　제　년　월　일</td>
    <td class="tg-0lax" colspan="4"></td>
  </tr>
</tbody>
</table>
</div>
</body>
</html>