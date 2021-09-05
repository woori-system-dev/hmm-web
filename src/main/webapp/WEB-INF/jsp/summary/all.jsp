<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tagLib.jsp"%>

<style>
.m-portlet.m-portlet--full-height {
	height: 95%;
}

.m-section, .m-section .m-section__content {
	margin: 0;
}

.m-portlet {
	margin-bottom: 10px;
}

.m-portlet .m-portlet__head {
	height: 3.6rem;
	padding: 0 1.6rem;
}

.m-portlet .m-portlet__body {
	padding: 0;
}

.m-portlet__body .row {
	margin-left: 0;
	margin-right: 0;
}

.table {
	margin-bottom: 0;
}

.table td, .table th {
	padding: 0.3rem;
}

.table-text {
	text-align: right;
	font-weight: 600;
	color: #ec7959
}
</style>

<div class="m-grid__item m-grid__item--fluid m-wrapper">
	<div class="m-subheader">
		<div class="d-flex align-items-center">
			<div class="mr-auto">
				<h3 class="m-subheader__title">
					종합 요약 <i class="la la-angle-right arrow-icon"></i> <small>전체</small>
				</h3>
			</div>
		</div>
	</div>
	<div class="m-content">
		<div class="row">
			<div class="col-md-1">
				<div class="m-stack m-stack--hor m-stack--general m-stack--demo text-center" style="height:25px">
					<div class="m-stack__item">
						<div class="m-stack__demo-item">
							<a href="${pageContext.request.contextPath}/summary/all" class="color-black">
								전체
							</a>
						</div>
					</div>
					<c:forEach var="list" items="${blockList}" varStatus="domain">
						<div class="m-stack__item">
							<div class="m-stack__demo-item">
								<a href="${pageContext.request.contextPath}/summary/block?block=${list.bkNm}" class="color-black">
									${list.bkNm}
								</a>	
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-md-11">
				<div class="row">
					<div class="col-md-4">
						<div class="m-portlet m-portlet--full-height ">
							<div class="m-portlet__head">
								<div class="m-portlet__head-caption">
									<div class="m-portlet__head-title">
								 		<span class="m-portlet__head-icon">
											<i class="flaticon-add"></i>
									 	</span>
										<h3 class="m-portlet__head-text">
											일반현황
										</h3>
									</div>
								</div>
							</div>
							<div class="m-portlet__body">
								<div class="row">
									<div class = "col-md-12" style="padding:20px 0 0 25px;">
										<table style="font-size:16px;">
											<colgroup>
												<col style="width:25%;">
												<col style="width:25%;">
												<col style="width:30%;">
												<col style="width:20%;">
											</colgroup>
											<tr>
												<td>급수전수</td>
												<td class="table-text">${summaryInfo.bkWspPopCo} 전</td>
												<td class="text-right">소블록갯수</td>
												<td class="table-text">${summaryInfo.smallBlockNum} 개</td>
											</tr>
											<tr>
												<td>관로연장</td>
												<td class="table-text">${summaryInfo.bkPipeEx} km</td>
												<td class="text-right">관리블록갯수</td>
												<td class="table-text">${summaryInfo.manageBlockNum} 개</td>
											</tr>
											<tr>
												<td>1시간적산유량</td>
												<td class="table-text" colspan="2">${summaryInfo.hourSumFlow} ㎥/s</td>
											</tr>
											<tr>
												<td>금일적산유량</td>
												<td class="table-text" colspan="2">${summaryInfo.todaySumFlow} ㎥/s</td>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="m-portlet m-portlet--full-height ">
							<div class="m-portlet__head">
								<div class="m-portlet__head-caption">
									<div class="m-portlet__head-title">
										<span class="m-portlet__head-icon">
											<i class="flaticon-add"></i>
									 	</span>
										<h3 class="m-portlet__head-text">
											유수율
										</h3>
									</div>
								</div>
							</div>
							<div class="m-portlet__body">
								<div class="row">
									<div class="col-md-4" style="padding:0;">
										<span class="m--font-boldest" style="position:absolute;top: 8%;left: 42%;">
											전체
										</span>
										<div id="gaugeChart" style="height:120px;margin-top:20px"></div>
									</div>
									<div class = "col-md-4" style="padding:0;text-align:center;">
										<span class="m--font-boldest" style="position:absolute;top: 8%;left: 20%;">
											최상(소블록O)
										</span>
										<div id="gaugeChart2" style="height:120px;margin-top:20px"></div>
									</div>
									<div class = "col-md-4" style="padding:0;text-align:center;">
										<span class="m--font-boldest" style="position:absolute;top: 8%;left: 20%;">
											최하(소블록A)
										</span>
										<div id="gaugeChart3" style="height:120px;margin-top:20px"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="m-portlet m-portlet--full-height">
							<div class="m-portlet__head">
								<div class="m-portlet__head-caption">
									<div class="m-portlet__head-title">
										<span class="m-portlet__head-icon">
											<i class="flaticon-add"></i>
									 	</span>
										<h3 class="m-portlet__head-text">
											날씨/시간
										</h3>
									</div>
								</div>
							</div>
							<div class="m-portlet__body">
								<div class="row">
									<div class="col-md-3 text-center pl-15 font-black pt-10">
										<img src="../images/weather/${weatherImage}" style="width: 90px">
										${weather.sky}
									</div>
									<div class="col-md-5" style="text-align: center;">
										<div class="row" style="margin-top:14px">
											<div class="col-md-6" style="padding:0px">
												<img src="../images/weather/temperature.png">&nbsp;기온
											</div>
											<div class="col-md-6">
												 ${weather.temperature} ℃
											</div>
										</div>
										<div class="row" style="margin-top:14px">
											<div class="col-md-6" style="padding:0px">
												<img src="../images/weather/humidity.png">&nbsp;습도
											</div>
											<div class="col-md-6">
												${weather.humidity} %
											</div>
										</div>
										<div class="row" style="margin-top:14px">
											<div class="col-md-6" style="padding:0px">
												<img src="../images/weather/wind.png">&nbsp;풍속
											</div>
											<div class="col-md-6">
												${weather.windspeed} m/s
											</div>
										</div>
									</div>
									<div class="col-md-4" style="text-align:center;">
										<div style="margin-top:5px;font-weight:700;" id="time_year"></div>
										<div style="color:#716aca;font-weight:800;" id="time_day"></div>
										<div style="color:#716aca;font-size:32px; font-weight:900;" id="time_date"></div>
										<div style="font-weight:700;font-size:24px;" id="time_hours"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-6">
						<div class="m-portlet m-portlet--full-height ">
							<div class="m-portlet__head">
								<div class="m-portlet__head-caption">
									<div class="m-portlet__head-title">
										<span class="m-portlet__head-icon">
											<i class="flaticon-add"></i>
									 	</span>
										<h3 class="m-portlet__head-text">
											계측이력
										</h3>
									</div>
								</div>
							</div>
							<div class="m-portlet__body">
								<div class="row">
									<div class="col-8 px-0">
										<div id="measurementChart" style="width: 100%; height: 230px;"></div>
									</div>
									<div class="col-4" style="padding:30px 30px 20px 20px"> 
										<table style="font-size:16px;font-weight:600; width:100%">
											<tr>
												<td style="font-size:18px;">총예상수요량</td>
											</tr>
											<tr>
												<td style="text-align:right;color:#ec7959">99236 m²</td>
											</tr>
											<tr>
												<td style="font-size:18px;">현재수요량</td>
											</tr>
											<tr>
												<td style="text-align:right;color:#ec7959">38177 m²</td>
											</tr>
											<tr>
												<td style="font-size:18px;">남은수요량</td>
											</tr>
											<tr>
												<td style="text-align:right;color:#ec7959">61059 m²</td>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="m-portlet m-portlet--full-height ">
							<div class="m-portlet__head">
								<div class="m-portlet__head-caption">
									<div class="m-portlet__head-title">
										<span class="m-portlet__head-icon">
											<i class="flaticon-add"></i>
									 	</span>
										<h3 class="m-portlet__head-text">
											알람 모니터링
										</h3>
									</div>
								</div>
							</div>
							<div class="m-portlet__body">
								<div class="row" style="margin:0px;border-bottom:1px solid;">
									<div class="col-md-4" style="padding:0;border-right:1px solid;">
										<div class="row">
											<div class="col-md-7 text-right">
												<h3 style="margin-top:30px;font-weight:700;">수압이상</h3>
											</div>
											<div class="col-md-5 p-0">
												<div id="pressureChart" style="height:90px;"></div>
											</div>
										</div>
									</div>
									<div class="col-md-4" style="padding:0;text-align:center;border-right:1px solid;">
										<div class="row">
											<div class="col-md-7 text-right">
												<h3 style="margin-top:30px;font-weight:700;">기기이상</h3>
											</div>
											<div class="col-md-5 p-0">
												<div id="deviceChart" style="height:90px;">
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-4" style="padding:0;text-align:center;">
										<div class="row">
											<div class="col-md-7 text-right">
												<h3 style="margin-top:30px;font-weight:700;">누수추정</h3>
											</div>
											<div class="col-md-5 p-0">
												<div id="leakageChart" style="height:90px;">
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row" style="margin:0px;height:150px">
									<div id="pressureAlarm" class="col-md-4 p-10 text-center" style="border-right:1px solid #000000;color:#db1a48"></div>
									<div id="deviceAlarm" class="col-md-4 p-10 text-center" style="border-right:1px solid #000000;color:#0085bf"></div>
									<div id="leakageAlarm" class="col-md-4 p-10 text-center" style="color:#eef430"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-6">
						<div class="m-portlet m-portlet--full-height">
							<div class="m-portlet__head">
								<div class="m-portlet__head-caption">
									<div class="m-portlet__head-title">
										<span class="m-portlet__head-icon">
											<i class="flaticon-add"></i>
										 </span>
										<h3 class="m-portlet__head-text">
											월별 수요량 그래프
										</h3>
									</div>
								</div>
							</div>
							<div class="m-portlet__body">
								<div id="flowMonthChart" style="width:100%; height:250px; margin-top: 10px;"></div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="m-portlet m-portlet--full-height ">
							<div class="m-portlet__head">
								<div class="m-portlet__head-caption">
									<div class="m-portlet__head-title">
										<span class="m-portlet__head-icon">
											<i class="flaticon-add"></i>
									 	</span>
										<h3 class="m-portlet__head-text">
											금일 알람 이력
										</h3>
									</div>
								</div>
							</div>
							<div class="m-portlet__body">
								<div id="m_datatable"></div>
							</div>
						</div>
					</div>
				</div>	
			</div>
		</div>
	</div>
