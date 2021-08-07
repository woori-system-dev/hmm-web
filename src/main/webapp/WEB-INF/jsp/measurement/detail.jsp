<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tagLib.jsp"%>

<style>
.m-portlet .m-portlet__head .m-portlet__head-caption .m-portlet__head-title .m-portlet__head-text {
	font-weight: 600;
}

.m-portlet {
	margin-bottom: 1.8rem;
}

.m-portlet .m-portlet__body {
	padding: 2.0rem;
}

.custom-portlet-body {
	padding: 1.3rem 1.6rem !important;
}

.monitoring-time {
	font-size: 1.3rem;
	font-weight: 400 !important;
}

.monitoring-box {
	margin-top: 3px;
}

.statistics-text {
	color: #FF5E00;
	font-weight: 500;
}

.col-lg-5 {
	padding-left: 0px;
	padding-right: 0px;
}

.col-form-label {
	font-weight: 600;
}

.m--font-boldest {
	font-size: 20px;
}

.chart-container {
	width: 100%;
	height: 250px;
	margin-top: 35px;
}

.chart-detail-container {
	width: 100%;
	height: 685px;
}
</style>

<div class="m-grid__item m-grid__item--fluid m-wrapper">
	<div class="m-subheader"> 
		<div class="d-flex align-items-center">
			<div class="mr-auto">
				<h3 class="m-subheader__title">
					계측 이력 정보
				</h3>
			</div>
		</div>
	</div>
	<div class="m-content">
		<div class="row">
			<div class="col-xl-2">
				<div class="m-portlet m-portlet--head-sm">
					<div class="m-portlet__head">
						<div class="m-portlet__head-caption">
							<div class="m-portlet__head-title">
								<span class="m-portlet__head-icon">
									<i class="flaticon-search-1"></i>
								</span> 
								<h3 class="m-portlet__head-text">검색 조건 설정</h3>
							</div>
						</div>
					</div>
					<div class="m-portlet__body">
						<form class="m-form m-form--fit">
							<div class="form-group">
								<label class="m--font-boldest" for="blockSelect">블록명</label> 
								<select class="form-control m-input" id="blockSelect">
									<c:forEach var="block" items="${blockList}" varStatus="status">
		           						<option value="${block.flctcFm}">${block.bkNm}</option>
		           					</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label class="m--font-boldest" for="startDatePicker">시작시간</label>
								<input type="text" class="form-control m-input" id="startDatePicker" readonly value="${currentTime}"/>
							</div>
							<div class="form-group">
								<label class="m--font-boldest" for="endDatePicker">종료시간</label>
								<input type="text" class="form-control m-input" id="endDatePicker" readonly value="${currentTime}"/>
							</div>
							<div class="form-group m--margin-top-30">
								<button type="button" class="btn btn-success btn-block" id="measurementSearch">
									계측 이력 조회
								</button>
							</div>
						</form>
					</div>
				</div>
				<div class="m-portlet">
					<div class="m-portlet__body">
						<button type="button" class="btn btn-outline-success btn-block">
							블록 전체 요약
						</button>
						<button type="button" class="btn btn-outline-success btn-block">
							레포트 출력
						</button>
						<button type="button" class="btn btn-outline-success btn-block">
							계측 이력 출력
						</button>
					</div>
				</div>
			</div>
			<div class="col-xl-8">
				<div class="m-portlet m-portlet--tabs m-portlet--head-sm">
					<div class="m-portlet__head">
						<div class="m-portlet__head-caption">
							<div class="m-portlet__head-title">
								<span class="m-portlet__head-icon">
									<i class="fa flaticon-interface-5"></i>
								</span> 
								<h3 class="m-portlet__head-text">
									선택된 블록 > <span id="select_block"></span>
								</h3>
							</div>
						</div>
						<div class="m-portlet__head-tools">
							<ul class="nav nav-tabs m-tabs m-tabs-line m-tabs-line--accent m-tabs-line--right" role="tablist">
								<li class="nav-item m-tabs__item">
									<a class="nav-link m-tabs__link active show" data-toggle="tab" href="#portlet_tab_1" role="tab" aria-selected="true">
										<i class="fa fa-table"></i> 테이블 보기
									</a>
								</li>
								<li class="nav-item m-tabs__item">
									<a class="nav-link m-tabs__link" data-toggle="tab" href="#portlet_tab_2" role="tab" aria-selected="true">
										<i class="fa fa-line-chart"></i> 차트 상세보기
									</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="m-portlet__body">
						<div class="tab-content">
							<div class="tab-pane active show" id="portlet_tab_1">
								<div id="m_datatable"></div>
								<div id="dualChartdiv" class="chart-container"></div>
							</div>
							<div class="tab-pane" id="portlet_tab_2">
								<div id="detailChartdiv" class="chart-detail-container"></div>	
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-2">
				<div class="m-portlet m-portlet--head-sm">
					<div class="m-portlet__head">
						<div class="m-portlet__head-caption">
							<div class="m-portlet__head-title">
								<span class="m-portlet__head-icon">
									<i class="flaticon-line-graph"></i>
								</span> 
								<h3 class="m-portlet__head-text">실시간 모니터링</h3>
							</div>
						</div>
					</div>
					<div class="m-portlet__body custom-portlet-body">
						<div class="text-center">
							<label id="realtime_datetime" class="col-form-label monitoring-time"></label>
							<div class="monitoring-box block-normal">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th colspan="3"><span id="realtime_block"></span></th>
										</tr>
									</thead>
									<tbody>
										<tr class="text-right">
											<td colspan="3">
												<span id="realtime_pressure" class="m--font-boldest"></span>&nbsp;&nbsp;kg/cm²
											</td>
										</tr>
										<tr class="text-right">
											<td colspan="3">
												<span id="realtime_flow" class="m--font-boldest"></span>&nbsp;&nbsp;m²/hr
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
					</div>
				</div>
				<div class="m-portlet m-portlet--head-sm">
					<div class="m-portlet__head">
						<div class="m-portlet__head-caption">
							<div class="m-portlet__head-title">
								<span class="m-portlet__head-icon">
									<i class="flaticon-list-1"></i>
								</span> 
								<h3 class="m-portlet__head-text">계측 이력 통계</h3>
							</div>
						</div>
					</div>
					<div class="m-portlet__body custom-portlet-body">
						<label class="col-form-label">구간적산유량(m²)</label>
						<div class="text-right">
							<label id="sum_flow" class="col-lg-11 statistics-text"></label>
						</div>
						<div class="form-group">
							<label class="col-form-label">수압통계(kg/cm²)</label>
							<div class="text-right">
								<label class="col-lg-5 text-left">최저수압</label>
								<label id="min_pressure" class="col-lg-6 statistics-text"></label> 
							</div> 
							<div class="text-right">
								<label class="col-lg-5 text-left">최고수압</label>
								<label id="max_pressure" class="col-lg-6 statistics-text"></label> 
							</div> 
							<div class="text-right">
								<label class="col-lg-5 text-left">평균수압</label>
								<label id="avg_pressure" class="col-lg-6 statistics-text"></label> 
							</div> 
						</div>
						<div class="form-group">
							<label class="col-form-label">유량통계(m²/hr)</label>
							<div class="text-right">
								<label class="col-lg-5 text-left">최저유량</label>
								<label id="min_flow" class="col-lg-6 statistics-text"></label> 
							</div> 
							<div class="text-right">
								<label class="col-lg-5 text-left">최고유령</label>
								<label id="max_flow"  class="col-lg-6 statistics-text"></label> 
							</div> 
							<div class="text-right">
								<label class="col-lg-5 text-left">평균유량</label>
								<label id="avg_flow"  class="col-lg-6 statistics-text"></label> 
							</div> 
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
$("#startDatePicker").datetimepicker({
	todayHighlight: true,
	autoclose: true,
	format: "yyyy-mm-dd hh:ii:00",
});

