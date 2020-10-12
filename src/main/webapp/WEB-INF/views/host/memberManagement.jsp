<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>회원관리 페이지</title>

 <!-- Custom fonts for this template-->
  <link href="${path_resources}sb_admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${path_resources}sb_admin/css/sb-admin-2.min.css" rel="stylesheet">

   <!-- Custom styles for this page -->
  <link href="${path_resources}sb_admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
  
</head>
<body id="page-top">

	<!-- header -->
	<%@include file="./host_header.jsp" %>
	<!-- End of header -->
		
		
        <!-- Begin Page Content -->
		<div class="container-fluid">
        <div Style="height:50px"></div>
          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Member Management</h1>
          <p class="mb-4">Host can see a number of member tables below</p>

          <!-- DataTales Example -->          
        
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Member Management</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>NAME</th>
                      <th>ID</th>
                      <th>GENDER</th>
                      <th>BIRTH OF DATE</th>
                      <th>EMAIL ADDRESS</th>
                      <th>PHONE NUMBER</th>
                      <th>DETAIL</th>
                    </tr>
                  </thead>
                  <tbody>
                 <c:forEach var="customer" items="${list}">
                    <tr>
                      <td>${customer.customer_name}</td>
                      <td>${customer.customer_id}</td>
                      <td>${customer.customer_gender}</td> 
                      <td>${customer.customer_year}</td>
                      <td>${customer.customer_email}</td>
                      <td>${customer.customer_phone}</td> 
                      <c:if test="${customer.enabled == 1}">            
                      <td><a href="${path}/admin/memberDetail?customer_id=${customer.customer_id}">상세/조회</a></td>
                      </c:if>
                      <c:if test="${customer.enabled == 0}">
                       <td><span style="color: red;">휴먼상태</span></td>
                      </c:if>                              
                    </tr>
                    
                </c:forEach>
                  
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <!-- /.container-fluid -->

	<!-- Footer -->
	 <%@include file="./host_footer.jsp" %>	
	<!-- End of Footer -->


</body>
 
</html>