</div>

<script>
var chartData2 = [
    {
        "year": 1995,
        "cars": 1567,
    },
    {
        "year": 1996,
        "cars": 1617,
    },
    {
        "year": 1997,
        "cars": 1630,
    },
    {
        "year": 1998,
        "cars": 1660,
    },
    {
        "year": 1999,
        "cars": 1683,
    },
    {
        "year": 2000,
        "cars": 1691,
    },
    {
        "year": 2001,
        "cars": 1298,
    },
    {
        "year": 2002,
        "cars": 1275,
    },
    {
        "year": 2003,
        "cars": 1246,
    },
    {
        "year": 2004,
        "cars": 1218,
    },
    {
        "year": 2005,
        "cars": 1213,
    },
    {
        "year": 2006,
        "cars": 1199,
    },
    {
        "year": 2007,
        "cars": 1110,
    },
    {
        "year": 2008,
        "cars": 1165,
    },
    {
        "year": 2009,
        "cars": 1145,
    },
    {
        "year": 2010,
        "cars": 1163,
    },
    {
        "year": 2011,
        "cars": 1180,
    },
    {
        "year": 2012,
        "cars": 1159,
    }
];

$(document).ready(function() {
	var week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');
	var time = new Date();
	$("#time_year").text(time.getFullYear() + " " +(time.getMonth() + 1));  
	$("#time_day").text(week[time.getDay()]);  
	$("#time_date").text(time.getDate());  
	$("#time_hours").text(time.getHours() + ":" + time.getMinutes() + ":" + time.getSeconds());  

	GaugeCharts.grayAndGreen("gaugeChart", 0);
	GaugeCharts.grayAndGreen("gaugeChart2", 0);
	GaugeCharts.grayAndGreen("gaugeChart3", 0);

	$.ajax({
		url: contextPath + "/summary/all/data",
		type: "get",
		dataType: "json",
		success: function(response) {
			console.log(response.flowSummaryMonths);
			makeMeasurementHourAmChart("measurementChart", response.measurementChart);
			//Charts.flowMonth("flowMonthChart", response.flowSummaryMonths);
			makeLineChart("flowMonthChart", response.flowSummaryMonths);
			
			var pressureAlarmText = "";
			var deviceAlarmText = "";
			var leakageAlarmText = "";
			
			$.each(response.pressureAlarm, function(idx, value) { 
				pressureAlarmText += value + " ";
			});

			$.each(response.deviceAlarm, function(idx, value) { 
				deviceAlarmText += value + " ";
			});

			$.each(response.leakageAlarm, function(idx, value) { 
				leakageAlarmText += value + " ";
			});

			$("#pressureAlarm").text(pressureAlarmText);
			$("#deviceAlarm").text(deviceAlarmText);
			$("#leakageAlarm").text(leakageAlarmText);
			
			GaugeCharts.pressure("pressureChart", response.pressureAlarm.length);
			GaugeCharts.device("deviceChart", response.deviceAlarm.length);
			GaugeCharts.leakage("leakageChart", response.leakageAlarm.length);
		},
		beforeSend:function(){
	        $('.loading-container').removeClass('display-none');
	    },
	    complete:function(){
	        $('.loading-container').addClass('display-none');
	    }
	});
});

