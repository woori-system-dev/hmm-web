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
	padding: 1.2rem 1.6rem !important;
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
	height: 265px;
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
					알람 이력 정보
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
								<label class="m--font-boldest" for="startDatePicker">시작일</label>
								<input type="text" class="form-control m-input" id="startDatePicker" readonly/>
							</div>
							<div class="form-group">
								<label class="m--font-boldest" for="endDatePicker">종료일</label>
								<input type="text" class="form-control m-input" id="endDatePicker" readonly/>
							</div>
							<div class="m-checkbox-list">
								<label class="m-checkbox m-checkbox--state-brand">
									<input type="checkbox" checked="checked" id="pressureCheck">수압이상<span></span>
								</label>
								<label class="m-checkbox m-checkbox--state-brand">
									<input type="checkbox" checked="checked" id="openDoorCheck">문열림<span></span>
								</label>
								<label class="m-checkbox m-checkbox--state-brand">
									<input type="checkbox" checked="checked" id="deviceErrorCheck">통신이상<span></span>
								</label>
							</div>
							<div class="form-group m--margin-top-30">
								<button id="alarmHistorySearch" type="button" class="btn btn-success btn-block">
									알람 이력 조회
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
							알람 이력 출력
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
					</div>
					<div class="m-portlet__body">
						<div id="m_datatable"></div>
						<div class="row m--margin-top-20">
							<div class="col-md-7 p-0">
								<div id="ganttChartdiv" class="chart-container"></div>
							</div>
							<div class="col-md-5 p-0">
								<div id="pieChartdiv" class="chart-container"></div>
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
							<div class="monitoring-box block-warning">
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
											<td class="block-detail-warning">
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
								<h3 class="m-portlet__head-text">알람 이력 통계</h3>
							</div>
						</div>
					</div>
					<div class="m-portlet__body custom-portlet-body">
						<label class="col-form-label">최대지속알람</label>
						<div class="text-right">
							<label class="col-lg-5 text-left">알람종류</label>
							<label class="col-lg-6 statistics-text p-0" id="alarmType"></label> 
						</div> 
						<div class="text-right">
							<label class="col-lg-5 text-left">지속시간</label>
							<label class="col-lg-6 statistics-text" id="durationTime"></label> 
						</div> 
						<div class="form-group">
							<label class="col-form-label">알람건수</label>
							<div class="text-right">
								<label class="col-lg-5 text-left">전체</label>
								<label class="col-lg-6 statistics-text" id="total">54 건</label> 
							</div> 
							<div class="text-right">
								<label class="col-lg-5 text-left">고수압경고</label>
								<label class="col-lg-6 statistics-text" id="highPressureWarning"></label> 
							</div> 
							<div class="text-right">
								<label class="col-lg-5 text-left">고수압주의</label>
								<label class="col-lg-6 statistics-text" id="highPressureCaution"></label> 
							</div> 
							<div class="text-right">
								<label class="col-lg-5 text-left">저수압경고</label>
								<label class="col-lg-6 statistics-text" id="lowPressureWarning"></label> 
							</div>
							<div class="text-right">
								<label class="col-lg-5 text-left">저수압주의</label>
								<label class="col-lg-6 statistics-text" id="lowPressureCaution"></label> 
							</div>
							<div class="text-right">
								<label class="col-lg-5 text-left">문열림</label>
								<label class="col-lg-6 statistics-text" id="openDoor"></label> 
							</div>
							<div class="text-right">
								<label class="col-lg-5 text-left">통신이상</label>
								<label class="col-lg-6 statistics-text" id="deviceError"></label> 
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
$(function() {
	$("#startDatePicker").daterangepicker({
		startDate: moment(),
		singleDatePicker: true,
		showDropdowns: true,
		locale: {
			format: 'YYYY-MM-DD',
			daysOfWeek: [
				"일","월","화","수","목","금","토"
	      	]
		}
	}); 

	$("#endDatePicker").daterangepicker({
		startDate: moment(),
		singleDatePicker: true,
		showDropdowns: true,
		locale: {
		  	format: 'YYYY-MM-DD',
		  	daysOfWeek: [
				"일","월","화","수","목","금","토"
	      	]
		}
	}); 

	var table = {
		data: {
			type: "remote",
			source: {
				read : {
					url: contextPath + "/alarm/searchResult",
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
			field: "startTime",
			title: "시작시간",
			textAlign: "center"
		},{
			field: "endTime",
			title: "종료시간",
			textAlign: "center"
		},{
			field: "alarmType",
			title: "알람타입",
			textAlign: "center"
		},{
			field: "step",
			title: "단계",
			textAlign: "center"
		},{
			field: "durationTime",
			title: "지속시간",
			textAlign: "center"
		}]
	}

	function setAlarmHistoryInfo(blockId, startDate, endDate) {
		$("#m_datatable").mDatatable("destroy");

		var param = new Object();
		param.blockId = blockId;
		param.startDate = startDate;
		param.endDate = endDate;
		param.pressure = $("#pressureCheck").is(":checked");
		param.openDoor = $("#openDoorCheck").is(":checked");
		param.deviceError = $("#deviceErrorCheck").is(":checked");

		table.data.source.read.params = param;
		$("#m_datatable").mDatatable(table); 
		
		$.ajax({
			url: contextPath + "/alarm/detail",
			type: "post",
			data: JSON.stringify(param),
			contentType: "application/json",
			success: function(detail) {
				$("#select_block").text(detail.blockInfo.bkNm);
				$("#realtime_block").text(detail.blockInfo.bkNm);
				
				$("#realtime_datetime").text(detail.realTimeMonitoring.dateTime);
				$("#realtime_pressure").text(detail.realTimeMonitoring.pressure);
				$("#realtime_flow").text(detail.realTimeMonitoring.flow);
				
				$("#alarmType").text(detail.alarmType);
				$("#durationTime").text(detail.durationTime + "분");
				$("#total").text(detail.total + " 건");
				$("#highPressureWarning").text(detail.highPressureWarning + " 건");
				$("#highPressureCaution").text(detail.highPressureCaution + " 건");
				$("#lowPressureWarning").text(detail.lowPressureWarning + " 건");
				$("#lowPressureCaution").text(detail.lowPressureCaution + " 건");
				$("#openDoor").text(detail.openDoor + " 건");
				$("#deviceError").text(detail.deviceError + " 건");
				
				var ganttChart = makeGanttChart("ganttChartdiv");
				var pieChart = makePieChart("pieChartdiv", detail.highPressureWarning + detail.lowPressureWarning,
						detail.highPressureCaution + detail.lowPressureCaution);
			}
		});
	}
	
	setAlarmHistoryInfo("${blockInfo.flctcFm}", "${blockInfo.dateTime}");

	$("#alarmHistorySearch").click(function() {
		var blockId= $("#blockSelect option:selected").val();
		setAlarmHistoryInfo(blockId, $("#startDatePicker").val(), $("#endDatePicker").val());
	});
});
</script>