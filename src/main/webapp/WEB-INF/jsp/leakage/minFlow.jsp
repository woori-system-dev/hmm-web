<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tagLib.jsp"%>

<style>
.chart-container {
	height: 280px;
}

.result-table thead th {
    background: #358097;
	color: #fff;
	white-space: nowrap;
	padding: 12px;
}

.result-table tbody .sticky-col {
	background: #076DB4;
	color: #fff;
}

.result-table tbody td {
    color: #333;
    height: 44px;
}

.table-wrapper {
    position: relative;
}

.table-scroller {
    margin-left: 160px;
    overflow-x: scroll;
    overflow-y: visible;
    width: 830px;
}

.result-table .sticky-col {
    left: 0;
    position: absolute;
    top: auto;
    width: 160px;
    border-top: none;
}

.graph-interpretation {
	padding: 0px !important;
}

.graph-interpretation .col-md-7 {
	padding-top: 14px;
	color: #fff;
	font-weight: 600;
}

.head-text {
	font-size: 1.1rem !important;
}

.threshold-body {
	padding: 16px !important;
}

.threshold-table tr th {
	background: #358097;
	color: #fff;
}
</style>

<div class="m-grid__item m-grid__item--fluid m-wrapper">
	<div class="m-subheader"> 
		<div class="d-flex align-items-center">
			<div class="mr-auto">
				<h3 class="m-subheader__title">
					누수분석 <i class="la la-angle-right arrow-icon"></i> <small>야간최소 유량분석</small>
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
							<div class="form-group m--margin-top-30">
								<button type="button" class="btn btn-success btn-block" id="minFlowButton">분 석</button>
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
			<div class="col-xl-8">
				<div class="m-portlet">
					<div class="m-portlet__body">
						<div id="lineChartdiv" class="chart-container"></div>
						<div id="tableWrapper" class="table-wrapper m--margin-top-10 display-none">
							<div class="table-scroller">
								<table id="dataTable" class="table table-bordered result-table text-center"></table>
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
									<i class="fa fa-line-chart"></i>
								</span> 
								<h3 class="m-portlet__head-text">그래프 해석</h3>
							</div>
						</div>
					</div>
					<div class="m-portlet__body graph-interpretation">
						<div class="m--padding-10 green-color">
							<div class="row">
								<div class="col-md-5">
									<img alt="" src="../images/graph/graph_interpretation_1.png" width="90">
								</div>
								<div class="col-md-7">
									<span>일시적 유량증가</span>
									<span>(휴일/주말)</span>
								</div>
							</div>
						</div>
						<div class="m--padding-10 blue-color">
							<div class="row">
								<div class="col-md-5">
									<img alt="" src="../images/graph/graph_interpretation_2.png" width="90">
								</div>
								<div class="col-md-7">
									<span>단기적 유량증가</span>
									<span>(휴일/주말)</span>
								</div>
							</div>
						</div>
						<div class="m--padding-10 orange-color">
							<div class="row">
								<div class="col-md-5">
									<img alt="" src="../images/graph/graph_interpretation_3.png" width="90">
								</div>
								<div class="col-md-7">
									<span>지속적 유량증가</span>
									<span>(수용성 증가)</span>
								</div>
							</div>
						</div>
						<div class="m--padding-10 purple-color">
							<div class="row">
								<div class="col-md-5">
									<img alt="" src="../images/graph/graph_interpretation_4.png" width="90">
								</div>
								<div class="col-md-7">
									<span>허용야간유량</span><br>
									<span>재설정필요</span>
								</div>
							</div>
						</div>
						<div class="m--padding-10 red-color">
							<div class="row">
								<div class="col-md-5">
									<img alt="" src="../images/graph/graph_interpretation_5.png" width="90">
								</div>
								<div class="col-md-7 m--padding-top-20">
									<span>누수의심</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="allowFlowContainer" class="m-portlet m-portlet--head-sm display-none">
					<div class="m-portlet__head">
						<div class="m-portlet__head-caption">
							<div class="m-portlet__head-title">
								<h3 class="m-portlet__head-text head-text">기준허용야간유량 값 제안</h3>
							</div>
						</div>
					</div>
					<div class="m-portlet__body threshold-body">
						<table class="table table-bordered threshold-table text-center">
							<colgroup>
								<col style="width: 28%;" />
								<col style="width: 28%;" />
								<col style="width: 44%;" />
							</colgroup> 
							<thead>
								<tr>
									<th>현재</th>
									<th>알람</th>
									<th>제안</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td id="allowFlow" class="vertical-middle"></td>
									<td class="vertical-middle">0</td>
									<td>
										<input id="allowFlowInput" type="text" class="form-control m-input input-sm">
									</td>
								</tr>
							</tbody>
						</table>
						
						<div class="text-right m--margin-top-30">
							<button id="settingApplyButton" type="button" class="btn btn-info">설정적용</button>
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