var e = JSON.parse('[{ "RecordID": "소블록A","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분(00:00 - 06:35)"},{ "RecordID": "소블록A","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분(00:00 - 06:35)"},{ "RecordID": "소블록A","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분(00:00 - 06:35)"},{ "RecordID": "소블록A","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분(00:00 - 06:35)"},{ "RecordID": "소블록A","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분(00:00 - 06:35)"},{ "RecordID": "소블록A","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분(00:00 - 06:35)"},{ "RecordID": "소블록A","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분(00:00 - 06:35)"},{ "RecordID": "소블록A","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분(00:00 - 06:35)"},{ "RecordID": "소블록A","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분(00:00 - 06:35)"},{ "RecordID": "소블록A","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분(00:00 - 06:35)"},{ "RecordID": "소블록A","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분(00:00 - 06:35)"},{ "RecordID": "소블록A","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분(00:00 - 06:35)"}]');
	var table = $("#m_datatable").mDatatable({
    data: {
        type: "local",
        source:e,
        pageSize: 10,
       
    },
    layout: {
        scroll: !0,  // 스크롤  y축 
        height: 300, // min-height: 300px; 스크롤 x 축
        footer: !1  //아래 레이어 컬럼 생성 유무
    },
    sortable: !0, //컬럼 선택을 통한 순서 선택 유무
    pagination: !1, //패이지네이션 생성 유무
    columns: [{
        field: "RecordID",
        title: "블록명",
        sortable: !1,
        selector: !1,
        width: 60,
        textAlign: "center"
    }, {
        field: "OrderID",
        title: "알람종류",
        filterable: !1,
        width: 60,
        textAlign: "center"
    }, {
        field: "ShipCountry",
        title: "단계",
        width: 40,
   	    textAlign: "center"
    }, {
        field: "ShipCity",
        title: "건수",
        width: 40,
   	   	textAlign: "center"
    }, {
        field: "ShipName",
        title: "최대지속시간",
   	   	textAlign: "center"
    }]
});
</script>
