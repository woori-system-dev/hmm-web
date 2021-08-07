<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tagLib.jsp" %>

<!DOCTYPE html>
<html>
<tiles:insertAttribute name="head"/>

<body class="m-page--fluid m--skin- m-content--skin-light2 m-header--fixed m-header--fixed-mobile m-aside-left--enabled m-aside-left--skin-dark m-aside-left--offcanvas m-aside--offcanvas-default">
	<div class="m-grid m-grid--hor m-grid--root m-page">
		<tiles:insertAttribute name="header"/>
		
		<div class="m-grid__item m-grid__item--fluid m-grid m-grid--ver-desktop m-grid--desktop m-body">
			<tiles:insertAttribute name="sidebar"/>
			
			<tiles:insertAttribute name="content"/>
		</div>
	</div>
	
	<div id="m_scroll_top" class="m-scroll-top">
		<i class="la la-arrow-up"></i>
	</div>
	
	<div class="loading-container display-none">
		<div class="loading"></div>
		<div id="loading-text">조회 중...</div>
	</div>
</body>
</html>
