<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
  <!-- taglib -->  
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  

  <c:set var="path" value="${pageContext.request.contextPath}"/>
  <c:set var="path_resources" value="/lifecare/resources/"/>
  <c:set var="path_resources_lifecare" value="/lifecare/resources/lifecare/" />
  <c:set var="path_resources_asset" value="/lifecare/resources/asset/" />
	 <c:set var="path_resources_customcss" value="/lifecare/resources/customcss/" />
	<script src="${path_resources}setting/jquery-3.5.1.js"></script>
	
	<!-- Site Icons -->
	<link rel="shortcut icon" href="${path_resources_lifecare}images/fevicon.ico.png" type="image/x-icon" />
	<link rel="apple-touch-icon" href="${path_resources_lifecare}images/apple-touch-icon.png">
	<!-- Site Icons -->
	
	

