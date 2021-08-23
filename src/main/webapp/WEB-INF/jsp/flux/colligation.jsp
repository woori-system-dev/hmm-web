<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tagLib.jsp"%>

<style>
.margin_bottom_0 {
	margin-bottom: 0px;
}

.font_weight700 {
	font-weight: 700;
}

.table-header {
	height: 40px;
	background-color: #076db4;
	color: #ffffff;
	font-weight: 800;
	font-size: 22px;
}
</style>

<div class="m-grid__item m-grid__item--fluid m-wrapper">
	<div class="m-subheader">
		<div class="d-flex align-items-center">
			<div class="mr-auto">
				<h3 class="m-subheader__title ">
					유량분석  <i class="la la-angle-right arrow-icon"></i> <small>총괄수량수지분석</small> 
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
									검색 조건 설정
								</h3>
							</div>
						</div>
					</div>
					<div class="m-portlet__body">
						<div class="row">
							<div class="input-group">
								<div style="padding:6px 15px 0 0;font-weight:900">시작</div> 
								<input type="text" class="form-control m-input" name="date" placeholder="months" id="startDatePicker"/>
								<div class="input-group-append">
									<span class="input-group-text">
										<i class="la la-calendar-check-o"></i>
									</span>
								</div>
							</div>
						</div>
						<div class="row mt-20">
							<div class="input-group">
								<div style="padding:6px 15px 0 0;font-weight:900">종료</div> 
								<input type="text" class="form-control m-input" name="date" placeholder="months" id="endDatePicker"/>
								<div class="input-group-append">
									<span class="input-group-text">
										<i class="la la-calendar-check-o"></i>
									</span>
								</div>
							</div>
						</div>
						<div class="row mt-20">
							<div style="padding:0px 15px 0 0;font-weight:900">블록선택</div> 
							<label class="m-checkbox m-checkbox--check-bold">
								<input type="checkbox" id="checkBoxAll" checked="checked" onclick="checkBox()">
									전체 선택<span></span>
							</label>
						</div>
						<div class="row ml-20">
							<div style="border: 1px solid; width: 130px; height: 200px; overflow-y: scroll; padding: 10px 0 0 10px;">
								<c:forEach var="list" items="${blockList}" varStatus="domain">
									<label class="m-checkbox m-checkbox--check-bold"> 
										<input type="checkbox" name="checkbox" checked="checked" value="${list.bkNm}"> 
											${list.bkNm}<span></span>
									</label>
								</c:forEach>
							</div>
						</div>
						<div class="text-center mt-30">
							<button type="button" id="searchBtn" class="btn btn-success m-btn--wide">
								<i class="fa fa-search"></i> 검 색
							</button>
						</div>
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
						<div id="m_datatable"></div>
						<div class="row mt-20">
							<div class="col-md-8" style="text-align:center">
								<div class="row" >
					                <div class="col-md-4">
					                </div>
					                <div class="col-md-4" >
					                    <label class="margin_bottom_0 font_weight700">총공급량</label><br>
					                    <label class="margin_bottom_0">9130450287</label>
					                </div>
					            </div>
					            <div class="row" style="height:10px">        
					                 <div class="col-md-3">
					                </div>
					                <div class="col-md-1" style="border-bottom:6px solid;">
					                </div>
					                <div class="col-md-2" style="border-right:6px solid; border-bottom:6px solid;">
					                </div>
					                <div class="col-md-2" style="border-bottom:6px solid;">
					                </div>
					            </div>
					            <div class="row" style="height:10px">        
					                 <div class="col-md-3">
					                 </div>
				        	         <div class="col-md-5" style="border-left:6px solid;border-right:6px solid;">
					                 </div>
				                </div>
				                <div class="row">
				                	 <div class="col-md-6">
				                	 	<label class="margin_bottom_0 font_weight700">유효수량</label><br>
					                    <label class="margin_bottom_0">9130450</label>
				                	 </div>
				                	  <div class="col-md-4">
				                	 	<label class="margin_bottom_0 font_weight700">무효수량</label><br>
					                    <label class="margin_bottom_0">9130450</label>
				                	 </div>
				                </div>
				                <div class="row" style="height:20px">        
					                 <div class="col-md-3" style="border-right:6px solid #4cbeff;">
					                 </div>
				        	         <div class="col-md-5">
					                 </div>
					                 <div class="col-md-1" style="border-left:6px solid #bf4336;">
					                 </div>
					                 <div class="col-md-2">
					                 	<label  class="margin_bottom_0 font_weight700">조정감액수량</label>
					                 </div>
				                </div>
			                 	<div class="row" style="height:20px">        
					                 <div class="col-md-3" style="border-right:6px solid #4cbeff;">
					                 </div>
				        	         <div class="col-md-5">
					                 </div>
					                 <div class="col-md-1" style="border-top:6px solid #bf4336;">
					                 </div>
					                 <div class="col-md-2">
					                 	<label class="margin_bottom_0">9130450</label>
					                 </div>
				                </div>
				                <div class="row" style="height:10px">
				                	 <div class="col-md-2">
				                	 </div>
				                	 <div class="col-md-1" style="border-top:6px solid #4cbeff;border-left:6px solid #4cbeff;">
					                 </div>
					                 <div class="col-md-5" style="border-top:6px solid #4cbeff;border-right:6px solid #4cbeff;">
					                 </div>
				                </div>
				                <div class="row">
				                	 <div class="col-md-4">
				                	 	<label class="margin_bottom_0 font_weight700">유수수량</label><br>
					                    <label class="margin_bottom_0">9130450</label>
				                	 </div>
				                	 <div class="col-md-2">
				                	 </div>
				                	 <div class="col-md-4">
				                	 	<label class="margin_bottom_0 font_weight700">무수수량</label><br>
					                    <label class="margin_bottom_0">9130450</label>
				                	 </div>
				                </div>
				                <div class="row" style="height:10px">
				                	 <div class="col-md-2">
				                	 </div>
				                	 <div class="col-md-1" style="border-left:6px solid #559927;">
					                 </div>
					                 <div class="col-md-5">
					                 </div>
					                 <div class="col-md-1" style="border-left:6px solid #c69a04;">
					                 </div>
				                </div>
				                <div class="row" style="height:10px">
				                	<div class="col-md-2">
				                	</div>
				                	<div class="col-md-2" style="border-left:6px solid #559927;">
				                	</div>
				                	<div class="col-md-2" style="border-top:6px solid #c69a04;border-left:6px solid #c69a04;">
				                	</div>
			                		<div class="col-md-2" style="border-top:6px solid #c69a04;border-left:6px solid #c69a04;">
				                	</div>
				                	<div class="col-md-2" style="border-top:6px solid #c69a04;border-left:6px solid #c69a04;">
				                	</div>
				                	<div class="col-md-2" style="border-left:6px solid #c69a04;">
				                	</div>
				                
				                </div>
				                <div class="row">
				                	<div class="col-md-2">
				                	</div>
				                	<div class="col-md-1" style="border-left:6px solid #559927;">
			               	 		</div>
			               	 		<div class="col-md-2">
			               	 			<label class="margin_bottom_0 font_weight700">계량기불감수량</label><br>
					                    <label class="margin_bottom_0">9130450</label>
			               	 		</div>
			               	 		<div class="col-md-2">
			               	 			<label class="margin_bottom_0 font_weight700">수도사업용수량</label><br>
					                    <label class="margin_bottom_0">9130450</label>
			               	 		</div>
			               	 		<div class="col-md-2">
			               	 			<label class="margin_bottom_0 font_weight700">공공수량</label><br>
					                    <label class="margin_bottom_0">9130450</label>
			               	 		</div>
			               	 		<div class="col-md-2">
			               	 			<label class="margin_bottom_0 font_weight700">부정사용량</label><br>
					                    <label class="margin_bottom_0">9130450</label>
			               	 		</div>
				                </div>
				                <div class="row" style="height:10px">
				                	<div class="col-md-1" style="border-right:6px solid #559927;">
				                	</div>
				                	<div class="col-md-2" style="border-top:6px solid #559927;border-right:6px solid #559927;">
				                	</div>
				                	<div class="col-md-2" style="border-top:6px solid #559927;border-right:6px solid #559927;">
				                	</div>
				                	<div class="col-md-2" style="border-top:6px solid #559927;border-right:6px solid #559927;">
				                	</div>
			                	</div>
				                <div class="row">
				                	<div class="col-md-2">
				                		<label class="margin_bottom_0 font_weight700">계량요금수량</label><br>
					                    <label class="margin_bottom_0">9130450</label>
				                	</div>
				                	<div class="col-md-2">
				                		<label class="margin_bottom_0 font_weight700">미계량요금수량</label><br>
					                    <label class="margin_bottom_0">9130450</label>
				                	</div>
				                	<div class="col-md-2">
				                		<label class="margin_bottom_0 font_weight700">분수량</label><br>
					                    <label class="margin_bottom_0">9130450</label>
				                	</div>
				                	<div class="col-md-2">
				                		<label class="margin_bottom_0 font_weight700">기타부과량</label><br>
					                    <label class="margin_bottom_0">9130450</label>
				                	</div>
				                </div> 
				                
								<div class="row mt-20">
									<div class="col-md-4" style="padding:0;border:1px solid #f4f5f8;">
										<div class="d-flex justify-content-center align-items-center table-header">누수량(톤)</div>
									</div>
									<div class="col-md-4" style="padding:0;border:1px solid #f4f5f8;">
										<div class="d-flex justify-content-center align-items-center table-header">누수율</div>
										<div id="gaugeChart2" style="height:120px;"></div>
									</div>
									<div class = "col-md-4" style="padding:0;border:1px solid #f4f5f8;">
										<div class="d-flex justify-content-center align-items-center table-header">유수율</div>
										<div id="gaugeChart3" style="height:120px;">
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<table class="table table-bordered m-table" style="line-height:0.7rem;font-size:16px;font-weight:800">
									<colgroup>
										<col style="width:50%;">
										<col style="width:50%;">
									</colgroup>
									<tr style="text-align:center;">
										<td style="background-color:#358097;color:#FFFFFF;">항목</td>
										<td style="background-color:#358097;color:#FFFFFF;">수량</td>
									</tr>
									<tr>
										<td style="background-color:#4cbeff;color:#FFFFFF;">
											총 공급량
										</td>
										<td style="background-color:#4cbeff;color:#FFFFFF;text-align:right;">
											9130450287
										</td>
									</tr>
									<tr>
										<td style="background-color:#bf4336;color:#FFFFFF;font-weight:800">
											유효수량
										</td>
										<td style="background-color:#bf4336;color:#FFFFFF;text-align:right;">
											913045
										</td>
									</tr>
									<tr>
										<td style="background-color:#559927;color:#FFFFFF;">
											유수수량
										</td>
										<td style="background-color:#559927;color:#FFFFFF;text-align:right;">
											9130
										</td>
									</tr>
									<tr>
										<td>
											계량요금수량
										</td>
										<td style="text-align:right;">
											34234
										</td>
									</tr>
									<tr>
										<td>
											미계량요금수량
										</td>
										<td style="text-align:right;">
											13423
										</td>
									</tr>
									<tr>
										<td>
											분수량
										</td>
										<td style="text-align:right;">
											123125
										</td>
									</tr>
									<tr>
										<td>
											기타부과량
										</td>
										<td style="text-align:right;">
											123425
										</td>
									</tr>
									<tr>
										<td style="background-color:#c69a04;color:#FFFFFF;">
											무수수량
										</td>
										<td style="background-color:#c69a04;color:#FFFFFF;text-align:right;">
											144141
										</td>
									</tr>
									<tr>
										<td>
											계량기불감수량
										</td>
										<td style="text-align:right;">
											1234234
										</td>
									</tr>
									<tr>
										<td>
											수도사업용수량
										</td>
										<td style="text-align:right;">
											12342
										</td>
									</tr>
									<tr>
										<td>
											공공수량
										</td>
										<td style="text-align:right;">
											2134234
										</td>
									</tr>
									<tr>
										<td style="font-weight:800">
											부정수량
										</td>
										<td style="text-align:right;">
											12313
										</td>
									</tr>
									<tr>
										<td style="background-color:#bf4336;color:#FFFFFF;">
											무효수량
										</td>
										<td style="background-color:#bf4336;color:#FFFFFF;text-align:right;">
											12312321135
										</td>
									</tr>
									<tr>
										<td style="font-weight:800">
											조정감액수량
										</td>
										<td style="text-align:right;font-weight:800">
											12313
										</td>
									</tr>
									<tr>
										<td >
											누수수량
										</td>
										<td style="text-align:right;">
											12313
										</td>
									</tr>
								</table>
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
	$("#startDatePicker").datepicker({
		minViewMode: "months",
		autoApply: true,
		autoclose: true,
		orientation:"Bottom left",
		format:"yyyy-mm",
	});

	$("#endDatePicker").datepicker({
		minViewMode: "months",
		autoApply: true,
		autoclose: true,
		orientation:"Bottom left",
		format:"yyyy-mm",
	});

	const d = new Date();

	$("#startDatePicker").datepicker("setDate", new Date(d.getFullYear(), d.getMonth() - 1, d.getDate()));
	$("#endDatePicker").datepicker("setDate", new Date());

	function checkBox() {
		var checkbox = document.getElementsByName('checkbox');
		var checkboxLength = checkbox.length;
		if ($('#checkBoxAll').is(":checked")){
			for(var i = 0; i < checkboxLength; i++){
				checkbox[i].checked = true;
			}
		} else{
			for(var i=0; i<checkboxLength; i++){
				checkbox[i].checked = false;
			}
		}
	}

	$("#searchBtn").click(function() {
		var startDate = $('#startDatePicker').val();
		var endDate = $('#endDatePicker').val();
		
		if (startDate == '') {
			alert("시작 날짜를 선택하세요.");
			return;
		}
		if (endDate == '') {
			alert("종료 날짜를 선택하세요.");
			return;
		}
		if (startDate > endDate) {
			alert("날짜 범위를 잘못 선택하세요.");
			return;
		}
		
		var checkbox = document.getElementsByName('checkbox');
		var checkboxLength = checkbox.length;
		var checkList = [];
		
		for (var i = 0; i < checkboxLength; i++){
			if (checkbox[i].checked) {
				checkList.push(checkbox[i].value);
			}
		}
		
		setColligation(checkList, $('#startDatePicker').val(), $('#endDatePicker').val() );
	});

	var gaugeChart2 = AmCharts.makeChart("gaugeChart2", {
		"type": "gauge",
	 	"theme": "light",
	  	"axes": [{
		    "axisAlpha": 0,
		    "tickAlpha": 0,
		    "labelsEnabled": false,
		    "startValue": 0,
		    "endValue": 100,
		    "startAngle": 0,
		    "endAngle": 360,
		    "bands": [{
			    "color": "#383838",
			    "startValue": 0,
			    "endValue": 100,
			    "radius": "100%",
			    "innerRadius": "75%",
			    "bandAlpha":0
		    },{
			    "color": "#FF0000",
			    "startValue": 0,
			    "endValue": 100,
			    "radius": "100%",
			    "innerRadius": "75%"
		    }
		  	]}
	  	],
		"allLabels": [{
			"text": "50",
		  	"x": "45.5%",
		  	"y": "41%",
		  	"size": 15,
		  	"bold": true,
		  	"color": "#383838"
		}],
		"creditsPosition" : "bottom-left"
	});

	var gaugeChart3 = AmCharts.makeChart("gaugeChart3", {
		"type": "gauge",
	 	"theme": "light",
	  	"axes": [{
		    "axisAlpha": 0,
		    "tickAlpha": 0,
		    "labelsEnabled": false,
		    "startValue": 0,
		    "endValue": 100,
		    "startAngle": 0,
		    "endAngle": 360,
		    "bands": [{
			    "color": "#383838",
			    "startValue": 0,
			    "endValue": 100,
			    "radius": "100%",
			    "innerRadius": "75%",
			    "bandAlpha":0
		    },{
			    "color": "#FFFFFF",
			    "startValue": 0,
			    "endValue": 0,
			    "radius": "100%",
			    "innerRadius": "75%"
		    }
		  	]}
	  	],
		"allLabels": [{
			"text": "0",
		  	"x": "48%",
		  	"y": "41%",
		  	"size": 15,
		  	"bold": true,
		  	"color": "#383838"
		}],
		"creditsPosition" : "bottom-left"
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
			height: 310,
			footer: false
		},
		sortable: false,
		pagination: false,
		columns: [{
			field: "startTime",
			title: "블록명",
			textAlign: "center"
		},{
			field: "endTime",
			title: "기간",
			textAlign: "center"

		},{
			field: "alarmType",
			title: "총공급량",
			textAlign: "center"
		},{
			field: "step",
			title: "유수수량",
			textAlign: "center"
		},{
			field: "durationTime",
			title: "무수수량",
			textAlign: "center"
		},{
			field: "durationTime",
			title: "누수량",
			textAlign: "center"
		},{
			field: "durationTime",
			title: "유수율",
			textAlign: "center"
		}]
	}

	function setColligation(checkList, startDate, endDate) {
		$("#m_datatable").mDatatable("destroy");
		$("#m_datatable").mDatatable(table); 
		
		var data = {"startDate":startDate, "endDate":endDate, "checkList":checkList};

		$.ajax({
			url: contextPath + "/flux/colligation/search",
			type: "get",
			dataType: "json",
			data: data,
			success: function(data) {
				console.log("ajax : " + data);
			}
		});
		/* $.ajax({
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
				var pieChart = makePieChart("pieChartdiv");
			}
		}); */
	}
	
	var checkbox = document.getElementsByName('checkbox');
	var checkboxLength = checkbox.length;
	var checkList = [];
	for (var i = 0; i < checkboxLength; i++){
		if (checkbox[i].checked){
			checkList.push(checkbox[i].value);
		}
	}
	
	setColligation(checkList, $('#startDatePicker').val(), $('#endDatePicker').val() );
});

