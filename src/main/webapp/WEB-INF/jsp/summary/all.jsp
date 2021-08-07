<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tagLib.jsp"%>

<style>
.m-portlet.m-portlet--full-height {
	height: 95%;
}

.m-section {
	margin: 0;
}

.m-portlet {
	margin-bottom: 10px;
}

.m-portlet .m-portlet__head {
	height: 3rem;
}

.m-portlet .m-portlet__body {
	padding: 0;
}

.m-section .m-section__content {
	margin: 0;
}

.table {
	margin-bottom: 0;
}

.table td, .table th {
	padding: 0.3rem;
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
				<div class="m-stack m-stack--hor m-stack--general m-stack--demo" style="text-align: center;height:25px">
					<div class="m-stack__item">
						<div class="m-stack__demo-item">
							<a href="${pageContext.request.contextPath}/summary/all" style="color:#000000">
								전체
							</a>
						</div>
					</div>
					<c:forEach var="list" items="${blockList}" varStatus="domain">
						<div class="m-stack__item">
							<div class="m-stack__demo-item">
								<a href="${pageContext.request.contextPath}/summary/block?block=${list.bkNm}" style="color:#000000">
									${list.bkNm}
								</a>	
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class = "col-md-11">
				<div class = "row">
					<div class = "col-md-4">
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
									<div class = "col-md-12" style="padding:20px 0px 0px 40px;">
										<table style="font-size:16px;">
											<colgroup>
												<col style="width:25%;">
												<col style="width:25%;">
												<col style="width:30%;">
												<col style="width:20%;">
											</colgroup>
											<tr>
												<td>
													급수전수
												</td>
												<td style="text-align:right;font-weight:600;color:#ec7959">
													1012 전
												</td>
												<td style="text-align:right">
													소블록갯수
												</td>
												<td style="text-align:right;font-weight:600;color:#ec7959">
													15 개
												</td>
											</tr>
											<tr>
												<td >
													관로연장
												</td>
												<td style="text-align:right;font-weight:600;color:#ec7959">
													km
												</td>
												<td style="text-align:right">
													관리블록갯수
												</td>
												<td style="text-align:right;font-weight:600;color:#ec7959">
													2 개
												</td>
											</tr>
											<tr>
												<td>
													1시간적산유량
												</td>
												<td style="text-align:right;font-weight:600;color:#ec7959">
													2706 m²
												</td>
											</tr>
											<tr>
												<td>
													금일적산유량
												</td>
												<td style="text-align:right;font-weight:600;color:#ec7959">
													38177 m²
												</td>
											</tr>
										</table>
										<!-- <table class="table table-bordered m-table" style="margin-top: 15px">
											<colgroup>
												<col style="width:25%;">
												<col style="width:25%;">
												<col style="width:25%;">
												<col style="width:25%;">
											</colgroup>
											<tr>
												<td style="background-color:#358097;color:#FFFFFF">
													급수전수
												</td>
												<td style="text-align:right;">
													1012 전
												</td>
												<td style="background-color:#358097;color:#FFFFFF">
													소블록갯수
												</td>
												<td style="text-align:right;">
													15 개
												</td>
											</tr>
											<tr>
												<td style="background-color:#358097;color:#FFFFFF">
													관로연장
												</td>
												<td style="text-align:right;">
													km
												</td>
												<td style="background-color:#358097;color:#FFFFFF">
													관리블록갯수
												</td>
												<td style="text-align:right;">
													2 개
												</td>
											</tr>
											<tr>
												<td style="background-color:#358097;color:#FFFFFF">
													1시간적산유량
												</td>
												<td style="text-align:right;">
													2706 m²
												</td>
											</tr>
											<tr>
												<td style="background-color:#358097;color:#FFFFFF">
													금일적산유량
												</td>
												<td style="text-align:right;">
													38177 m²
												</td>
											</tr>
										</table> -->
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class = "col-md-4">
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
									<div class = "col-md-4" style="padding:0;">
										<span class="m--font-boldest" style="position:absolute;top: 8%;left: 42%;">
											전체
										</span>
										<div id="gaugeChart" style="height:120px;margin-top:20px">
										</div>
									</div>
									<div class = "col-md-4" style="padding:0;text-align:center;">
										<span class="m--font-boldest" style="position:absolute;top: 8%;left: 20%;">
											최상(소블록O)
										</span>
										<div id="gaugeChart2" style="height:120px;margin-top:20px">
										</div>
									</div>
									<div class = "col-md-4" style="padding:0;text-align:center;">
										<span class="m--font-boldest" style="position:absolute;top: 8%;left: 20%;">
											최하(소블록A)
										</span>
										<div id="gaugeChart3" style="height:120px;margin-top:20px">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class = "col-md-4">
						<div class="m-portlet m-portlet--full-height ">
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
									<div class="col-md-4" style="padding-left:15px;text-align:center;font-weight:700;">
										<img src="../images/weather/weather_cloud_sun.png" style="width: 120px">
										&nbsp&nbsp날씨 좋음
									</div>
									<div class="col-md-4" style="text-align:right;">
										<div class="row" style="margin-top:13px">
											<div class="col-md-5" style="padding:0px">
												<img src="../images/weather/temperature.png"> &nbsp기온
											</div>
											<div class="col-md-7">
												 ${weather.temperature} ℃
											</div>
										</div>
										<div class="row" style="margin-top:13px">
											<div class="col-md-5" style="padding:0px">
												<img src="../images/weather/humidity.png"> &nbsp습도
											</div>
											<div class="col-md-7">
												${weather.humidity} %
											</div>
										</div>
										<div class="row" style="margin-top:13px">
											<div class="col-md-5" style="padding:0px">
												<img src="../images/weather/wind.png" > &nbsp풍속
											</div>
											<div class="col-md-7">
												${weather.windspeed} m/s
											</div>
										</div>
									</div>
									<div class="col-md-4" style="padding-left:0px;text-align:center;">
										<div style="margin-top:5px;font-weight:700;" id ="time_year"></div>
										<div style="color:#716aca;font-weight:800;" id ="time_day"></div>
										<div style="color:#716aca;font-size:40px; font-weight:900;" id ="time_date"></div>
										<div style="font-weight:700;font-size:25px;" id ="time_hours"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class = "row">
					<div class = "col-md-6">
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
									<div class="col-8" style="padding-right:0px;">
										<div id="chartdiv" style="width: 100%; height: 250px;"></div>
									</div>
									<div class="col-4" style="padding:30px 30px 20px 20px"> 
										<table style="font-size:16px;font-weight:600; width:100%">
											<tr>
												<td style="font-size:18px;">
													총예상수요량
												</td>
											</tr>
											<tr>
												<td style="text-align:right;color:#ec7959">
													99236 m²
												</td>
											</tr>
											<tr>
												<td style="font-size:18px;">
													현재수요량
												</td>
											</tr>
											<tr>
												<td style="text-align:right;color:#ec7959">
													38177 m²
												</td>
											</tr>
											<tr>
												<td style="font-size:18px;">
													남은수요량
												</td>
											</tr>
											<tr>
												<td style="text-align:right;color:#ec7959">
													61059 m²
												</td>
											</tr>
									</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class = "col-md-6">
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
									<div class = "col-md-4" style="padding:0;border-right:1px solid;">
										<div class="row">
											<div class="col-md-7" style="text-align:right;">
												<h3 style="margin-top:30px;font-weight:700;">수압이상</h3>
											</div>
											<div class = "col-md-5" style="padding:0;">
												<div id="gaugeChart4" style="height:90px;">
												</div>
											</div>
										</div>
									</div>
									<div class = "col-md-4" style="padding:0;text-align:center;border-right:1px solid;">
										<div class="row">
											<div class="col-md-7" style="text-align:right;">
												<h3 style="margin-top:30px;font-weight:700;">기기이상</h3>
											</div>
											<div class = "col-md-5" style="padding:0;">
												<div id="gaugeChart5" style="height:90px;">
												</div>
											</div>
										</div>
									</div>
									<div class = "col-md-4" style="padding:0;text-align:center;">
										<div class="row">
											<div class="col-md-7" style="text-align:right;">
												<h3 style="margin-top:30px;font-weight:700;">누수추정</h3>
											</div>
											<div class = "col-md-5" style="padding:0;">
												<div id="gaugeChart6" style="height:90px;">
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row" style="margin:0px;height:150px">
									<div class = "col-md-4" style="padding:0;text-align:center;border-right:1px solid #000000;color:#db1a48">
										소블럭A &nbsp&nbsp소블럭B
									</div>
									<div class = "col-md-4" style="padding:0;text-align:center;border-right:1px solid #000000;color:#0085bf">
										소블럭C
									</div>
									<div class = "col-md-4" style="padding:0;text-align:center;color:#eef430">
										소블럭D &nbsp&nbsp소블럭E
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class = "row">
					<div class = "col-md-6">
						<div class="m-portlet m-portlet--full-height ">
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
								<div class="row">
									<div class="col-12" style="padding-right:0px;">
										<div id="chartdiv2" style="width:100%; height:250px;"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class = "col-md-6">
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
var week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');
var time = new Date();
document.getElementById("time_year").textContent = time.getFullYear() + " " +(time.getMonth()+1);  
document.getElementById("time_day").textContent = week[time.getDay()];  
document.getElementById("time_date").textContent = time.getDate();  
document.getElementById("time_hours").textContent =  time.getHours()+":"+time.getMinutes()+":"+ time.getSeconds();  

var gaugeChart = AmCharts.makeChart("gaugeChart", {
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
	  	"x": "47%",
	  	"y": "41%",
	  	"size": 15,
	  	"bold": true,
	  	"color": "#383838"
	}],
	"creditsPosition" : "bottom-left"
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
	  	"x": "47%",
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
	  	"x": "47%",
	  	"y": "41%",
	  	"size": 15,
	  	"bold": true,
	  	"color": "#383838"
	}],
	"creditsPosition" : "bottom-left"
});

