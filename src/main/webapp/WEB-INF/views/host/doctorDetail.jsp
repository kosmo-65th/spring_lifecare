<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/setting/setting.jsp"%>
<!DOCTYPE html>
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

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Doctor Management</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="index.html">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Interface
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>Components</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Components:</h6>
            <a class="collapse-item" href="buttons.html">Buttons</a>
            <a class="collapse-item" href="cards.html">Cards</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>Utilities</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Utilities:</h6>
            <a class="collapse-item" href="utilities-color.html">Colors</a>
            <a class="collapse-item" href="utilities-border.html">Borders</a>
            <a class="collapse-item" href="utilities-animation.html">Animations</a>
            <a class="collapse-item" href="utilities-other.html">Other</a>
          </div>
        </div>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Addons
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-folder"></i>
          <span>Pages</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Login Screens:</h6>
            <a class="collapse-item" href="login.html">Login</a>
            <a class="collapse-item" href="register.html">Register</a>
            <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
            <div class="collapse-divider"></div>
            <h6 class="collapse-header">Other Pages:</h6>
            <a class="collapse-item" href="404.html">404 Page</a>
            <a class="collapse-item" href="blank.html">Blank Page</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="charts.html">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Charts</span></a>
      </li>
      
        <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="${path}/admin/memberManagement">
          <i class="fas fa-fw fa-table"></i>
          <span>Member Management</span></a>
      </li>
     
       <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="${path}/admin/doctorManagement">
          <i class="fas fa-fw fa-table"></i>
          <span>Doctor Management</span></a>
      </li>
      
       <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
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
	      <!-- /.container-fluid -->
      <!-- End of Main Content -->
</body>
 <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2020</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer --> 		 
</html>