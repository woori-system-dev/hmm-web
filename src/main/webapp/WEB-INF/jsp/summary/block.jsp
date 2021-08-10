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

.table {
	margin-bottom: 0;
}

.table td, .table th {
	padding: 0.3rem;
}

.monitoring-container {
	margin-top: 0px;
	padding: 10px 10px 10px 10px;
}

.m--font-boldest {
	font-size: 20px;
}
</style>

<div class="m-grid__item m-grid__item--fluid m-wrapper">
	<div class="m-subheader">
		<div class="d-flex align-items-center">
			<div class="mr-auto">
				<h3 class="m-subheader__title">
					종합 요약 <i class="la la-angle-right arrow-icon"></i> <small>${block.bkNm}</small>
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
						<div class="m-portlet m-portlet--full-height">
							<div class="m-portlet__head">
								<div class="m-portlet__head-caption">
									<div class="m-portlet__head-title">
										 <span class="m-portlet__head-icon">
											<i class="flaticon-add"></i>
										 </span>
										<h3 class="m-portlet__head-text">
											블록일반현황
										</h3>
									</div>
								</div>
							</div>
							<div class="m-portlet__body">
								<div class="row">
									<div class = "col-md-4">
										<div id="map" class="map" style="width:100%;height:150px"></div>
									</div>
									<div class = "col-md-4" style="padding:0 0 0 0">
										<table class="table table-bordered m-table" style="margin-top: 15px">
											<tr>
												<td style="background-color:#358097;color:#FFFFFF">
													급수전수
												</td>
												<td style="text-align:right;">
													 86 전
												</td>
											</tr>
											<tr>
												<td style="background-color:#358097;color:#FFFFFF">
													관로연장
												</td>
												<td style="text-align:right;">
													${block.bkPipeEx} km
												</td>
											</tr>
											<tr>
												<td style="background-color:#358097;color:#FFFFFF">
													1시간적산유량
												</td>
												<td style="text-align:right;">
													24 m²
												</td>
											</tr>
											<tr>
												<td style="background-color:#358097;color:#FFFFFF">
													금일적산유량
												</td>
												<td style="text-align:right;">
													307 m²
												</td>
											</tr>
										</table>
									</div>
									<div class = "col-md-4" style="padding:0 15px 0 0;text-align:center;">
										<span class="m--font-boldest">
											유수율
										</span>
										<div id="chartdiv0" style="height:120px">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class = "col-md-4">
						<div class="m-portlet m-portlet--full-height">
							<div class="m-portlet__head">
								<div class="m-portlet__head-caption">
									<div class="m-portlet__head-title">
										<span class="m-portlet__head-icon">
											<i class="flaticon-add"></i>
										 </span>
										<h3 class="m-portlet__head-text">
											계측기기정보
										</h3>
									</div>
								</div>
							</div>
							<div class="m-portlet__body">
								<div class="m-section">
									<div class="m-section__content">
										<table class="table m-table" style="text-align:center;">
											<thead>
												<tr>
													<th>
													</th>
													<th style="background-color:#4bc6ff;color:#ffffff">
														유량계
													</th>
													<th style="background-color:#e64b6a;color:#ffffff">
														수압계
													</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<th style="background-color:#358097;color:#ffffff">
														관리번호
													</th>
													<td>
														${flowDevice.ftrIdn}
													</td>
													<td>
														${pressureDevice.ftrIdn}
													</td>
												</tr>
												<tr>
													<th style="background-color:#358097;color:#ffffff">
														설치일자
													</th>
													<td>
														${flowDevice.istYmd}
													</td>
													<td>
														${pressureDevice.istYmd}
													</td>
												</tr>
												<tr>
													<th style="background-color:#358097;color:#ffffff">
														종 류
													</th>
													<td>
														배수유량계
													</td>
													<td>
														고정식
													</td>
												</tr>
												<tr>
													<th style="background-color:#358097;color:#ffffff">
														형 식
													</th>
													<td>
														초음파식
													</td>
													<td>
														전자유량계
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class = "col-md-4">
						<div class="m-portlet m-portlet--full-height">
							<div class="m-portlet__head">
								<div class="m-portlet__head-caption">
									<div class="m-portlet__head-title">
										<span class="m-portlet__head-icon">
											<i class="flaticon-add"></i>
										 </span>
										<h3 class="m-portlet__head-text">
											실시간 모니터링
										</h3>
									</div>
								</div>
							</div>
							<div class="m-portlet__body">
								<div class="row">
									<div class="col-md-5" style="padding-right:0px">
										<div class="monitoring-container block-normal">
											<table class="table table-bordered" style="line-height:0.9">
												<thead>
													<tr>
														<th colspan="3">소블록F</th>
													</tr>
												</thead>
												<tbody>
													<tr class="text-right">
														<td colspan="3">
															<span class="m--font-boldest">6.48</span>&nbsp;&nbsp;kg/cm²
														</td>
													</tr>
													<tr class="text-right">
														<td colspan="3">
															<span class="m--font-boldest">195.90</span>&nbsp;&nbsp;m²/hr
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
									<div class="col-md-7" style="padding:0">
										<div style="text-align:center;margin-top:15px">
											<h4 id= "time">
											</h4>
										</div>
										<div class="row">
											<div class="col-md-4" style="padding-right:0px; text-align:center;">
												<img src="../images/weather/weather_cloud_sun.png" style="width:100%;height:80px">
												&nbsp날씨 좋음
											</div>
											<div class="col-md-8" style="padding-right:0px">
												<div class="row">
													<div class="col-md-5" style="margin-bottom:10px">
														<img src="../images/weather/temperature.png"> 기온
													</div>
													<div class="col-md-7">
														${weather.temperature} ℃
													</div>
												</div>
												<div class="row">
													<div class="col-md-5" style="margin-bottom:10px">
														<img src="../images/weather/humidity.png"> 습도
													</div>
													<div class="col-md-7">
														${weather.humidity} %
													</div>
												</div>
												<div class="row">
													<div class="col-md-5">
														<img src="../images/weather/wind.png" > 풍속
													</div>
													<div class="col-md-7">
														${weather.windspeed} m/s
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class = "row">
					<div class = "col-md-4">
						<div class="m-portlet m-portlet--full-height">
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
								<div id="chartdiv" style="width: 100%; height: 250px;"></div>
							</div>
						</div>
					</div>
					<div class = "col-md-4">
						<div class="m-portlet m-portlet--full-height">
							<div class="m-portlet__head">
								<div class="m-portlet__head-caption">
									<div class="m-portlet__head-title">
										<span class="m-portlet__head-icon">
											<i class="flaticon-add"></i>
										 </span>
										<h3 class="m-portlet__head-text">
											수압분포분석
										</h3>
									</div>
								</div>
							</div>
							<div class="m-portlet__body">
								<div class="row">
									<div class = "col-8" style="padding-right:0px">
										<div id="chartdiv2" style="width: 100%; height: 250px;"></div>
									</div>
									<div class = "col-4" style="padding-left:0px">
										<div id="chartdiv3" style="width: 100%; height: 240px;"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class = "col-md-4">
						<div class="m-portlet m-portlet--full-height">
							<div class="m-portlet__head">
								<div class="m-portlet__head-caption">
									<div class="m-portlet__head-title">
										<span class="m-portlet__head-icon">
											<i class="flaticon-add"></i>
									 	</span>
										<h3 class="m-portlet__head-text">
											금일 야간 누수분석
										</h3>
									</div>
								</div>
							</div>
							<div class="m-portlet__body">
								<div class = "col-12" style="padding-left:0px">
									<div id="chartdiv4" style="width: 100%; height: 150px;"></div>
								</div>
								<div class = "col-12">
									<div class="m-section">
										<div class= "m-section__content">				
									<table class="table table-bordered m-table" style="text-align:center;">
											<tr style="background-color:#076db4;color:#FFFFFF">
												<td colspan="2">
													유량 최대증가
												</td>
												<td colspan="2">
													수압 최대감소
												</td>
												<td rowspan="2" style="vertical-align:middle;">
													누수판단
												</td>
											</tr>
											<tr style="background-color:#358097;color:#FFFFFF">
												<td>
													비율
												</td>
												<td>
													시간
												</td>
												<td>
													비율
												</td>
												<td>
													시간
												</td>
											</tr>
											<tr>
												<td>
													5.4 %
												</td>
												<td>
													00:20~00:30
												</td>
												<td>
													0.4 %
												</td>
												<td>
													00:10~00:20
												</td>
												<td>
													정상
												</td>
											</tr>
									</table>
								</div></div></div>
							</div>
						</div>
					</div>
				</div>	
				<div class = "row">
					<div class = "col-md-4">
						<div class="m-portlet m-portlet--full-height">
							<div class="m-portlet__head">
								<div class="m-portlet__head-caption">
									<div class="m-portlet__head-title">
										<span class="m-portlet__head-icon">
											<i class="flaticon-add"></i>
									 	</span>
										<h3 class="m-portlet__head-text">
											예상 수요량
										</h3>
									</div>
								</div>
							</div>
							<div class="m-portlet__body">
								<div class = "col-12" style="padding-left:0px">
									<div id="chartdiv5" style="width: 100%; height: 220px;"></div>
								</div>
								<div class = "col-12">
									<div class="m-section">
										<div class= "m-section__content">				
											<table class="table table-bordered m-table" style="text-align:center;">
													<tr style="background-color:#076db4;color:#FFFFFF">
														<td>
															총예상수요량
														</td>
														<td>
															현재수요량
														</td>
														<td>
															남은수요량
														</td>
													</tr>
													<tr>
														<td>
															698 m²
														</td>
														<td>
															307 m²
														</td>
														<td>
															391 m²
														</td>
													</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class = "col-md-4">
						<div class="m-portlet m-portlet--full-height">
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
								<div id="m_datatable" style="width: 100%"></div>
							</div>
						</div>
					</div>
					<div class = "col-md-4">
						<div class="m-portlet m-portlet--full-height">
							<div class="m-portlet__head">
								<div class="m-portlet__head-caption">
									<div class="m-portlet__head-title">
										<span class="m-portlet__head-icon">
											<i class="flaticon-add"></i>
									 	</span>
										<h3 class="m-portlet__head-text">
											야간최소유량분석
										</h3>
									</div>
								</div>
							</div>
							<div class="m-portlet__body">
								<div class = "col-12" style="padding-left:0px">
									<div id="chartdiv6" style="width: 100%; height: 220px;"></div>
								</div>
								<div class = "col-12">
									<div class="m-section">
										<div class= "m-section__content">				
											<table class="table table-bordered m-table">
													<tr>
														<td style="background-color:#076db4;color:#FFFFFF">
															야간허용유량
														</td>
														<td style="text-align:right;">
															 20 m²/hr
														</td>
														<td style="background-color:#076db4;color:#FFFFFF">
															누수판단
														</td>
														<td style="text-align:right;">
															정상
														</td>
													</tr>
													<tr>
														<td style="background-color:#076db4;color:#FFFFFF">
															초과일수
														</td>
														<td style="text-align:right;">
															0 일
														</td>
														<td style="background-color:#076db4;color:#FFFFFF">
															예상누수량
														</td>
														<td style="text-align:right;">
															0 m²
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
		</div>
	</div>
