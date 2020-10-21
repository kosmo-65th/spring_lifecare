<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<html>
</head>
<body id="page-top">
<%@include file="../host/host_header.jsp" %>

<!-- Begin Page Content -->
<div class="container-fluid">
      <div Style="height:50px"></div>

<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800">Q&A Management</h1>
<p class="mb-4">Response to customer Q&A and bulletin board management</p>

<!-- DataTales Example -->
<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h6 class="m-0 font-weight-bold text-primary">Q&A Management</h6>
  </div>
	
 <!-- Page Wrapper -->
 	<div id="wrapper">
 		<c:set var="where" value="${path}/board/adminboardList"/>
		<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800"></h1>

          <!-- DataTales Example -->
         
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 style="float:right" class="m-0 font-weight-bold text-primary" >검색 ${cnt}건</h6>
              <br>
              <form action="${path}/board/adminboardList" name="deliverList" method="get">
              <div style="text-align:right;">검색어 : 
              	<input type="text" name="search" value="${param.search }">
              	<input type="submit" value="검색">
              </div>
              </form>
            </div>
            <div class="card-body">
              <div class="table-responsive">
              <!-- 리스트 -->
		<div class="contents_box">
			<table width="100%" cellpadding="0" cellspacing="0" class="table table-bordered">
				<colgroup>
					<col style="text-align:center">
					<col style="text-align:center">
					<col style="text-align:center">
					<col style="text-align:center">
					<col style="text-align:center">
					
				</colgroup>
				<thead>
					<tr>
						<th style="text-align:center">번호</th>
						<th style="text-align:center">제목</th>
						<th style="text-align:center">작성자</th>
						<th style="text-align:center">등록일</th>
						<th style="text-align:center">답변확인</th>
					</tr>
				</thead>
				<tbody>
					 <c:forEach var="board" items="${boards}">
						<tr>
							<td style="text-align:center">${number}
							<c:set var = "number" value = "${number - 1}"/>
							</td>
							<td class="left" style="text-align:center">
								<a href="${path}/board/adminboardcontent?board_sortnum=${board.board_sortnum }">${board.board_subject}</a>
							</td>
							<td style="text-align:center">${board.customer_id }</td>
							<td style="text-align:center"><fmt:formatDate type = "both" pattern = "yyyy-MM-dd" value = "${board.board_writedate}" /></td>
							<td style="text-align:center">${board.board_replycode}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- //리스트 -->
		   <table style="width:120px" align="center">
        <tr>
            <th align="center">
                <!-- 게시글이 있으면  -->
                <c:if test="${cnt>0 }">
                    			<!-- 처음[◀◀] / 이전블록[◀] -->
					<c:if test="${startPage > pageBlock}">
						<a href = "${path}/board/adminboardList?currentPage=">[◀◀]</a>
						<a href = "${path}/board/adminboardList?currentPage=${startPage - pageBlock}">[◀]</a>
					</c:if>
                    <!-- 블록내의 페이지 번호 -->
                    <c:forEach var="i" begin="${startPage }" end="${endPage }">
                        <c:if test="${i==currentPage }">
                            <span><b>[${i }]</b></span>
                        </c:if>
                        <c:if test="${i!=currentPage }">
                            <a href="${path}/board/adminboardList?currentPage=${ i}&search=${param.search }&pageSize=${(pageSize) ? pageSize : 10 }">[${i }]</a>
                        </c:if>
                    </c:forEach>
                    
       		<c:if test="${pageCount > endPage}">
				<a href = "${path}/board/adminboardList?currentPage=${startPage + pageBlock}">[▶]</a>
				<a href = "${path}/board/adminboardList?currentPage=${pageCount}">[▶▶]</a>
			</c:if>
                </c:if>
            </th>
        </tr>
    </table>
              </div>
            </div>
          </div>
        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
     
<!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

</body>
</html>