$("#minFlowButton").click(function() {
	var param = new Object();
	param.blockId = $("#blockSelect option:selected").val();
	param.selectDate = $("#datePicker").val();
	
	if ($("#peroid_1").is(":checked")) {
		param.analysisPeroid = "Peroid_1";
	} else if ($("#peroid_2").is(":checked")) {
		param.analysisPeroid = "Peroid_2"
	} else if ($("#peroid_3").is(":checked")) {
		param.analysisPeroid = "Peroid_3"
	}
	
	$.ajax({
		url: contextPath + "/leakage/minFlow/analysis",
		type: "post",
		data: JSON.stringify(param),
		contentType: "application/json",
		success: function(response) {
			setMinFlowTable(response.nightMinFlowAnalysisList);
			makeMinFlowAnalysisChart("lineChartdiv", response.highChartInfo);
			$("#allowFlowContainer").removeClass('display-none');
			$("#allowFlow").html(response.allowFlow);
			$("#allowFlowInput").val(response.allowFlow);
		},
		beforeSend:function(){
	        $('.loading-container').removeClass('display-none');
	    },
	    complete:function(){
	        $('.loading-container').addClass('display-none');
	    }
	});
})

$("#settingApplyButton").click(function() {
	var allowFlow = $("#allowFlowInput").val();
});

function setMinFlowTable(analysisList) {
	$("#tableWrapper").removeClass('display-none');
	$("#dataTable").empty();
	
	var table = document.getElementById("dataTable");
	var thead = document.createElement("thead");
	var tr = document.createElement("tr");
	var th = document.createElement("th");
	th.innerText = "날짜";
    th.setAttribute("class", "sticky-col");
    tr.appendChild(th);
	
	$.each(analysisList, function(index, value) {
		var th = document.createElement("th");
		th.innerText = value.date;
        tr.appendChild(th);
	});
	
	thead.appendChild(tr);
	
	var bodyArray = ["야간최소유량", "계측시 수압", "계측시간", "야간적산유량", "휴일여부", "초과여부", "누수판단", "누수량(연속누적)"];
	
	var tbody = document.createElement("tbody");
	$.each(bodyArray, function(index, array) {
		var tr = document.createElement("tr");
		var td = document.createElement("td");
		td.innerText = array;
        td.setAttribute("class", "sticky-col");
        tr.appendChild(td);
        
        $.each(analysisList, function(index, result) {
			var td = document.createElement("td");
			if (array == "야간최소유량") {
				td.innerText = result.flow;
			} else if (array == "계측시 수압") {
				td.innerText = result.pressure;
			} else if (array == "계측시간") {
				td.innerText = result.time;
			} else if (array == "야간적산유량") {
				td.innerText = result.sumFlow;
			} else if (array == "휴일여부") {
				td.innerText = result.holiday;
			} else if (array == "초과여부") {
				td.innerText = result.over;
			} else if (array == "누수판단") {
				td.innerText = result.leakageJudgment;
			} else if (array == "누수량(연속누적)") {
				td.innerText = result.leakageAmount;
			}
	        tr.appendChild(td);
		});
        
        tbody.appendChild(tr);
	});
	
	table.appendChild(thead);
	table.appendChild(tbody);
}
</script>