</div>

<script>

baseMap('${block.coords}');

var time = new Date();
document.getElementById("time").textContent = time.getFullYear() + "-" +(time.getMonth()+1) + "-" + time.getDate()+ " " + time.getHours()+":"+time.getMinutes();  

var gaugeChart = AmCharts.makeChart("chartdiv0", {
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

 var chart;
 var chartData = [];

 AmCharts.ready(function () {
     // generate some random data first
     generateChartData();

     // SERIAL CHART
     chart = new AmCharts.AmSerialChart();

     chart.dataProvider = chartData;
     chart.categoryField = "date";

     chart.synchronizeGrid = true; // this makes all axes grid to be at the same intervals

     // AXES
     // category
     var categoryAxis = chart.categoryAxis;
     categoryAxis.parseDates = true; // as our data is date-based, we set parseDates to true
     categoryAxis.minPeriod = "DD"; // our data is daily, so we set minPeriod to DD
     categoryAxis.minorGridEnabled = true;
     categoryAxis.axisColor = "#DADADA";
     categoryAxis.twoLineMode = true;
     categoryAxis.dateFormats = [{
          period: 'fff',
          format: 'JJ:NN:SS'
      }, {
          period: 'ss',
          format: 'JJ:NN:SS'
      }, {
          period: 'mm',
          format: 'JJ:NN'
      }, {
          period: 'hh',
          format: 'JJ:NN'
      }, {
          period: 'DD',
          format: 'DD'
      }, {
          period: 'WW',
          format: 'DD'
      }, {
          period: 'MM',
          format: 'MMM'
      }, {
          period: 'YYYY',
          format: 'YYYY'
      }];

     // first value axis (on the left)
     var valueAxis1 = new AmCharts.ValueAxis();
     valueAxis1.title = "유량";
     valueAxis1.axisColor = "#FF1111";
     valueAxis1.axisThickness = 2;
     chart.addValueAxis(valueAxis1);

     // second value axis (on the right)
     var valueAxis2 = new AmCharts.ValueAxis();
     valueAxis2.title = "수압";
     valueAxis2.position = "right"; // this line makes the axis to appear on the right
     valueAxis2.axisColor = "#1111FF";
     valueAxis2.gridAlpha = 0;
     valueAxis2.axisThickness = 2;
     chart.addValueAxis(valueAxis2);

     // GRAPHS
     // first graph
     var graph1 = new AmCharts.AmGraph();
     graph1.valueAxis = valueAxis1; // we have to indicate which value axis should be used
     graph1.title = "유량";
     graph1.valueField = "visits";
     graph1.bullet = "round";
     graph1.lineColor = "#FF1111";
     graph1.hideBulletsCount = 30;
     graph1.bulletBorderThickness = 1;
     chart.addGraph(graph1);

     // second graph
     var graph2 = new AmCharts.AmGraph();
     graph2.valueAxis = valueAxis2; // we have to indicate which value axis should be used
     graph2.title = "수압";
     graph2.valueField = "hits";
     graph2.bullet = "square";
     graph2.lineColor = "#1111FF";
     graph2.hideBulletsCount = 30;
     graph2.bulletBorderThickness = 1;
     chart.addGraph(graph2);

     // CURSOR
     var chartCursor = new AmCharts.ChartCursor();
     chartCursor.cursorAlpha = 0.1;
     chart.addChartCursor(chartCursor);

     // LEGEND
     var legend = new AmCharts.AmLegend();
     legend.marginLeft = 110;
     legend.useGraphSettings = true;
     chart.addLegend(legend);
     // WRITE
     chart.write("chartdiv");
 });

 // generate some random data, quite different range
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
         var hits = Math.round(Math.random() * 80) + 500;

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
         "date": "2012-03-01",
         "price": 20
     },
     {
         "date": "2012-03-02",
         "price": 75
     },
     {
         "date": "2012-03-03",
         "price": 15
     },
     {
         "date": "2012-03-04",
         "price": 75
     },
     {
         "date": "2012-03-05",
         "price": 158
     }
 ];

 AmCharts.ready(function () {

     // SERIAL CHART
     chart2 = new AmCharts.AmSerialChart();

     chart2.dataProvider = chartData2;
     chart2.categoryField = "date";
     chart2.dataDateFormat = "YYYY-MM-DD";

     // AXES
     // category
     var categoryAxis = chart2.categoryAxis;
     categoryAxis.title="수압";
     categoryAxis.parseDates = true; // as our data is date-based, we set parseDates to true
     categoryAxis.minPeriod = "DD"; // our data is daily, so we set minPeriod to DD
     categoryAxis.dashLength = 1;
     categoryAxis.gridAlpha = 0.15;
     categoryAxis.axisColor = "#DADADA";

     // value
     var valueAxis = new AmCharts.ValueAxis();
     valueAxis.title="비율(%)";
     valueAxis.axisColor = "#DADADA";
     valueAxis.dashLength = 1;
     valueAxis.logarithmic = true; // this line makes axis logarithmic
     chart2.addValueAxis(valueAxis);

     // GRAPH
     var graph = new AmCharts.AmGraph();
     graph.type = "smoothedLine";
     graph.bullet = "round";
     graph.bulletColor = "#FFFFFF";
     graph.useLineColorForBulletBorder = true;
     graph.bulletBorderAlpha = 1;
     graph.bulletBorderThickness = 2;
     graph.bulletSize = 7;
     graph.title = "비율(%)";
     graph.valueField = "price";
     graph.lineThickness = 2;
     graph.lineColor = "#0000FF";
     chart2.addGraph(graph);

     // CURSOR
     var chartCursor = new AmCharts.ChartCursor();
     chartCursor.cursorPosition = "mouse";
     chart2.addChartCursor(chartCursor);

     // WRITE
     chart2.write("chartdiv2");
 });
 
 
 Highcharts.chart('chartdiv3', {
	    chart: {
	        plotBackgroundColor: null,
	        plotBorderWidth: null,
	        plotShadow: false,
	        type: 'pie'
	    },
		exporting: {
			enabled: false
		},
	    title: {
	        text: false
	    },
	    tooltip: {
	        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	    },
	    plotOptions: {
	        pie: {
	            allowPointSelect: true,
	            cursor: 'pointer',
	            dataLabels: {
	                enabled: false
	            },
	            showInLegend: true
	        }
	    },
	    series: [{
	        name: 'Brands',
	        colorByPoint: true,
	        data: [{
	            name: '4이상 4.5미만',
	            y: 11.84,
	        }, {
	            name: '4.5이상 5미만',
	            y: 10.85
	        }],
	        colors: ['#d0544d', '#4c86c3']
	    }]
	});
 
 var chart4;
 var chartData4 = [
     {
         "date": "2012-03-01",
         "price": 20
     },
     {
         "date": "2012-03-02",
         "price": 75
     },
     {
         "date": "2012-03-03",
         "price": 15
     },
     {
         "date": "2012-03-04",
         "price": 75
     },
     {
         "date": "2012-03-05",
         "price": 158
     }
 ];

 AmCharts.ready(function () {

     // SERIAL CHART
     chart4 = new AmCharts.AmSerialChart();

     chart4.dataProvider = chartData4;
     chart4.categoryField = "date";
     chart4.dataDateFormat = "YYYY-MM-DD";

     // AXES
     // category
     var categoryAxis = chart4.categoryAxis;
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
     chart4.addValueAxis(valueAxis);

     // GRAPH
     var graph = new AmCharts.AmGraph();
     graph.useLineColorForBulletBorder = true;
     graph.bulletBorderAlpha = 1;
     graph.bulletBorderThickness = 2;
     graph.bulletSize = 7;
     graph.title = "비율(%)";
     graph.valueField = "price";
     graph.lineThickness = 2;
     graph.lineColor = "#00FF00";
     chart4.addGraph(graph);

     // CURSOR
     var chartCursor = new AmCharts.ChartCursor();
     chartCursor.cursorPosition = "mouse";
     chart4.addChartCursor(chartCursor);

     // WRITE
     chart4.write("chartdiv4");
 });
 
 var chart5;
 var chartData5 = [
     {
         "date": "2012-03-01",
         "price": 20,
         "testVlaue": 20
     },
     {
         "date": "2012-03-02",
         "price": 75,
         "testVlaue": 20
     },
     {
         "date": "2012-03-03",
         "price": 15,
         "testVlaue": 20
     },
     {
         "date": "2012-03-04",
         "price": 75,
         "testVlaue": 20
     },
     {
         "date": "2012-03-05",
         "price": 158,
         "testVlaue": 20
     }
 ];

 AmCharts.ready(function () {

     // SERIAL CHART
     chart5 = new AmCharts.AmSerialChart();

     chart5.dataProvider = chartData5;
     chart5.categoryField = "date";
     chart5.dataDateFormat = "YYYY-MM-DD";
	
     // AXES
     // category
     var categoryAxis = chart5.categoryAxis;
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
     chart5.addValueAxis(valueAxis);

     // GRAPH
     var graph = new AmCharts.AmGraph();
     graph.useLineColorForBulletBorder = true;
     graph.bulletBorderAlpha = 1;
     graph.bulletBorderThickness = 2;
     graph.bulletSize = 7;
     graph.title = "비율(%)";
     graph.valueField = "price";
     graph.lineThickness = 2;
     graph.lineColor = "#0000FF";
     chart5.addGraph(graph);
     
     var graph2 = new AmCharts.AmGraph();
     graph2.useLineColorForBulletBorder = true;
     graph2.bulletBorderAlpha = 1;
     graph2.bulletBorderThickness = 2;
     graph2.bulletSize = 7;
     graph2.title = "비율(%)";
     graph2.valueField = "testVlaue";
     graph2.lineThickness = 2;
     graph2.lineColor = "#FF0000";
     chart5.addGraph(graph2);

     // CURSOR
     var chartCursor = new AmCharts.ChartCursor();
     chartCursor.cursorPosition = "mouse";
     chart5.addChartCursor(chartCursor);

     // WRITE
     chart5.write("chartdiv5");
 });
 
 var chart6;
 var chartData6 = [
     {
         "date": "2012-03-01",
         "price": 1,
         "testVlaue": 20
     },
     {
         "date": "2012-03-02",
         "price": 1,
         "testVlaue": 20
     },
     {
         "date": "2012-03-03",
         "price": 1,
         "testVlaue": 20
     },
     {
         "date": "2012-03-04",
         "price": 1,
         "testVlaue": 20
     },
     {
         "date": "2012-03-05",
         "price": 1,
         "testVlaue": 20
     }
 ];

 AmCharts.ready(function () {

     // SERIAL CHART
     chart6 = new AmCharts.AmSerialChart();

     chart6.dataProvider = chartData6;
     chart6.categoryField = "date";
     chart6.dataDateFormat = "YYYY-MM-DD";
	
     // AXES
     // category
     var categoryAxis = chart6.categoryAxis;
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
     chart6.addValueAxis(valueAxis);

     // GRAPH
     var graph = new AmCharts.AmGraph();
     graph.useLineColorForBulletBorder = true;
     graph.bulletBorderAlpha = 1;
     graph.bulletBorderThickness = 2;
     graph.bulletSize = 7;
     graph.valueField = "price";
     graph.lineThickness = 2;
     graph.lineColor = "#0000FF";
     chart6.addGraph(graph);
     
     var graph2 = new AmCharts.AmGraph();
     graph2.useLineColorForBulletBorder = true;
     graph2.bulletBorderAlpha = 1;
     graph2.bulletBorderThickness = 2;
     graph2.bulletSize = 7;
     graph2.valueField = "testVlaue";
     graph2.lineThickness = 2;
     graph2.lineColor = "#FF0000";
     chart6.addGraph(graph2);

     // CURSOR
     var chartCursor = new AmCharts.ChartCursor();
     chartCursor.cursorPosition = "mouse";
     chart6.addChartCursor(chartCursor);

     // WRITE
     chart6.write("chartdiv6");
 });
 
 var e = JSON.parse('[{ "RecordID": "00:00 - 06:35","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분"},{ "RecordID": "00:00 - 06:35","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분"},{ "RecordID": "00:00 - 06:35","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분"},{ "RecordID": "00:00 - 06:35","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분"},{ "RecordID": "00:00 - 06:35","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분"},{ "RecordID": "00:00 - 06:35","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분"},{ "RecordID": "00:00 - 06:35","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분"},{ "RecordID": "00:00 - 06:35","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분"},{ "RecordID": "00:00 - 06:35","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분"},{ "RecordID": "00:00 - 06:35","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분"},{ "RecordID": "00:00 - 06:35","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분"},{ "RecordID": "00:00 - 06:35","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분"}]');
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
     title: "시간",
     
     textAlign: "center"
 }, {
     field: "OrderID",
     title: "알람종류",
     width: 60,
     textAlign: "center"
 }, {
     field: "ShipCountry",
     title: "단계",
     width: 40,
	    textAlign: "center"
 }, {
     field: "ShipName",
     title: "지속시간",
     width: 60,
   	 textAlign: "center"
 }]
});
</script>