<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tagLib.jsp"%>

<style>
.map {
	height: 760px;
}

.m-portlet .m-portlet__body {
	padding: 1rem 1rem;
}

.m-portlet .row {
	margin-left: 0;
	margin-right: 0;
}

.btn {
	line-height: 0.8;
}

.monitoring-body {
	padding: 0px 5px 10px 5px !important;
}

.monitoring-box table td {
	padding: .40rem .50rem !important;
}
</style>

<div class="m-grid__item m-grid__item--fluid m-wrapper">
	<div class="m-subheader">
		<div class="d-flex align-items-center">
			<div class="mr-auto">
				<h3 class="m-subheader__title">
					실시간 모니터링
				</h3>
			</div>
		</div>
	</div>
	<div class="m-content">
		<div class="row">
			<div class="col-md-6">
				<div class="m-portlet">
					<div class="m-portlet__body">
						<div id="map" class="map"></div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="m-portlet">
					<div class="m-portlet__body row">
						<c:forEach var="list" items="${blockList}" varStatus="domain">
							<div class="col-md-3 monitoring-body">
								<div class="monitoring-box block-normal">
									<table class="table table-bordered" style="line-height:1.4;">
										<thead>
											<tr>
												<th colspan="3">${list.bkNm}</th>
											</tr>
										</thead>
										<tbody>
											<tr class="text-right">
												<td colspan="3">
													<span id="pressure_${list.flctcFm}" class="m--font-boldest"></span>&nbsp;&nbsp;kg/cm²
												</td>
											</tr>
											<tr class="text-right">
												<td colspan="3">
													<span id="flow_${list.flctcFm}" class="m--font-boldest"></span>&nbsp;&nbsp;㎥/h
												</td>
											</tr>
											<tr>
												<td class="block-detail-normal">
													<button class="btn m-btn m-btn--hover-info m-btn--icon m-btn--icon-only m-btn--pill">
														<i class="fa fa-wrench font-white"></i>
													</button>
												</td>
												<td class="block-detail-normal">
													<button class="btn m-btn m-btn--hover-info m-btn--icon m-btn--icon-only m-btn--pill">
														<i class="flaticon-dashboard font-white"></i>
													</button>
												</td>
												<td class="block-detail-normal">
													<button class="btn m-btn m-btn--hover-info m-btn--icon m-btn--icon-only m-btn--pill">
														<i class="fa fa-moon-o font-white"></i>
													</button>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	var map = makeMap("map");

	var blockList = [];

	$.ajax({
		url: contextPath + "/monitoring/getBlockList",
		type: "get",
		dataType: "json",
		success: function(response) {
			blockList = response;
			$.each(response, function(idx, value) {
				var vectorLayer = makeVectorLayer(value);
				map.addLayer(vectorLayer);
			});

			getRealTimeMeasurement();

			//웹페이지 갱신
			window.setInterval(getRealTimeMeasurement, 1000 * 10);
	   	}
	});

 	function getRealTimeMeasurement() {
		$.each(blockList, function(idx, blockSmall) {
			$.ajax({
				url: contextPath + "/monitoring/getRealTimeMeasurement",
				type: "get",
				data: {"blockId": blockSmall.flctcFm},
				dataType: "json",
				success: function(response) {
					$("#pressure_" + blockSmall.flctcFm).text(response.pressure);
					$("#flow_" + blockSmall.flctcFm).text(response.flow);
			   	}
			});
		});
	}
});
</script>