$("#endDatePicker").datetimepicker({
	todayHighlight: true,
	autoclose: true,
	format: "yyyy-mm-dd hh:ii:00",
});

var table = {
	data: {
		type: "remote",
		source: {
			read: {
				url: contextPath + "/measurement/searchResult"
			}
		}
	},
	layout: {
		theme: "default",
		scroll: true,
		height: 400,
		footer: false
	},
	sortable: false,
	pagination: false,
	columns: [{
		field: "dateTime",
		title: "시간",
		width: 150,
		textAlign: "center",
		template: function(data) {
			return '<span>' + data.dateTime + '</span>';
		}
	},{
		field: "pressure",
		title: "수압",
		width: 60,
		textAlign: "center"
	},{
		field: "flow",
		title: "순시유량",
		textAlign: "center"
	},{
		field: "sumFlowString",
		title: "적산유량",
		textAlign: "center"
	},{
		field: "",
		title: "수압알람",
		textAlign: "center"
	},{
		field: "",
		title: "기기이상",
		textAlign: "center"
	},{
		field: "",
		title: "누수추정",
		textAlign: "center"
	}]
}

function setHistoryInfo(blockId, startDate, endDate) {
	$("#m_datatable").mDatatable("destroy");
	
	var param = new Object();
	param.blockId = blockId;
	param.startDate = startDate;
	param.endDate = endDate;
	
	table.data.source.read.params = {"blockId": blockId, "startDate": startDate, "endDate": endDate}
	$("#m_datatable").mDatatable(table); 
	
	$.ajax({
		url: contextPath + "/measurement/detail",
		type: "post",
		data: JSON.stringify(param),
		contentType: "application/json",
		success: function(detail) {
			$("#select_block").text(detail.blockInfo.bkNm);
			$("#realtime_block").text(detail.blockInfo.bkNm);
			
			$("#realtime_datetime").text(detail.realTimeMonitoring.dateTime);
			$("#realtime_pressure").text(detail.realTimeMonitoring.pressure);
			$("#realtime_flow").text(detail.realTimeMonitoring.flow);
			
			$("#sum_flow").text(detail.sumFlow);
			
			$("#min_pressure").text(detail.minPressure);
			$("#max_pressure").text(detail.maxPressure);
			$("#avg_pressure").text(detail.avgPressure);
			
			$("#min_flow").text(detail.minFlow);
			$("#max_flow").text(detail.maxFlow);
			$("#avg_flow").text(detail.avgFlow);
			
			var highChart = makeMeasurementDualHighChart("dualChartdiv", detail.highChartInfo);
			if (detail.highChartInfo.categories.length == 0) {
				highChart.destroy();
			}
			
			makeMeasurementDualAmChart("detailChartdiv", detail.amChartInfo);
		}
	});
} 

$(function() {
	setHistoryInfo("${blockInfo.flctcFm}", "${blockInfo.dateTime}");
});

$("#measurementSearch").click(function() {
	var blockId= $("#blockSelect option:selected").val();
	setHistoryInfo(blockId, $("#startDatePicker").val(), $("#endDatePicker").val());
});
</script>