<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tagLib.jsp"%>

<style>
.m-portlet {
	margin-bottom: 2rem;
}

.m-checkbox {
	margin-bottom: 5px;
}

.checkbox-list {
	border: 1px solid #BDBDBD;
	height: 200px;
	overflow-y: scroll;
	padding: 8px 10px;
}

.chart-content {
	width: 100%;
	height: 320px;
}

.result-table thead th {
	background: #076DB4;
	color: #fff;
	white-space: nowrap;
	padding: 12px;
}

.result-table tbody .sticky-col {
	background: #076DB4;
	color: #fff;
}

.thead-block {
	padding: 12px 100px !important;
}

.table-wrapper {
    position: relative;
}

.table-scroller {
    margin-left: 160px;
    overflow-x: scroll;
    overflow-y: visible;
    width: 1100px;
}

.table-scroller table {
	width: auto;
}

.result-table .sticky-col {
    left: 0;
    position: absolute;
    top: auto;
    width: 160px;
    border-top: 1px solid #BDBDBD;
}

.pie-chart {
	height: 260px;
}
</style>

<div class="m-grid__item m-grid__item--fluid m-wrapper">
	<div class="m-subheader"> 
		<div class="d-flex align-items-center">
			<div class="mr-auto">
				<h3 class="m-subheader__title">
					수압분석 <i class="la la-angle-right arrow-icon"></i> <small>수압분포분석</small>
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
									<i class="flaticon-search"></i>
							 	</span>
								<h3 class="m-portlet__head-text">
									분석 조건 설정
								</h3>
							</div>
						</div>
					</div>
					<div class="m-portlet__body">
						<form class="m-form m-form--fit">
							<div class="form-group">
								<label class="m--font-boldest" for="blockSelect">블록선택</label> 
								<div class="m--margin-left-10">
									<label class="m-checkbox m-checkbox--brand">
										<input type="checkbox" id="checkBoxAll" checked="checked" onclick="checkBox()">
											전체 선택
										<span></span>
									</label>
								</div>
								<div id="checkboxList" class="checkbox-list">
									<c:forEach var="block" items="${blockList}" varStatus="status">
										<label class="m-checkbox m-checkbox--brand">
											<input type="checkbox" name="checkbox" checked="checked" value="${block.flctcFm}">
											${block.bkNm}<span></span>
										</label>
									</c:forEach>
								</div>
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
								<button type="button" class="btn btn-success btn-block" id="distrinutionButton">분 석</button>
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
						<div id="distributionLineChart" class="chart-content"></div>
						<div id="tableWrapper" class="table-wrapper m--margin-top-10 display-none">
							<div class="table-scroller">
								<table id="dataTable" class="table table-bordered result-table text-center"></table>
							</div>
						</div>
							
							<!-- <table class="table m-table" style="text-align:center;">
								<thead>
									<tr>
										<th style="background-color:#358097;color:#ffffff;width:220px;">
											블록명
										</th>
										<th style="background-color:#4bc6ff;color:#ffffff;width:220px;">
											관리블록A
										</th>
										<th style="background-color:#e64b6a;color:#ffffff;width:220px;">
											관리블록B
										</th>
										<th style="background-color:#4bc6ff;color:#ffffff;width:220px;">
											소블록A
										</th>
										<th style="background-color:#e64b6a;color:#ffffff;width:220px;">
											소블록B
										</th>
										<th style="background-color:#4bc6ff;color:#ffffff;width:220px;">
											소블록C
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th style="background-color:#358097;color:#ffffff">
											급수전수
										</th>
										<td>
											0
										</td>
										<td>
											0
										</td>
										<td>
											0
										</td>
										<td>
											0
										</td>
										<td>
											213
										</td>
									</tr>
									<tr>
										<th style="background-color:#358097;color:#ffffff">
											관로연장(m)
										</th>
										<td>
											0
										</td>
										<td>
											0
										</td>
										<td>
											0
										</td>
										<td>
											0
										</td>
										<td>
											0
										</td>
									</tr>
									<tr>
										<th style="background-color:#358097;color:#ffffff;padding:0px">
											기간내<br>
											적산유량(m)
										</th>
										<td>
											31124
										</td>
										<td>
											17138
										</td>
										<td>
											142103
										</td>
										<td>
											1681903397
										</td>
										<td>
											119428
										</td>
									</tr>
									<tr>
										<th style="background-color:#358097;color:#ffffff;padding-top:100px">
											수압분포
										</th>
										<td>
											<div id="chartdiv1" style="height: 260px;"></div>
										</td>
										<td>
											<div id="chartdiv2" style="height: 260px;"></div>
										</td>
										<td>
											<div id="chartdiv3" style="height: 260px;"></div>
										</td>
										<td>
											<div id="chartdiv4" style="height: 260px;"></div>
										</td>
										<td>
											<div id="chartdiv5" style="height: 260px;"></div>
										</td>
									</tr>
								</tbody>
							</table> -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
