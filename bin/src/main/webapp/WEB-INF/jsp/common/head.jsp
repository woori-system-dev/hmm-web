<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tagLib.jsp" %>

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
	
	<script type="text/javascript">
	    var contextPath = "${pageContext.request.contextPath}";
	</script>
	
	<link href="${contextName}/metronic/vendors/custom/datatables/datatables.bundle.css" rel="stylesheet" type="text/css" />
	
	<link href="${contextName}/metronic/vendors/base/vendors.bundle.css" rel="stylesheet" type="text/css" />
	<link href="${contextName}/metronic/demo/default/base/style.bundle.css" rel="stylesheet" type="text/css" />
	
	<link href="${contextName}/css/common.css" rel="stylesheet" type="text/css" />
	<link href="${contextName}/css/loading.css" rel="stylesheet" type="text/css" />
	
	<!--begin::Base Scripts -->
	<script src="${contextName}/metronic/vendors/base/vendors.bundle.js" type="text/javascript"></script>
	<script src="${contextName}/metronic/demo/default/base/scripts.bundle.js" type="text/javascript"></script>
	
	<script src="${contextName}/metronic/vendors/custom/datatables/datatables.bundle.js" type="text/javascript"></script>
	<!--end::Base Scripts -->   
	
	<!-- Amcharts Resources -->
	<script src="${contextName}/js/charts/amcharts/amcharts.js" type="text/javascript"></script>
	<script src="${contextName}/js/charts/amcharts/serial.js" type="text/javascript"></script>
	<script src="${contextName}/js/charts/amcharts/gantt.js" type="text/javascript"></script>
	<script src="${contextName}/js/charts/amcharts/pie.js" type="text/javascript"></script>
	<script src="${contextName}/js/charts/amcharts/gauge.js" type="text/javascript"></script>
	<script src="${contextName}/js/charts/amcharts/themes/light.js"></script>
	<link href="${contextName}/js/charts/amcharts/plugins/export/export.css" rel="stylesheet" type="text/css" />
	<script src="${contextName}/js/charts/amcharts/plugins/export/export.min.js" type="text/javascript"></script>
	
	<!-- Highcharts Resources -->
	<script src="${contextName}/js/charts/highcharts/highcharts.js"></script>
	<script src="${contextName}/js/charts/highcharts/modules/exporting.js"></script>
	<script src="${contextName}/js/charts/highcharts/modules/export-data.js"></script>
	
	<!-- Custom Charts Resources -->
	<script src="${contextName}/js/common/amcharts/dualChart.js" type="text/javascript"></script>
	<script src="${contextName}/js/common/amcharts/lineChart.js" type="text/javascript"></script>
	<script src="${contextName}/js/common/amcharts/pieChart.js" type="text/javascript"></script>
	<script src="${contextName}/js/common/amcharts/ganttChart.js" type="text/javascript"></script>
	<script src="${contextName}/js/common/amcharts/gaugeChart.js" type="text/javascript"></script>
	<script src="${contextName}/js/common/highcharts/dualChart.js" type="text/javascript"></script>
	<script src="${contextName}/js/common/highcharts/lineChart.js" type="text/javascript"></script>
	<script src="${contextName}/js/common/highcharts/pieChart.js" type="text/javascript"></script>
	
	<!-- moment Resources -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
	<script src="//cdn.jsdelivr.net/momentjs/latest/moment-with-locales.min.js" type="text/javascript"></script>
	
	<!-- openlayers -->
	<link rel="stylesheet" href="https://openlayers.org/en/v4.6.5/css/ol.css" type="text/css">
	<script src="https://cdn.polyfill.io/v2/polyfill.min.js?features=requestAnimationFrame,Element.prototype.classList,URL"></script>
	<script src="https://openlayers.org/en/v4.6.5/build/ol.js"></script>
	
	<!-- Custom Charts Resources -->
	<script src="${contextName}/js/common/map.js" type="text/javascript"></script>
	<script src="${contextName}/js/common/table.js" type="text/javascript"></script>
	<script src="${contextName}/js/common/ko.js" type="text/javascript"></script>
	<script src="${contextName}/js/common/summary.js" type="text/javascript"></script>
</head>