var gaugeChart4 = AmCharts.makeChart("gaugeChart4", {
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
		    "color": "#db1a48",
		    "startValue": 0,
		    "endValue": 20,
		    "radius": "100%",
		    "innerRadius": "75%"
	    }
	  	]}
  	],
	"allLabels": [{
		"text": "2",
	  	"x": "47%",
	  	"y": "41%",
	  	"size": 15,
	  	"bold": true,
	  	"color": "#383838"
	}],
	"creditsPosition" : "bottom-left"
});

var gaugeChart5 = AmCharts.makeChart("gaugeChart5", {
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
		    "color": "#0085bf", 
		    "startValue": 0,
		    "endValue": 10,
		    "radius": "100%",
		    "innerRadius": "75%"
	    }
	  	]}
  	],
	"allLabels": [{
		"text": "1",
	  	"x": "47%",
	  	"y": "41%",
	  	"size": 15,
	  	"bold": true,
	  	"color": "#383838"
	}],
	"creditsPosition" : "bottom-left"
});

var gaugeChart6 = AmCharts.makeChart("gaugeChart6", {
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
		    "color": "#eef430",
		    "startValue": 0,
		    "endValue": 20,
		    "radius": "100%",
		    "innerRadius": "75%"
	    }
	  	]}
  	],
	"allLabels": [{
		"text": "2",
	  	"x": "47%",
	  	"y": "41%",
	  	"size": 15,
	  	"bold": true,
	  	"color": "#383838"
	}],
	"creditsPosition" : "bottom-left"
});

