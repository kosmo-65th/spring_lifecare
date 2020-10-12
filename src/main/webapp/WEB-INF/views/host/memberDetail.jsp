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

<title>회원 상세정보</title>

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
          <h1 class="h3 mb-2 text-gray-800">Personal Information</h1>
          <p class="mb-4">Host can see member's personal information below</p>

           <!-- DataTales Example -->          
        
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">${customer.getCustomer_name()}'s personal information</h6>
            </div><br>

   			 <!-- End of Sidebar -->
		      <div class="col-xl-6 col-md-6 mb-4"  >
       <form action="${path}/admin/memberDeletePro" name="memberInfo" method="post">
	   <input type = "hidden" name="${_csrf.parameterName}" value = "${_csrf.token}">
	          <div class="card shadow mb-4">
	            <div class="card-body">
	                <table class="table table-bordered" width="800px" cellspacing="0" style="margin: 0 auto;">
	                  <tbody>
					<tr>
						<th><label for="id"> 아이디  </label></th>
						<td colspan="2"><input type="text" size="30" name="customer_id" value="${customer.getCustomer_id()}" readonly></td>
					</tr>
					<tr>
						<th><label for="name"> 이름  </label></th>
						<td colspan="2"><input type="text" size="30" name="customer_name" value="${customer.getCustomer_name()}" readonly></td>
					</tr>
					<tr>
						<th><label for="birth"> 출생년도</label></th>
						<td><input type="text" name="birth" name="customer_year" value="${customer.getCustomer_year()}" readonly></td>
									
					</tr>
					<tr>
						<th><label for="gender"> 성별 </label></th>
						<td><input type="text" name="customer_gender" value="${customer.getCustomer_gender()}" readonly></td>
					</tr>
					<tr>
						<th><label for="email"> 이메일 </label></th>
						<td><input type="text" size="30" name="customer_email" value="${customer.getCustomer_email()}" readonly></td>
					</tr>
					<tr>
						<th><label for="phone"> 핸드폰번호 </label></th>
						<td><input type="text" name="customer_phone" size="20" value="${customer.getCustomer_phone()}" readonly>
						</td>			
					</tr>					
					<tr>
						<td colspan="3">
							<input type="submit" value="회원 휴먼 처리">
							<a href="${path}/admin/memberManagement"><input type="button" value="회원 목록 보기" ></a>
						</td>
					</tr>
	                  </tbody>
	                </table>
	              </div>
	             </div>
	            </form>
	          </div>
	      </div>
        </div>
        <!-- /.container-fluid -->

	<!-- Footer -->
	 <%@include file="./host_footer.jsp" %>	
	<!-- End of Footer -->


</body>
 
</html>