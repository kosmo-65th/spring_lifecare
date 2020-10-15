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
<title>의사 상세정보</title>

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
          <h1 class="h3 mb-2 text-gray-800">의사정보</h1>
          <p class="mb-4">관리자는 회원정보를 보실 수 있습니다.</p>

           <!-- DataTales Example -->          
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">${doctor.getDoctor_name()}님의 개인정보</h6>
            </div><br>
      

   			 <!-- End of Sidebar -->
		      <div class="col-xl-6 col-md-6 mb-4">
		       <form action="${path}/admin/doctorDeletePro" name="doctorInfo" method="post">
			   <input type = "hidden" name="${_csrf.parameterName}" value = "${_csrf.token}">
	          <div class="card shadow mb-4">
	            <div class="card-body">
	                <table class="table table-bordered" width="800px" cellspacing="0">
	                  <tbody>
	                <tr>
						<th><label for="img">이미지 </label></th>
						<td><img src="${path_resources}img/${doctor.getDoctor_faceimg()}" alt="profile photo" class="circle float-left profile-photo" width="100" height="auto"></td> 
									
					</tr>
					<tr>
						<th><label for="id"> 아이디  </label></th>
						<td colspan="2"><input type="text" size="30" name="doctor_id" value="${doctor.getDoctor_id()}" readonly></td>
					</tr>
					<tr>
						<th><label for="name"> 이름  </label></th>
						<td colspan="2"><input type="text" size="30" name="doctor_name" value="${doctor.getDoctor_name()}" readonly></td>
					</tr>
					<tr>
						<th><label for="num">면허 번호</label></th>
						<td><input type="text" name="text" name="doctor_num" value="${doctor.getDoctor_num()}" readonly></td>
									
					</tr>
					
					<tr>
						<th><label for="email"> 이메일 </label></th>
						<td><input type="text" size="30" name="doctor_email" value="${doctor.getDoctor_email()}" readonly></td>
					</tr>
					<tr>
						<th><label for="phone"> 핸드폰번호 </label></th>
						<td><input type="text" name="customer_phone" size="20" value="${doctor.getDoctor_phone()}" readonly>
						</td>			
					</tr>
					<tr>
						<th><label for="position">직책</label></th>
						<td><input type="text" size="30" name="doctor_position" value="${doctor.getDoctor_position()}" readonly></td>
					</tr>
					<tr>
						<th><label for="major">전공</label></th>
						<td><input type="text" name="doctor_major" size="20" value="${doctor.getDoctor_major()}" readonly>
						</td>			
					</tr>					
					<tr>
						<td colspan="3" >
							<input type="submit" value="퇴사 승인">
							<a href="${path}/admin/doctorManagement"><input type="button" value="의사 목록 보기"></a>
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