//var colors = ["#8F67B2", "#4898D5", "#62BE70", "#52B198", "#D55D48", "#F361A6", "#E5D85C"];
//var colors = ["#7cb5ec", "#434348", "#90ed7d", "#f7a35c", "#8085e9", "#f15c80", "#e4d354", "#2b908f", "#f45b5b", "#91e8e1"];
var colors = ['#2f7ed8', '#8bbc21', '#910000', '#1aadce', '#492970', '#f28f43', '#77a1e5', '#c42525', '#a6c96a',
	'#4572A7', '#AA4643', '#89A54E', '#80699B', '#3D96AE', '#DB843D', '#92A8CD', '#A47D7C', '#B5CA92'];
 
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

function checkBox() {
	var checkbox = document.getElementsByName('checkbox');
	var checkboxLength = checkbox.length;
	if ($('#checkBoxAll').is(":checked")){
		for (var i = 0; i < checkboxLength; i++){
			checkbox[i].checked = true;
		}
	} else{
		for (var i = 0; i < checkboxLength; i++){
			checkbox[i].checked = false;
		}
	}
}

$("#distrinutionButton").click(function() {
	var param = new Object();
	param.fixedDate = $("#datePicker").val();
	
	if ($("#peroid_1").is(":checked")) {
		param.analysisPeroid = "Peroid_1";
	} else if ($("#peroid_2").is(":checked")) {
		param.analysisPeroid = "Peroid_2"
	} else if ($("#peroid_3").is(":checked")) {
		param.analysisPeroid = "Peroid_3"
	}
	
	var blockList = [];
	
	var chkBoxList = document.getElementById("checkboxList");
	var chkBoxCount = chkBoxList.getElementsByTagName("input");
	$.each(chkBoxCount, function(index, data) {
		if (data.checked) {
			blockList.push(data.value)
		}
	});
	
	param.blockList = blockList;
	
	$.ajax({
		url: contextPath + "/pressure/distribution",
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(param),
		success: function(response) {
			makeDistributionLineChart("distributionLineChart", response.highChartInfo);
			makeDistributionTable(response.results);
			makeDistributionPieChart(response.results);
		},
		beforeSend:function(){
	        $('.loading-container').removeClass('display-none');
	    },
	    complete:function(){
	        $('.loading-container').addClass('display-none');
	    }
	});
});

function makeDistributionTable(results) {
	$("#tableWrapper").removeClass('display-none');
	$("#dataTable").empty();
	
	var table = document.getElementById("dataTable");
	var thead = document.createElement("thead");
	var tr = document.createElement("tr");
	var th = document.createElement("th");
	th.innerText = "블록명";
    th.setAttribute("class", "sticky-col");
    tr.appendChild(th);
    
    $.each(results, function(index, value) {
		var th = document.createElement("th");
		th.innerText = value.blockName;
		th.setAttribute("class", "thead-block")
		th.setAttribute("style", "background:" + colors[index])
        tr.appendChild(th);
	});
    
    thead.appendChild(tr);
    
    var bodyArray = ["급수전수", "관로연장(m)", "기간내적산유량(m²)", "수압분포"];
    
    var tbody = document.createElement("tbody");
    $.each(bodyArray, function(index, array) {
		var tr = document.createElement("tr");
		var td = document.createElement("td");
		td.innerText = array;
        td.setAttribute("class", "sticky-col");
        if (array == "수압분포") {
        	td.setAttribute("style", "height:260px;padding-top:100px;");
        }
        
        tr.appendChild(td);
        
        $.each(results, function(index, result) {
			var td = document.createElement("td");
			if (array == "급수전수") {
				td.innerText = result.hydrant;
			} else if (array == "관로연장(m)") {
				td.innerText = result.pipe;
			} else if (array == "기간내적산유량(m²)") {
				td.innerText = result.sumFlow;
			} else if (array == "수압분포") {
				td.setAttribute("id", "pieChart" + (index + 1));
				td.setAttribute("class", "pie-chart");
			}
	        tr.appendChild(td);
		});
        
        tbody.appendChild(tr);
    });
    
    table.appendChild(thead);
	table.appendChild(tbody);
}

</script>