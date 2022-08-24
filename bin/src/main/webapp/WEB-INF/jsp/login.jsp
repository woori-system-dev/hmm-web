<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tagLib.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<title>하남미사지구 상수관망 통합관제시스템</title>
<!--begin::Web font -->
<script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js"></script>
<script>
	 WebFont.load({
	 	google: {"families":["Poppins:300,400,500,600,700","Roboto:300,400,500,600,700"]},
	  	active: function() {
	    	sessionStorage.fonts = true;
	   	}
	 });
</script>
<!--end::Web font -->

<c:set var="contextName">${pageContext.request.contextPath}</c:set>

<link href="${contextName}/metronic/vendors/base/vendors.bundle.css" rel="stylesheet" type="text/css" />
<link href="${contextName}/metronic/demo/default/base/style.bundle.css" rel="stylesheet" type="text/css" />

<script src="${contextName}/metronic/vendors/base/vendors.bundle.js" type="text/javascript"></script>
<script src="${contextName}/metronic/demo/default/base/scripts.bundle.js" type="text/javascript"></script>
</head>
<body>
	<div class="m-grid m-grid--hor m-grid--root m-page">
		<div class="m-grid__item m-grid__item--fluid m-grid m-grid--ver-desktop m-grid--desktop m-login m-login--1 m-login--signin" id="m_login">
			<div class="m-grid__item m-login__aside">
				<div class="m-stack m-stack--hor m-stack--desktop">
					<div class="m-stack__item m-stack__item--fluid">
						<div class="m-login__wrapper">
							<div class="m-login__logo">
								<a href="#">
									<img src="${contextName}/images/login/logo.png">
								</a>
							</div>
							<div class="m-login__signin">
								<div class="m-login__head">
									<h3 class="m-login__title">
										Sign In To Admin 
									</h3>
								</div>
								<form class="m-login__form m-form" action="${pageContext.request.contextPath}/login" method="post">
									<div class="form-group m-form__group">
										<input class="form-control m-input" type="text" placeholder="아이디" value="${userId}" name="userId" autocomplete="off">
									</div>
									<div class="form-group m-form__group">
										<input class="form-control m-input m-login__form-input--last" type="password" placeholder="비밀번호" name="password">
									</div>
									<div class="row m-login__form-sub">
										<div class="col m--align-left">
											<label class="m-checkbox m-checkbox--focus">
												<input type="checkbox" name="_remember_userId" checked="checked">
												아이디 저장
												<span></span>
											</label>
										</div>
										<!-- <div class="col m--align-right">
											<a href="javascript:;" id="m_login_forget_password" class="m-link">
												Forget Password ?
											</a>
										</div> -->
									</div>
									<div class="m-login__form-action">
										<button type="submit" id="m_login_signin_submit" class="btn btn-focus m-btn m-btn--pill m-btn--custom m-btn--air">
											로그인
										</button>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="m-stack__item m-stack__item--center">
						<div class="m-login__account">
							<a href="javascript:;" id="m_login_signup" class="m-link m-link--focus m-login__account-link">
								비밀번호 변경
							</a>
						</div>
					</div>
				</div> 
			</div>
			<div class="m-grid__item m-grid__item--fluid m-grid m-grid--center m-grid--hor m-login__content" 
				style="background-image: url(${contextName}/images/login/bg-5.jpg)">
				<div class="m-grid__item m-grid__item--middle">
					<h1 class="m-login__welcome">
						하남미사 상수관망 통합관제시스템
					</h1>
					<p class="m-login__msg text-right">
						Oasis+
						<br>
						version 1.0
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>