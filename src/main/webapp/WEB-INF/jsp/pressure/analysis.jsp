<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tagLib.jsp"%>

<style>
.m-portlet {
	margin-bottom: 2rem;
}

.chart-content {
	height: 320px;
}

.legend-content {
	padding-left: 0;
}

.legend-content .m--font-boldest {
	font-size: 16px;
}

.legend-content span {
	font-size: 12px !important;
}

.font-white {
	font-size: 12px !important;
}

.weekday-analysis {background: #E69D34;}
.holiday-analysis {background: #4898D5;}
.weekday-compare {background: #C35E26;}
.holiday-compare {background: #53B298;}

.minmax-text {
	background: #565B62;
	padding: 0 3px;
}

.result-table thead th {
    background: #63B85F;
	color: #fff;
	white-space: nowrap;
	padding: 8px;
}

.result-table tbody td {
    color: #000;
}

.table-wrapper {
    position: relative;
}

.table-scroller {
    margin-left: 200px;
    overflow-x: scroll;
    overflow-y: visible;
    width: calc(100% - 200px);
}

.result-table .sticky-col1 {
    position: absolute;
    left: 0;
    width: 90px;
    border-top: none;
}

.result-table .sticky-col2 {
    position: absolute;
    left: 90px;
    width: 110px;
    border-top: none;
}

.table-head {
    background: #358097;
    color: #fff;
}

.table-td-first {
	background: #076DB4;
    color: #fff;
}

.alarmTable-td-input {
	padding: 8px !important;
}

.alarm-setting-input {
	padding: 0.3rem 1rem;
}

.gaugeChart-row td {
	padding: 0;
}

.gaugeChart {
	height: 70px;
}
</style>

<div class="m-grid__item m-grid__item--fluid m-wrapper">
	<div class="m-subheader">
		<div class="d-flex align-items-center">
			<div class="mr-auto">
				<h3 class="m-subheader__title">
					수압분석 <i class="la la-angle-right arrow-icon"></i> <small>수압분석</small> 
				</h3>
			</div>
		</div>
	</div>
	<div class="m-content">
		<div class="row">
			<div class="col-md-2">
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
								<label class="m--font-boldest" for="datePicker">기준일</label>
								<input type="text" class="form-control m-input" id="datePicker" readonly/>
							</div>
							<div class="form-group">
								<label class="m--font-boldest" for="datePicker">분석기간</label>
								<div class="m-radio-list m--margin-left-10">
									<label class="m-radio m-radio--success">
										<input type="radio" id="peroid_1" name="peroid" value="1" checked="checked">
										일주일
										<span></span>
									</label>
									<label class="m-radio m-radio--success">
										<input type="radio" id="peroid_2" name="peroid" value="2">
										4주
										<span></span>
									</label>
									<label class="m-radio m-radio--success">
										<input type="radio" id="peroid_3" name="peroid" value="2">
										8주
										<span></span>
									</label>
								</div>
							</div>
							<div class="form-group">
								<label class="m--font-boldest" for="datePicker">비교일</label>
								<div class="m-radio-list m--margin-left-10">
									<label class="m-radio m-radio--success">
										<input type="radio" id="compare_1" name="compareDate" value="1" checked="checked">
											이전주기
										<span></span>
									</label>
									<label class="m-radio m-radio--success">
										<input type="radio" id="compare_2" name="compareDate" value="1">
											일자선택
										<span></span>
									</label>
								</div>
								<div class="input-group">
									<input type="text" class="form-control m-input" name="date" placeholder="날짜" id="selectDatePicker"/>
									<div class="input-group-append">
										<span class="input-group-text">
											<i class="la la-calendar-check-o"></i>
										</span>
									</div>
								</div>
							</div>
							<div class="form-group m--margin-top-30">
								<button type="button" class="btn btn-success btn-block" id="pressureButton">분 석</button>
							</div>
						</form>
					</div>
				</div>
				<div class="m-portlet">
					<div class="m-portlet__body">
						<button type="button" class="btn btn-outline-success btn-block">
							레포트출력
						</button>
					</div>
				</div>
			</div>
			<div class="col-md-10"> 
				<div class="m-portlet">
					<div class="m-portlet__body">
						<div class="row">
							<div class="col-md-10">
								<div id="pressureLineChart" class="chart-content"></div>
							</div>
							<div class="legend-content col-md-2">
								<div class="weekday-analysis m--padding-15 font-white">
									<div class="m--font-boldest">평일(분석기간)</div>
									<div class="m--margin-top-5">
										<span class="minmax-text">최대</span>
										<span id="holidayAnalysisMax" class="m--margin-left-5"></span>
										<span class="minmax-text m--margin-left-20">최소</span>
										<span id="holidayAnalysisMin" class="m--margin-left-5"></span>
									</div>
								</div>
								<div class="holiday-analysis m--padding-15 font-white">
									<div class="m--font-boldest">휴일(분석기간)</div>
									<div class="m--margin-top-5">
										<span class="minmax-text">최대</span>
										<span id="weekdayAnalysisMax" class="m--margin-left-5"></span>
										<span class="minmax-text m--margin-left-20">최소</span>
										<span id="weekdayAnalysisMin" class="m--margin-left-5"></span>
									</div>
								</div>
								<div class="weekday-compare m--padding-15 font-white">
									<div class="m--font-boldest">평일(비교기간)</div>
									<div class="m--margin-top-5">
										<span class="minmax-text">최대</span>
										<span class="m--margin-left-5">5.58</span>
										<span class="minmax-text m--margin-left-20">최소</span>
										<span class="m--margin-left-5">3.73</span>
									</div>
								</div>
								<div class="holiday-compare m--padding-15 font-white">
									<div class="m--font-boldest">휴일(비교기간)</div>
									<div class="m--margin-top-5">
										<span class="minmax-text">최대</span>
										<span class="m--margin-left-5">5.58</span>
										<span class="minmax-text m--margin-left-20">최소</span>
										<span class="m--margin-left-5">3.73</span>&nbsp;
									</div>
								</div>
							</div>
						</div>
						<div id="tableWrapper" class="table-wrapper m--margin-top-10 display-none">
							<div class="table-scroller">
								<table id="dataTable" class="table table-bordered result-table text-center">
									<thead>
										<tr>
											<th class="sticky-col1">&nbsp;</th>
											<th class="sticky-col2">평/휴일 \ 시간</th>
											<c:forEach var="i" begin="0" end="23">
												<th>
													<c:choose>
														<c:when test="${i < 10}">
													        0${i}
													    </c:when>
														<c:otherwise>
															${i}
														</c:otherwise>
													</c:choose>
												</th>
											</c:forEach>
										</tr>
									</thead>
									<tbody id="dataTableBody"></tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-8">
						<div class="m-portlet m-portlet--head-sm">
							<div class="m-portlet__head">
								<div class="m-portlet__head-caption">
									<div class="m-portlet__head-title">
										<span class="m-portlet__head-icon">
											<i class="flaticon-list-1"></i>
										</span> 
										<h3 class="m-portlet__head-text">비교 분석 결과</h3>
									</div>
								</div>
							</div>
							<div class="m-portlet__body">
								<table class="table table-bordered text-center">
									<colgroup>
										<col style="width: 15%;" />
										<col style="width: 17%;" />
										<col style="width: 17%;" />
										<col style="width: 17%;" />
										<col style="width: 17%;" /> 
										<col style="width: 17%;" />
									</colgroup> 
									<thead>
										<tr>
											<th class="table-td-first vertical-middle">항목</th>
											<th class="table-head">평일<br>평균수압</th>
											<th class="table-head">휴일<br>평균수압</th>
											<th class="table-head">평일야간<br>평균수압</th>
											<th class="table-head">휴일야간<br>평균수압</th>
											<th class="table-head">기간내<br>적산유량</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="table-td-first">분석기간</td>
											<td>4.91</td>
											<td>4.86</td>
											<td>5.32</td>
											<td>5.29</td>
											<td>31,118</td>
										</tr>
										<tr>
											<td class="table-td-first">비교기간</td>
											<td>4.93</td>
											<td>4.91</td>
											<td>5.29</td>
											<td>5.3</td>
											<td>30,387</td>
										</tr>
										<tr>
											<td class="table-td-first">변화량</td>
											<td>-0.02</td>
											<td>-0.05</td>
											<td>0.03</td>
											<td>-0.01</td>
											<td>731</td>
										</tr>
										<tr class="gaugeChart-row">
											<td class="table-td-first vertical-middle">변화율</td>
											<td><div id="weekday_gaugeChart" class="gaugeChart"></div></td>
											<td><div id="hoilday_gaugeChart" class="gaugeChart"></div></td>
											<td><div id="weekday_night_gaugeChart" class="gaugeChart"></div></td>
											<td><div id="hoilday_night_gaugeChart" class="gaugeChart"></div></td>
											<td><div id="sumFlow_gaugeChart" class="gaugeChart"></div></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="m-portlet m-portlet--head-sm">
							<div class="m-portlet__head">
								<div class="m-portlet__head-caption">
									<div class="m-portlet__head-title">
										<span class="m-portlet__head-icon">
											<i class="flaticon-cogwheel-1"></i>
										</span> 
										<h3 class="m-portlet__head-text">알람 설정값 제안</h3>
									</div>
								</div>
							</div>
							<div class="m-portlet__body">
								<table class="table table-bordered text-center">
									<colgroup>
										<col style="width: 34%;" />
										<col style="width: 22%;" />
										<col style="width: 22%;" />
										<col style="width: 22%;" />
									</colgroup> 
									<thead>
										<tr>
											<th></th>
											<th class="table-head">현재</th>
											<th class="table-head">알람</th>
											<th class="table-head">제안</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="table-td-first vertical-middle">고수압 경고</td>
											<td class="vertical-middle">7</td>
											<td class="vertical-middle">8</td>
											<td class="alarmTable-td-input">
												<input type="text" class="form-control m-input input-sm alarm-setting-input" value="7.00">
											</td>
										</tr>
										<tr>
											<td class="table-td-first vertical-middle">고수압 주의</td>
											<td class="vertical-middle">7</td>
											<td class="vertical-middle">8</td>
											<td class="alarmTable-td-input">
												<input type="text" class="form-control m-input input-sm alarm-setting-input" value="7.00">
											</td>
										</tr>
										<tr>
											<td class="table-td-first vertical-middle">저수압 주의</td>
											<td class="vertical-middle">7</td>
											<td class="vertical-middle">8</td>
											<td class="alarmTable-td-input">
												<input type="text" class="form-control m-input input-sm alarm-setting-input" value="7.00">
											</td>
										</tr>
										<tr>
											<td class="table-td-first vertical-middle">저수압 경고</td>
											<td class="vertical-middle">7</td>
											<td class="vertical-middle">8</td>
											<td class="alarmTable-td-input"> 
												<input type="text" class="form-control m-input input-sm alarm-setting-input" value="7.00">
											</td>
										</tr>
									</tbody>
								</table>
								
								<div class="text-right m--margin-top-20">
									<button type="button" class="btn btn-info">설정적용</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
$("#datePicker").daterangepicker({
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

$("#selectDatePicker").datepicker({
	autoApply: true,
	autoclose: true,
	orientation:"Bottom left",
	format:"yyyy-mm-dd"
});

$("#pressureButton").click(function() {
	var param = new Object();
	param.blockId = $("#blockSelect option:selected").val();
	param.fixedDate = $("#datePicker").val();
	
	var selectDate = $("#selectDatePicker").val();
	
	if ($("#peroid_1").is(":checked")) {
		param.analysisPeroid = "Peroid_1";
	} else if ($("#peroid_2").is(":checked")) {
		param.analysisPeroid = "Peroid_2"
	} else if ($("#peroid_3").is(":checked")) {
		param.analysisPeroid = "Peroid_3"
	}
	
	if ($("#compare_1").is(":checked")) {
		param.compareDate = "이전주기";
	} else if ($("#compare_2").is(":checked")) {
		param.compareDate = "일자선택"
		param.selectDate = selectDate;
	} 
	
	if ($("#compare_2").is(":checked") && selectDate == "") {
		swal("분석 실패!", "비교일 일자 선택하세요!", "error")
		return;
	}
	
	$.ajax({
		url: contextPath + "/pressure/analysis",
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(param),
		success: function(response) {
			makePressureAnalysisChart("pressureLineChart", response.highChartInfo);
			
			var pressureAnalysis = response.pressureAnalysis;
			$("#holidayAnalysisMax").text(pressureAnalysis.holidayAnalysisMax);
			$("#holidayAnalysisMin").text(pressureAnalysis.holidayAnalysisMin);
			$("#weekdayAnalysisMax").text(pressureAnalysis.weekdayAnalysisMax);
			$("#weekdayAnalysisMin").text(pressureAnalysis.weekdayAnalysisMin);
			
			createPressureAnalysisTable(response.highChartInfo);
			
			makeRedGaugeChart("weekday_gaugeChart", 0.4);
			makeRedGaugeChart("hoilday_gaugeChart", 1);
			makeGreenGaugeChart("weekday_night_gaugeChart", 0.6);
			makeRedGaugeChart("hoilday_night_gaugeChart", 0.2);
			makeGreenGaugeChart("sumFlow_gaugeChart", 2.4);
		},
		beforeSend:function(){
	        $('.loading-container').removeClass('display-none');
	    },
	    complete:function(){
	        $('.loading-container').addClass('display-none');
	    }
	});
});

function createPressureAnalysisTable(chartInfo) {
	$("#tableWrapper").removeClass('display-none');
	$("#dataTableBody").empty();
	
	var tbody = document.getElementById("dataTableBody");
	var tr = document.createElement("tr");
	var td = document.createElement("td");
	td.innerText = "분석기간";
	td.setAttribute("class", "sticky-col1");
	td.setAttribute("style", "height: 85px; padding-top: 30px");
    tr.appendChild(td);
    
    var td = document.createElement("td");
    td.innerText = "평일";
    td.setAttribute("class", "sticky-col2");
    tr.appendChild(td);
    
    $.each(chartInfo.seriesList[0].data, function(index, value) {
    	var td = document.createElement("td");
        td.innerText = value;
        tr.appendChild(td);
    });
    
    tbody.appendChild(tr);
    
	var tr = document.createElement("tr");
	var td = document.createElement("td");
	td.innerText = "휴일";
	td.setAttribute("class", "sticky-col2");
    tr.appendChild(td);
    
    $.each(chartInfo.seriesList[1].data, function(index, value) {
    	var td = document.createElement("td");
        td.innerText = value;
        tr.appendChild(td);
    });
    
	tbody.appendChild(tr);
}
</script>