/* var e = JSON.parse('[{ "RecordID": "소블록A","OrderID": "2015년 4월","ShipCountry": "227,487","ShipCity": "0","ShipName": "0","ShipAddress": "0","CompanyEmail": "0","CompanyAgent": "0"},{ "RecordID": "소블록A","OrderID": "2015년 4월","ShipCountry": "227,487","ShipCity": "0","ShipName": "0","ShipAddress": "0","CompanyEmail": "0","CompanyAgent": "0"},{ "RecordID": "소블록A","OrderID": "2015년 4월","ShipCountry": "227,487","ShipCity": "0","ShipName": "0","ShipAddress": "0","CompanyEmail": "0","CompanyAgent": "0"},{ "RecordID": "소블록A","OrderID": "2015년 4월","ShipCountry": "227,487","ShipCity": "0","ShipName": "0","ShipAddress": "0","CompanyEmail": "0","CompanyAgent": "0"},{ "RecordID": "소블록A","OrderID": "2015년 4월","ShipCountry": "227,487","ShipCity": "0","ShipName": "0","ShipAddress": "0","CompanyEmail": "0","CompanyAgent": "0"},{ "RecordID": "소블록A","OrderID": "2015년 4월","ShipCountry": "227,487","ShipCity": "0","ShipName": "0","ShipAddress": "0","CompanyEmail": "0","CompanyAgent": "0"},{ "RecordID": "소블록A","OrderID": "2015년 4월","ShipCountry": "227,487","ShipCity": "0","ShipName": "0","ShipAddress": "0","CompanyEmail": "0","CompanyAgent": "0"},{ "RecordID": "소블록A","OrderID": "2015년 4월","ShipCountry": "227,487","ShipCity": "0","ShipName": "0","ShipAddress": "0","CompanyEmail": "0","CompanyAgent": "0"},{ "RecordID": "소블록A","OrderID": "2015년 4월","ShipCountry": "227,487","ShipCity": "0","ShipName": "0","ShipAddress": "0","CompanyEmail": "0","CompanyAgent": "0"},{ "RecordID": "소블록A","OrderID": "2015년 4월","ShipCountry": "227,487","ShipCity": "0","ShipName": "0","ShipAddress": "0","CompanyEmail": "0","CompanyAgent": "0"},{ "RecordID": "소블록A","OrderID": "2015년 4월","ShipCountry": "227,487","ShipCity": "0","ShipName": "0","ShipAddress": "0","CompanyEmail": "0","CompanyAgent": "0"},{ "RecordID": "소블록A","OrderID": "2015년 4월","ShipCountry": "227,487","ShipCity": "0","ShipName": "0","ShipAddress": "0","CompanyEmail": "0","CompanyAgent": "0"}]');

var tabe= $("#m_datatable").mDatatable({
    data: {
        type: "local",
        source:e,
        pageSize: 10,
       
    },
    layout: {
        scroll: !0,  // 스크롤  y축 
        height: 310, // min-height: 300px; 스크롤 x 축
        footer: !1  //아래 레이어 컬럼 생성 유무
    },
    sortable: !0, //컬럼 선택을 통한 순서 선택 유무
    pagination: !1, //패이지네이션 생성 유무
    columns: [{
        field: "RecordID",
        title: "블록명",
        sortable: !1,
        width: 100,
        selector: !1,
        textAlign: "center"
    }, {
        field: "OrderID",
        title: "기간"
    }, {
        field: "ShipCountry",
        title: "총공급량"
    }, {
        field: "ShipCity",
        title: "유수수량"
    }, {
        field: "ShipName",
        title: "무수수량",
    }, {
        field: "ShipCity",
        title: "무효수량",
    }, {
        field: "ShipCity",
        title: "누수량",
    }, {
        field: "ShipCity",
        title: "유수율",
    }]
}); */

</script>