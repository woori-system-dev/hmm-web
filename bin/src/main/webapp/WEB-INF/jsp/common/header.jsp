<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tagLib.jsp" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
.m-page--fluid .m-header {
	/* background: #282a3c; */
}

.m-header-menu.m-header-menu--skin-light .m-menu__nav>.m-menu__item>.m-menu__link .m-menu__link-text,
.m-header-menu.m-header-menu--skin-light .m-menu__nav>.m-menu__item>.m-menu__link .m-menu__link-icon {
	color: #fff !important;
}

.m-header-menu {
	width: 92%;
}

.header-title {
	text-align: center !important;
	color: #747474;
	font-size: 20px;
	font-weight: 600;
}

.font-size {
	font-size: 32px;
}
</style>

<sec:authentication property="principal" var="user"></sec:authentication>

<header id="m_header" class="m-grid__item m-header" m-minimize-offset="200" m-minimize-mobile-offset="200">
	<div class="m-container m-container--fluid m-container--full-height">
		<div class="m-stack m-stack--ver m-stack--desktop">
			<div class="m-stack__item m-brand  m-brand--skin-dark ">
				<div class="m-stack m-stack--ver m-stack--general">
					<div class="m-stack__item m-stack__item--middle m-brand__logo">
						<a href="${pageContext.request.contextPath}/monitoring/dashboard" class="m-brand__logo-wrapper">
							<img alt="" src="../images/logo_default_dark.png">
						</a>
					</div>
					<div class="m-stack__item m-stack__item--middle m-brand__tools">
						<!-- BEGIN: Left Aside Minimize Toggle -->
						<a href="javascript:;" id="m_aside_left_minimize_toggle" class="m-brand__icon m-brand__toggler m-brand__toggler--left m--visible-desktop-inline-block">
							<span></span>
						</a>
						<!-- END -->
						<!-- BEGIN: Responsive Aside Left Menu Toggler -->
						<a href="javascript:;" id="m_aside_left_offcanvas_toggle" class="m-brand__icon m-brand__toggler m-brand__toggler--left m--visible-tablet-and-mobile-inline-block">
							<span></span>
						</a>
						<!-- END -->
						<!-- BEGIN: Topbar Toggler -->
						<a id="m_aside_header_topbar_mobile_toggle" href="javascript:;" class="m-brand__icon m--visible-tablet-and-mobile-inline-block">
							<i class="flaticon-more"></i>
						</a>
						<!-- BEGIN: Topbar Toggler -->
					</div>
				</div>
			</div>
			<div class="m-stack__item m-stack__item--fluid m-header-head">
				<div class="m-header-menu">
					<ul class="m-menu__nav">
						<li class="m-menu__item header-title">
							<i class="flaticon-imac"></i>
							<span>&nbsp;&nbsp;하남미사지구 상수관망 통합관제시스템</span>
						</li>
					</ul>
				</div>
			
				<div class="m-topbar  m-stack m-stack--ver m-stack--general">
					<div class="m-stack__item m-topbar__nav-wrapper">
						<ul class="m-topbar__nav m-nav m-nav--inline">
							<li class="m-nav__item m-topbar__user-profile m-topbar__user-profile--img m-dropdown m-dropdown--medium m-dropdown--arrow 
									m-dropdown--header-bg-fill m-dropdown--align-right m-dropdown--mobile-full-width m-dropdown--skin-light" 
									m-dropdown-toggle="click" aria-expanded="true">
								<a href="#" class="m-nav__link m-dropdown__toggle">
									<span class="m-topbar__userpic">
										<i class="la la-sign-out font-size"></i>
									</span>
								</a>
								<div class="m-dropdown__wrapper">
									<span class="m-dropdown__arrow m-dropdown__arrow--right m-dropdown__arrow--adjust" style="left: auto; right: 12.5px;"></span>
									<div class="m-dropdown__inner">
										<div class="m-dropdown__header m--align-center" style="background: url(../images/user_profile_bg.jpg); background-size: cover;">
											<div class="m-card-user m-card-user--skin-dark">
												<div class="m-card-user__details">
													<span class="m-card-user__name m--font-weight-500">
														${user.userName}
													</span>
													<a href="" class="m-card-user__email m--font-weight-300 m-link">
														${user.loginId}
													</a>
												</div>
											</div>
										</div>
										<div class="m-dropdown__body">
											<div class="m-dropdown__content">
												<ul class="m-nav m-nav--skin-light">
													<li class="m-nav__item">
														<a href="${pageContext.request.contextPath}/user/profile" class="m-nav__link">
															<i class="m-nav__link-icon flaticon-profile-1"></i>
															<span class="m-nav__link-title">  
																<span class="m-nav__link-wrap">      
																	<span class="m-nav__link-text">My Profile</span>      
																</span>
															</span>
														</a>
													</li>
													<li class="m-nav__separator m-nav__separator--fit"></li>
													<li class="m-nav__item">
														<a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-danger m-btn m-btn--pill m-btn--wide">
															Logout
														</a>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div> 
</header>
