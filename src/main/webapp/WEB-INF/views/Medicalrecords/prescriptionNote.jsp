<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery 추가 -->
<script src="${path_resources}setting/jquery-3.5.1.js"></script>
<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  overflow:hidden;padding:10px 5px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-lboi{border-color:inherit;text-align:left;vertical-align:middle}
.tg .tg-9wq8{border-color:inherit;text-align:center;vertical-align:middle}
.tg .tg-dq1s{font-size:10px;text-align:right;vertical-align:bottom}
.tg .tg-baqh{text-align:center;vertical-align:top}
.tg .tg-cji8{border-color:inherit;font-size:18px;text-align:center;vertical-align:middle}
.tg .tg-c3ow{border-color:inherit;text-align:center;vertical-align:top}
.tg .tg-8hvc{border-color:inherit;font-size:32px;text-align:center;vertical-align:middle}
.tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
.tg .tg-dvpl{border-color:inherit;text-align:right;vertical-align:top}
.tg .tg-nrix{text-align:center;vertical-align:middle}
.tg .tg-0lax{text-align:left;vertical-align:top}
</style>
</head>
<body>
<%@include file="../common/header.jsp"%>
<br>
	<br>
<div align="center">
<table class="tg">
<thead>
  <tr>
    <th class="tg-8hvc" colspan="11">처 &nbsp;&nbsp;&nbsp;&nbsp;   방   &nbsp;&nbsp;&nbsp;&nbsp; 전</th>
    <th class="tg-9wq8" colspan="3">교부번호</th>
    <th class="tg-0pky" colspan="5" style="width: 100px">                         </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-c3ow" style="width: 40px; text-align: center;" >보험종류</td>
    <td class="tg-0pky" style="width: 100px; text-align: center;">①의료보험</td>
    <td class="tg-0pky" style="width: 100px; text-align: center;">②의료급여</td>
    <td class="tg-0pky" style="width: 100px; text-align: center;">③산제보험</td>
    <td class="tg-0pky" style="width: 100px; text-align: center;">④자동차보험</td>
    <td class="tg-0pky" style="width: 100px; text-align: center;">⑤기타(         )</td>
    <td class="tg-c3ow" colspan="5">요양기관번호</td>
    <td class="tg-0pky" colspan="8"></td>
  </tr>
  <tr>
    <td class="tg-9wq8" rowspan="2">환자</td>
    <td class="tg-c3ow">성명</td>
    <td class="tg-0pky" colspan="4"></td>
    <td class="tg-lboi" rowspan="2">의료기관</td>
    <td class="tg-c3ow" colspan="4">명&nbsp;&nbsp;&nbsp;&nbsp;칭</td>
    <td class="tg-0pky" colspan="8"></td>
  </tr>
  <tr>
    <td class="tg-c3ow">출생년도</td>
    <td class="tg-0pky" colspan="4"></td>
    <td class="tg-c3ow" colspan="4">전&nbsp;&nbsp;&nbsp;&nbsp;화</td>
    <td class="tg-0pky" colspan="8"></td>
  </tr>
  <tr>
    <td class="tg-9wq8" rowspan="2">질병<br>분류<br>기호</td>
    <td class="tg-0pky"></td>
    <td class="tg-0pky"></td>
    <td class="tg-0pky"></td>
    <td class="tg-0pky"></td>
    <td class="tg-0pky"></td>
    <td class="tg-0pky"></td>
    <td class="tg-c3ow" colspan="4">약국팩스</td>
    <td class="tg-0pky" colspan="8"></td>
  </tr>
  <tr>
    <td class="tg-0pky"></td>
    <td class="tg-0pky"></td>
    <td class="tg-0pky"></td>
    <td class="tg-0pky"></td>
    <td class="tg-0pky"></td>
    <td class="tg-0pky"></td> 
    <td class="tg-c3ow" colspan="4">e_mail<br>주소</td>
    <td class="tg-0pky" colspan="8"></td>
  </tr>
  <tr>
    <td class="tg-9wq8" rowspan="2">처&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;방<br>의료인의<br>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명</td>
    <td class="tg-dvpl" colspan="4" rowspan="2"><br><br><br>                                                                                     (서명또는 날인)</td>
    <td class="tg-c3ow" colspan="6">면허종별</td>
    <td class="tg-0pky" colspan="8">의사</td>
  </tr>
  <tr>
    <td class="tg-c3ow" colspan="6">면허번호</td>
    <td class="tg-0pky" colspan="8"></td>
  </tr>
  <tr>
    <td class="tg-0pky" colspan="19">※환자의 요구가 있는 때에는 질병분류기호를 기재하지 아니합니다.</td>
  </tr>
  <tr>
    <td class="tg-cji8" colspan="3">처  &nbsp;&nbsp;&nbsp;&nbsp;방 &nbsp;&nbsp;&nbsp;&nbsp; 의&nbsp;&nbsp;  &nbsp;&nbsp;약 &nbsp;&nbsp;&nbsp;&nbsp; 품 &nbsp;&nbsp;&nbsp;&nbsp; 의&nbsp;&nbsp;  &nbsp;&nbsp;명&nbsp;&nbsp;&nbsp;&nbsp;  칭</td>
    <td class="tg-c3ow">1회<br>투여량</td>
    <td class="tg-c3ow">1회<br>투여<br>횟수</td>
    <td class="tg-c3ow">투약<br>일수</td>
    <td class="tg-cji8" colspan="3">용                       별</td>
    <td class="tg-cji8" colspan="10">조&nbsp;&nbsp;&nbsp;&nbsp;제&nbsp;&nbsp;&nbsp;&nbsp;시&nbsp;&nbsp;&nbsp;&nbsp;참&nbsp;&nbsp;&nbsp;&nbsp;고&nbsp;&nbsp;&nbsp;&nbsp;사&nbsp;&nbsp;&nbsp;&nbsp;항</td>
  </tr>
  <tr>
    <td class="tg-0pky" colspan="3"></td>
    <td class="tg-0pky"></td>
    <td class="tg-0pky"></td>
    <td class="tg-0pky"></td>
    <td class="tg-0pky" colspan="3"></td>
    <td class="tg-0pky" colspan="10"></td>
  </tr>
  <tr>
    <td class="tg-c3ow" colspan="19">주사제 처방내역(원내조제 ㅁ, 원외처방ㅁ)</td>
  </tr>
  <tr>
    <td class="tg-0pky">사용기간</td>
    <td class="tg-0pky" colspan="2">교부일로부터(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3&nbsp;&nbsp;&nbsp;&nbsp;)일간</td>
    <td class="tg-0pky" colspan="16">*사용기간내에 약국에 제출하여야 합니다.</td>
  </tr>
  <tr>
    <td class="tg-c3ow" colspan="19">의&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;약&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;품&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;역</td>
  </tr>
  <tr>
    <td class="tg-nrix" rowspan="4">조<br><br>제<br><br>내<br><br>역</td>
    <td class="tg-baqh" colspan="2">조제기관 명칭</td>
    <td class="tg-0lax" colspan="4"></td>
    <td class="tg-nrix" colspan="12">처방의 변경, 수정, 확인대체세 그 내용등</td>
  </tr>
  <tr>
    <td class="tg-baqh" colspan="2">조제약사 성명</td>
    <td class="tg-dq1s" colspan="4">(서명 또는 날인)</td>
    <td class="tg-0lax" colspan="12" rowspan="3"></td>
  </tr>
  <tr>
    <td class="tg-baqh" colspan="2">조　제　량</td>
    <td class="tg-0lax" colspan="4"></td>
  </tr>
  <tr>
    <td class="tg-baqh" colspan="2">조　제　년　월　일</td>
    <td class="tg-0lax" colspan="4"></td>
  </tr>
</tbody>
</table>

</div>
<%@include file="../common/footer.jsp"%>	
</body>
</html>