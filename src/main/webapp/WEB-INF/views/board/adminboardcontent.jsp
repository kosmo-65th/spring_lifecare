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
      		<h3 class="m-0 font-weight-bold text-primary">${board.board_subject}</h3>
      		<p class="date">${board.customer_id }<span> l </span>${board.board_replydate} <i class="view"> </i></p>
               </div>
   		  <div class="card-body">
           <div class="table-responsive">
            <!-- 리스트 -->
			<!-- 내용 -->
			
					<div class="contents_box con_board_view">
						<!-- 질문 -->
						<div class="qna_q">
							<div class="board_view_txt">
								<p> ${board.board_content }</p>
							</div>
						</div>
						<!-- //질문 -->
		<!-- //리스트 -->
              </div>
            </div>
	            <a href="#" class="btn btn-danger btn-icon-split" onclick="del();">
	               <span class="icon text-white-50">
	                 <i class="fas fa-trash"></i>
	               </span>
	               <span class="text">삭제하기</span>
	           </a>
	          <c:if test ="${board.board_replycode =='X' }">
	          	
	          	 <a href="#" class="btn btn-primary btn-icon-split" onclick="re(); ">
	               <span class="icon text-white-50">
	                 <i class="fas fa-check"></i>
	               </span>
	               <span class="text">답변달기</span>
	             </a>
	          </c:if>
          </div>
        </div>
       
       
       <div id="makeRe" style="display:none">
   		<div class="card shadow mb-4">
      		<div class="card-header py-3">
      		<h3 class="m-0 font-weight-bold text-primary"><span>RE: </span>${board.board_subject}에 대한 답변 입니다.</h3>
               </div>
   		  <div class="card-body">
           <div class="table-responsive">
            <!-- 리스트 -->
			<!-- 내용 -->
			
					<div class="contents_box con_board_view">
						<!-- 질문 -->
						<div class="qna_q">
							<div class="board_view_txt" id="adminboardreply">
								<textarea name='re_content' id='adminboardcontent' cols='30' rows='5'></textarea>
							</div>
						</div>
						<!-- //질문 -->
		<!-- //리스트 -->
              </div>
            </div>
            <a href="#" class="btn btn-danger btn-icon-split" onclick="re_cancel();">
	               <span class="icon text-white-50">
	                 <i class="fas fa-trash"></i>
	               </span>
	               <span class="text">답변취소</span>
	        </a>
            <a href="#" class="btn btn-primary btn-icon-split" onclick="re_make();">
	               <span class="icon text-white-50">
	                 <i class="fas fa-flag"></i>
	               </span>
	               <span class="text">답변등록</span>
	        </a>
          </div>
        </div>
   </div>
        
       
        	
      <c:if test ="${board.board_replycode =='Y' }">
   		  <div class="card shadow mb-4">
      		<div class="card-header py-3">
      		<h3 class="m-0 font-weight-bold text-primary"><span>RE: </span>${board.board_subject}에 대한 답변 입니다.</h3>
      		<p class="date">HOST<span> l </span>${board.board_replydate } <i class="view"> </i></p>
               </div>
   		  <div class="card-body">
           <div class="table-responsive">
            <!-- 리스트 -->
			<!-- 내용 -->
			
					<div class="contents_box con_board_view">
						<!-- 질문 -->
						<div class="qna_q">
							<div class="board_view_txt" id="adminboardcontent">
								${board.board_reply }
							</div>
						</div>
						<!-- //질문 -->
		<!-- //리스트 -->
              </div>
            </div>
            <a href="#" class="btn btn-danger btn-icon-split" onclick="re_del();">
	               <span class="icon text-white-50">
	                 <i class="fas fa-trash"></i>
	               </span>
	               <span class="text">삭제하기</span>
	        </a>
            <a href="#" class="btn btn-primary btn-icon-split" onclick="re();">
	               <span class="icon text-white-50">
	                 <i class="fas fa-flag"></i>
	               </span>
	               <span class="text">수정하기</span>
	        </a>
          </div>
        </div>
       </c:if>
      <!-- End of Main Content -->
    </div>
   </div>
   
   
   
   
<!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

</body>
</html>