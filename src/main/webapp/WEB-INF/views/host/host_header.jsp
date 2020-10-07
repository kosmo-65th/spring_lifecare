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

  <!-- Custom fonts for this template-->
  <link href="${path_resources}sb_admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${path_resources}sb_admin/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${path}/admin/summary">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">LIFECARE</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="${path}/admin/summary">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>결산</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">


	 


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

       <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="${path}/admin/doctorManagement">
          <i class="fas fa-fw fa-table"></i>
          <span>Board Management</span></a>
      </li>
      
      <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="javascript:document.getElementById('logout-form').submit();" >
         <form id="logout-form" action="${path}/logout" method="POST">
		 <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
		</form>
          <i class="fas fa-fw fa-table"></i>
          <span>Logout</span></a>
      </li>
      
      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block"/>

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

  

</body>
</html>