<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page import ="org.springframework.security.core.userdetails.UserDetails"%>
<%@ page import ="java.util.Collection"%>
<%@ page import ="org.springframework.security.core.GrantedAuthority"%>
<html>
<body>
<%
Collection<? extends GrantedAuthority> authorities = SecurityContextHolder.getContext().getAuthentication().getAuthorities();
String authority = authorities.toString();
%>

<script type="text/javascript">
	if("<%=authority%>" == "[ROLE_DOCTOR]"){
		window.location = "${path}/doctor/doctor_main";
	}else if("<%=authority%>" == "[ROLE_ADMIN]"){
		window.location = "${path}/admin/summary";
	}
</script>

 <%@ include file="./header_error.jsp" %> 
</body>
</html>