<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tagLib.jsp"%>

<style>
.date-select-content {
	border: 0px solid #D5D5D5;
	padding: 0px 10px;
}

.chart-container {
	height: 325px;
}

.table tr .sub {
	background: #358097;
}

.table tr th {
	background: #076DB4;
	color: #fff;
	font-weight: 600;
}
</style>

<div class="m-grid__item m-grid__item--fluid m-wrapper">
	<div class="m-subheader"> 
		<div class="d-flex align-items-center">
			<div class="mr-auto">
				<h3 class="m-subheader__title">
					누수분석 <i class="la la-angle-right arrow-icon"></i> <small>누수분석</small>
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
								<h3 class="m-portlet__head-text">분석 조건 설정</h3>
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
								<label class="m--font-boldest" for="analysisDatePicker">기준일</label>
								<input type="text" class="form-control m-input" id="analysisDatePicker" readonly/>
							</div>
							<div class="form-group">
								<label class="m--font-boldest" for="datePicker">분석기간</label>
								<div class="m-radio-list m--margin-left-10">
									<label class="m-radio m-radio--success">
										<input type="radio" id="peroid_1" name="period" value="1" checked="checked" onclick="periodTypeSelect(this);">
										기준일 전 일주일
										<span></span>
									</label>
									<label class="m-radio m-radio--success">
										<input type="radio" id="peroid_2" name="period" value="2" onclick="periodTypeSelect(this);">
										날짜선택(최대 6일)
										<span></span>
									</label>
								</div>
							</div>
							<div id="date_select" class="form-group date-select-content display-none">
								<input type="text" class="form-control m-input" id="datePicker1" placeholder="Select date"/>
								<input type="text" class="form-control m-input m--margin-top-5" id="datePicker2" placeholder="Select date"/>
								<input type="text" class="form-control m-input m--margin-top-5" id="datePicker3" placeholder="Select date"/>
								<input type="text" class="form-control m-input m--margin-top-5" id="datePicker4" placeholder="Select date"/>
								<input type="text" class="form-control m-input m--margin-top-5" id="datePicker5" placeholder="Select date"/>
								<input type="text" class="form-control m-input m--margin-top-5" id="datePicker6" placeholder="Select date"/>
							</div>
							<div class="form-group m--margin-top-30">
								<button type="button" class="btn btn-success btn-block" id="analysisButton">
									분 석
								</button>
							</div>
						</form>
					</div>
				</div>
				<div class="m-portlet">
					<div class="m-portlet__body">
						<button type="button" class="btn btn-outline-success btn-block">
							레포트 출력
						</button>
					</div>
				</div>
			</div>
			<div class="col-xl-10">
				<div class="m-portlet">
					<div class="m-portlet__body">
						<div id="lineChartdiv" class="chart-container"></div>
						
						<table id="leakageTable" class="table table-bordered m--margin-top-5 display-none">
							<thead class="text-center">
								<tr>
									<th class="vertical-middle" rowspan="2">날짜</th>
									<th colspan="3">야간최소유량</th>
									<th colspan="2">유량 최대증가</th>
									<th colspan="2">수압 최대감소</th>
									<th class="vertical-middle" rowspan="2">누수판단</th>
								</tr>
								<tr>
									<th class="sub">계측값</th>
									<th class="sub">시간</th>
									<th class="sub">수압</th>
									<th class="sub">비율</th>
									<th class="sub">시간</th>
									<th class="sub">비율</th>
									<th class="sub">시간</th>
								</tr>
							</thead>
							<tbody class="text-center">
								<c:forEach var="result" items="${resultList}" varStatus="status">
								<tr>
									<td>${result.date}</td>
									<td>${result.value}</td>
									<td>${result.flowTime}</td>
									<td>${result.pressure}</td>
									<td>${result.flowMaxRatio}</td>
									<td>${result.flowMaxTime}</td>
									<td>${result.pressureRatio}</td>
									<td>${result.pressureTime}</td>
									<td>${result.judgment}</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
$("#analysisDatePicker").daterangepicker({
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

function dateSelect() {
	for (var i = 1; i <= 6; i++) {
		$("#datePicker" + i).datetimepicker({
			format: "yyyy-mm-dd",
			todayHighlight: true,
			clearBtn: true,
			autoclose: true,
			startView: 2,
			minView: 2,
			forceParse: 0,
			pickerPosition: "bottom-left",
			locale: moment.locale("ko")
		}); 
	}
}

dateSelect();

function periodTypeSelect(radio) {
	if (radio.value == 1) {
		$("#date_select").addClass("display-none");
	} else {
		$("#date_select").removeClass("display-none");
	}
}

$("#analysisButton").click(function() {
	var param = new Object();
	param.blockId = $("#blockSelect option:selected").val();
	param.selectDate = $("#analysisDatePicker").val();
	
	if ($("#peroid_1").is(":checked")) {
		param.week = true;
	} else {
		param.week = false;
		var selectDates = param.selectDate;
		for (var i = 1; i < 7; i++) {
			$("#datePicker" + i).val() != "" ? selectDates = selectDates + "_" + $("#datePicker" + i).val() : "";
		}
		
		param.selectDates = selectDates;
	}
	
	$("#leakageTable tbody").empty();
	
	$.ajax({
		url: contextPath + "/leakage/analysis",
		type: "post",
		data: JSON.stringify(param),
		contentType: "application/json",
		success: function(response) {
			if (response.leakageAnalysis.length > 0) {
				$("#leakageTable").removeClass('display-none');
				response.leakageAnalysis.forEach(function(data, index) {
					$("#leakageTable tbody").append("<tr>" + 
							"<td>" + data.date + "</td>" + 
							"<td>" + data.flow + "</td>" + 
							"<td>" + data.flowTime + "</td>" + 
							"<td>" + data.pressure + "</td>" + 
							"<td>" + data.flowMaxRatio + "</td>" + 
							"<td>" + data.flowMaxTime + "</td>" + 
							"<td>" + data.pressureRatio + "</td>" + 
							"<td>" + data.pressureTime + "</td>" + 
							"<td>" + data.judgment + "</td>" + 
							"</tr>")
				});
			}
			
			makeLeakageAnalysisChart("lineChartdiv", response.highChartInfo);
		},
		beforeSend:function(){
	        $('.loading-container').removeClass('display-none');
	    },
	    complete:function(){
	        $('.loading-container').addClass('display-none');
	    }
	});
});

</script>