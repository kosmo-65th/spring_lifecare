<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<html>
<title>게시판관리</title>
</head>
<body id="page-top">
	
  <!-- Page Wrapper -->
 	<div id="wrapper">
 		<c:set var="where" value="${path}/board/adminboardList"/>
		<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">게시판 관리</h1>

          <!-- DataTales Example -->
         
          <div class="card shadow mb-4">
            <div class="card-header py-3">
            </div>
            <div class="card-body">
              <div class="table-responsive">
              <!-- 리스트 -->
		<div class="contents_box">
			<table width="100%" cellpadding="0" cellspacing="0" class="table table-bordered">
				<colgroup>
					<col width="10%">
					<col width="40%">
					<col width="10%">
					<col width="5%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
						<th>답변확인</th>
					</tr>
				</thead>
				<tbody>
					 <c:forEach var="board" items="${boards}">
						<tr>
							<td>${board.rNum}</td>
							<td class="left">
								<a href="${path}/board/adminboardcontent?board_sortnum=${board.board_sortnum }">${board.board_subject}</a>
							</td>
							<td>${board.customer_id }</td>
							<td><fmt:formatDate type = "both" pattern = "yyyy-MM-dd" value = "${board.board_writedate}" /></td>
							<td>${board.board_replycode}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</form>
		</div>
		<!-- //리스트 -->
              </div>
            </div>
          </div>
        </div>
        
        
        <table style="width:1500px" align="center">
        <tr>
            <th align="center">
                <!-- 게시글이 있으면  -->
                <c:if test="${cnt>0 }">
                    <!-- 처음[◀◀]/이전블록[◀] 특수문자 : 한글상태 ㅁ+한자키 -->
                     <a href="${path}/board/adminboardList?currentPage=${(startPage - pageBlock)>0 ? (startPage - pageBlock) : 1 }&search=${param.search }&pageSize=${(pageSize) ? pageSize : 10 }"> [◀◀] </a>
                     <a href="${path}/board/adminboardList?currentPage=${(currentPage - 1)>0 ? (currentPage - 1) : 1 }&search=${param.search }&pageSize=${(pageSize) ? pageSize : 10 }"> [◀] </a>
                    
                    <!-- 블록내의 페이지 번호 -->
                    <c:forEach var="i" begin="${startPage }" end="${endPage }">
                        <c:if test="${i==currentPage }">
                            <span><b>[${i }]</b></span>
                        </c:if>
                        <c:if test="${i!=currentPage }">
                            <a href="${path }/board/adminboardList?currentPage=${ i}&search=${param.search }&pageSize=${(pageSize) ? pageSize : 10 }">[${i }]</a>
                        </c:if>
                    </c:forEach>
                    
                    <!-- 다음[▶]/마지막[▶▶] 특수문자 : 한글상태 ㅁ+한자키 -->
                    <a href="${path }/board/adminboardList?currentPage=${(pageCount - currentPage-1)>0 ? (currentPage+1) : endPage }&search=${param.search }&pageSize=${(pageSize) ? pageSize : 10 }"> [▶] </a>
                    <a href="${path }/board/adminboardList?currentPage=${(startPage +pageBlock)>pageCount ? pageCount : startPage +pageBlock}&search=${param.search }&pageSize=${(pageSize) ? pageSize : 10 }"> [▶▶] </a>
                    
                </c:if>
            </th>
        </tr>
        	<br>
     			 <br>
          <form action="${path}/board/adminboardList" name="deliverList" method="get">
              <div style="text-align:center;">serach : 
              	<input type="text" name="search" value="${param.search}">
              	<input type="submit" value="검색">
              </div>
              </form>
    </table>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
     
<!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

</body>
</html>