<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tagLib.jsp"%>

<style>
.m-menu__item--active>.m-menu__link .m-menu__link-text, .m-menu__item--active>.m-menu__link .m-menu__link-icon  {
	color: #fff !important;
}

.sidebar-info label {
	color: #fff;
	padding: 0px 0px 5px 30px;
	font-size: 16px;
	font-weight: 600;
}
</style>

<div id="m_aside_left" class="m-grid__item m-aside-left m-aside-left--skin-dark ">
	<div id="m_ver_menu" class="m-aside-menu m-aside-menu--skin-dark m-aside-menu--submenu-skin-dark" 
		m-menu-vertical="1" m-menu-scrollable="0" m-menu-dropdown-timeout="500">
		<ul class="m-menu__nav m-menu__nav--dropdown-submenu-arrow">
			<li class="sidebar-info"><label>목록</label></li>
			<li id="monitoring" class="m-menu__item" aria-haspopup="true">
				<a href="${pageContext.request.contextPath}/monitoring/dashboard" class="m-menu__link">
					<i class="m-menu__link-icon flaticon-imac"></i>
					<span class="m-menu__link-title">
						<span class="m-menu__link-wrap">
							<span class="m-menu__link-text">실시간 모니터링</span>
						</span>
					</span>
				</a>
			</li>
			<li id="summary" class="m-menu__item" aria-haspopup="true">
				<a href="${pageContext.request.contextPath}/summary/all" class="m-menu__link">
					<i class="m-menu__link-icon flaticon-line-graph"></i>
					<span class="m-menu__link-title">
						<span class="m-menu__link-wrap">
							<span class="m-menu__link-text">종합요약</span>
						</span>
					</span>
				</a>
			</li>
			<li id="measurement" class="m-menu__item" aria-haspopup="true">
				<a href="${pageContext.request.contextPath}/measurement/list" class="m-menu__link">
					<i class="m-menu__link-icon flaticon-time"></i>
					<span class="m-menu__link-title">
						<span class="m-menu__link-wrap">
							<span class="m-menu__link-text">계측 이력 정보</span>
						</span>
					</span>
				</a>
			</li>
			<li id="alarm" class="m-menu__item" aria-haspopup="true">
				<a href="${pageContext.request.contextPath}/alarm/list" class="m-menu__link">
					<i class="m-menu__link-icon flaticon-music-2"></i>
					<span class="m-menu__link-title">
						<span class="m-menu__link-wrap">
							<span class="m-menu__link-text">알람 이력 정보</span>
						</span>
					</span>
				</a>
			</li>
			<li id="flux" class="m-menu__item m-menu__item--submenu" aria-haspopup="true">
				<a href="javascript:;" class="m-menu__link m-menu__toggle">
					<i class="m-menu__link-icon flaticon-dashboard"></i>
					<span class="m-menu__link-text">유량 분석</span>
					<i class="m-menu__ver-arrow la la-angle-right"></i>	
				</a>
				<div class="m-menu__submenu">
					<span class="m-menu__arrow"></span>
					<ul class="m-menu__subnav">
						<li id="flux_colligation" class="m-menu__item" aria-haspopup="true">
							<a href="${pageContext.request.contextPath}/flux/colligation" class="m-menu__link">
								<i class="m-menu__link-bullet m-menu__link-bullet--dot"><span></span></i>
								<span class="m-menu__link-text">총괄수량수지분석</span>
							</a>
						</li>
						<li id="flux_administration" class="m-menu__item" aria-haspopup="true">
							<a href="${pageContext.request.contextPath}/flux/administration" class="m-menu__link">
								<i class="m-menu__link-bullet m-menu__link-bullet--dot"><span></span></i>
								<span class="m-menu__link-text">검침데이터 관리</span>
							</a>
						</li>
						<li id="flux_demand" class="m-menu__item" aria-haspopup="true">
							<a href="${pageContext.request.contextPath}/flux/demand" class="m-menu__link">
								<i class="m-menu__link-bullet m-menu__link-bullet--dot"><span></span></i>
								<span class="m-menu__link-text">수요패턴분석</span>
							</a>
						</li>
					</ul>
				</div>
			</li>
			<li id="pressure" class="m-menu__item" aria-haspopup="true">
				<a href="javascript:;" class="m-menu__link m-menu__toggle">
					<i class="m-menu__link-icon flaticon-time"></i>
					<span class="m-menu__link-text">수압 분석</span>
					<i class="m-menu__ver-arrow la la-angle-right"></i>	
				</a>
				<div class="m-menu__submenu">
					<span class="m-menu__arrow"></span>
					<ul class="m-menu__subnav">
						<li id="pressure_analysis" class="m-menu__item" aria-haspopup="true">
							<a href="${pageContext.request.contextPath}/pressure/analysis" class="m-menu__link">
								<i class="m-menu__link-bullet m-menu__link-bullet--dot"><span></span></i>
								<span class="m-menu__link-text">수압분석</span>
							</a>
						</li>
						<li id="pressure_distribution" class="m-menu__item" aria-haspopup="true">
							<a href="${pageContext.request.contextPath}/pressure/distribution" class="m-menu__link">
								<i class="m-menu__link-bullet m-menu__link-bullet--dot"><span></span></i>
								<span class="m-menu__link-text">수압분포분석</span>
							</a>
						</li>
						<li id="pressure_pattern" class="m-menu__item" aria-haspopup="true">
							<a href="${pageContext.request.contextPath}/pressure/pattern" class="m-menu__link">
								<i class="m-menu__link-bullet m-menu__link-bullet--dot"><span></span></i>
								<span class="m-menu__link-text">수압패턴분석</span>
							</a>
						</li>
					</ul>
				</div>
			</li>
			<li id="leakage" class="m-menu__item m-menu__item--submenu" aria-haspopup="true">
				<a href="javascript:;" class="m-menu__link m-menu__toggle">
					<i class="m-menu__link-icon fa fa-tint m--padding-left-5"></i>
					<span class="m-menu__link-text">누수 분석</span>
					<i class="m-menu__ver-arrow la la-angle-right"></i>	
				</a>
				<div class="m-menu__submenu">
					<span class="m-menu__arrow"></span>
					<ul class="m-menu__subnav">
						<li id="leakage_analysis" class="m-menu__item" aria-haspopup="true">
							<a href="${pageContext.request.contextPath}/leakage/analysis" class="m-menu__link">
								<i class="m-menu__link-bullet m-menu__link-bullet--dot"><span></span></i>
								<span class="m-menu__link-text">누수분석</span>
							</a>
						</li>
						<li id="leakage_minFlow" class="m-menu__item" aria-haspopup="true">
							<a href="${pageContext.request.contextPath}/leakage/minFlow" class="m-menu__link">
								<i class="m-menu__link-bullet m-menu__link-bullet--dot"><span></span></i>
								<span class="m-menu__link-text">야간최소유량분석</span>
							</a>
						</li>
					</ul>
				</div>
			</li>
			<li id="facility" class="m-menu__item" aria-haspopup="true">
				<a href="${pageContext.request.contextPath}/facility/map" class="m-menu__link">
					<i class="m-menu__link-icon flaticon-placeholder-1"></i>
					<span class="m-menu__link-title">
						<span class="m-menu__link-wrap">
							<span class="m-menu__link-text">시설물 정보</span>
						</span>
					</span>
				</a>
			</li>
			<li id="assessment" class="m-menu__item" aria-haspopup="true">
				<a href="${pageContext.request.contextPath}/assessment/block" class="m-menu__link">
					<i class="m-menu__link-icon flaticon-time"></i>
					<span class="m-menu__link-title">
						<span class="m-menu__link-wrap">
							<span class="m-menu__link-text">건전도 평가</span>
						</span>
					</span>
				</a>
				<%-- <div class="m-menu__submenu">
					<span class="m-menu__arrow"></span>
					<ul class="m-menu__subnav">
						<li id="assessment_block" class="m-menu__item " aria-haspopup="true">
							<a href="${pageContext.request.contextPath}/assessment/block" class="m-menu__link">
								<i class="m-menu__link-bullet m-menu__link-bullet--dot"><span></span></i>
								<span class="m-menu__link-text">블록평가</span>
							</a>
						</li>
						<li id="assessment_pipe" class="m-menu__item " aria-haspopup="true">
							<a href="${pageContext.request.contextPath}/assessment/pipe" class="m-menu__link">
								<i class="m-menu__link-bullet m-menu__link-bullet--dot"><span></span></i>
								<span class="m-menu__link-text">관로평가</span>
							</a>
						</li>
					</ul>
				</div> --%>
			</li>
			<%-- <li id="" class="m-menu__item " aria-haspopup="true">
				<a href="${pageContext.request.contextPath}/monitoring/dashboard" class="m-menu__link">
					<i class="m-menu__link-icon flaticon-users"></i>
					<span class="m-menu__link-title">
						<span class="m-menu__link-wrap">
							<span class="m-menu__link-text">관리자 기능</span>
						</span>
					</span>
				</a>
			</li> --%>
		</ul>
	</div>
</div>

<script>
    var pathName = this.location.pathname;
    var menuName = pathName.split("/")[2];
    var subMenuName = pathName.split("/")[3];
    
    if (menuName == 'leakage' || menuName == 'flux' || menuName == 'pressure') {
    	$("li#" + menuName).addClass("m-menu__item--expanded m-menu__item--open");
    	$("li#" + menuName + "_" + subMenuName).addClass("m-menu__item--active");
    } else {
    	$("li#" + menuName).addClass("m-menu__item--active");
    }
</script>