var chart;
var chartData = [];

AmCharts.ready(function () {
	generateChartData();
    // SERIAL CHART
    chart = new AmCharts.AmSerialChart();

    chart.dataProvider = chartData;
    chart.categoryField = "date";
    chart.dataDateFormat = "YYYY-MM-DD";
	
    // AXES
    // category
    var categoryAxis = chart.categoryAxis;
    categoryAxis.parseDates = true; // as our data is date-based, we set parseDates to true
    categoryAxis.minPeriod = "DD"; // our data is daily, so we set minPeriod to DD
    categoryAxis.dashLength = 1;
    categoryAxis.gridAlpha = 0.15;
    categoryAxis.axisColor = "#DADADA";

    // value
    var valueAxis = new AmCharts.ValueAxis();
    valueAxis.title="유량";
    valueAxis.axisColor = "#DADADA";
    valueAxis.dashLength = 1;
    valueAxis.logarithmic = true; // this line makes axis logarithmic
    chart.addValueAxis(valueAxis);

    // GRAPH
    var graph = new AmCharts.AmGraph();
    graph.useLineColorForBulletBorder = true;
    graph.bulletBorderAlpha = 1;
    graph.bulletBorderThickness = 2;
    graph.bulletSize = 7;
    graph.valueField = "visits";
    graph.lineThickness = 1;
    graph.lineColor = "#0000FF";
    chart.addGraph(graph);
    
    var graph2 = new AmCharts.AmGraph();
    graph2.useLineColorForBulletBorder = true;
    graph2.bulletBorderAlpha = 1;
    graph2.bulletBorderThickness = 2;
    graph2.bulletSize = 7;
    graph2.valueField = "hits";
    graph2.lineThickness = 1;
    graph2.lineColor = "#FF0000";
    chart.addGraph(graph2);

    // CURSOR
    var chartCursor = new AmCharts.ChartCursor();
    chartCursor.cursorPosition = "mouse";
    chart.addChartCursor(chartCursor);

    // WRITE
    chart.write("chartdiv");
});

function generateChartData() {
    var firstDate = new Date();
    firstDate.setDate(firstDate.getDate() - 50);

    for (var i = 0; i < 50; i++) {
        // we create date objects here. In your data, you can have date strings
        // and then set format of your dates using chart.dataDateFormat property,
        // however when possible, use date objects, as this will speed up chart rendering.
        var newDate = new Date(firstDate);
        newDate.setDate(newDate.getDate() + i);

        var visits = Math.round(Math.random() * 40) + 100;
        var hits = Math.round(Math.random() * 40) + 100;

        chartData.push({
            date: newDate,
            visits: visits,
            hits: hits,
        });
    }
}

var chart2;

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

AmCharts.ready(function () {
    // SERIAL CHART
    chart2 = new AmCharts.AmSerialChart();

    chart2.dataProvider = chartData2;
    chart2.marginTop = 10;
    chart2.categoryField = "year";

    // AXES
    // Category
    var categoryAxis = chart2.categoryAxis;
    categoryAxis.gridAlpha = 0.07;
    categoryAxis.axisColor = "#245a76";
    categoryAxis.startOnAxis = true;

    // Value
    var valueAxis = new AmCharts.ValueAxis();
    valueAxis.stackType = "regular"; // this line makes the chart "stacked"
    valueAxis.gridAlpha = 0.07;
    valueAxis.title = "수요량";
    chart2.addValueAxis(valueAxis);

    // GRAPHS
    // first graph
    var graph = new AmCharts.AmGraph();
    graph.type = "line"; // it's simple line graph
    graph.title = "수요량";
    graph.valueField = "cars";
    graph.lineColor = "#245a76";
    graph.lineAlpha = 1;
    graph.fillAlphas = 0.6; // setting fillAlphas to > 0 value makes it area graph
    graph.balloonText = "<span style='font-size:14px; color:#000000;'><b>[[value]]</b></span>";
    chart2.addGraph(graph);

    // CURSOR
    var chartCursor = new AmCharts.ChartCursor();
    chartCursor.cursorAlpha = 0;
    chart2.addChartCursor(chartCursor);

    // WRITE
    chart2.write("chartdiv2");
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
