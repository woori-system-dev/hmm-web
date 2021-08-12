<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tagLib.jsp"%>

<div class="m-grid__item m-grid__item--fluid m-wrapper">
	<div class="m-subheader">
		<div class="d-flex align-items-center">
			<div class="mr-auto">
				<h3 class="m-subheader__title">
					유량분석  <i class="la la-angle-right arrow-icon"></i> <small>수요패턴분석</small> 
				</h3>
			</div>
		</div>
	</div>
	<div class="m-content">
		<div class="row">
			<div class="col-md-2">
				<div class="m-portlet pb-10">
					<div class="row">
						<img src="../images/weather/weather_cloud_sun.png" style="width:100px;margin:auto;">
					</div>
					<div class="row">
						<div class="col-md-6">
							<img src="../images/weather/temperature.png" style="float:right;">
						</div>
						<div class="col-md-6" style="font-weight:700;">
							9 ℃
						</div>
					</div>		
					<div class="row" style="margin-top:5px">
						<div class="col-md-6">
							<img src="../images/weather/humidity.png" style="float:right;">
						</div>
						<div class="col-md-6" style="font-weight:700;">
							88 %
						</div>
					</div>		
					<div class="row" style="margin-top:5px">
						<div class="col-md-6">
							<img src="../images/weather/wind.png" style="float:right;">
						</div>
						<div class="col-md-6" style="font-weight:700;">
							1 m/s
						</div>
					</div>		
				</div>
				
				<div class="m-portlet m-portlet--head-sm">
					<div class="m-portlet__head">
						<div class="m-portlet__head-caption">
							<div class="m-portlet__head-title">
								<span class="m-portlet__head-icon">
									<i class="flaticon-search-1"></i>
								</span> 
								<h3 class="m-portlet__head-text">패턴 조건 설정</h3>
							</div>
						</div>
					</div>
					<div class="m-portlet__body pb-20 font-black">
						<div class="form-group m-form__group row">
							<label for="example-text-input" class="col-4 col-form-label px-0">
								블록명
							</label>
							<div class="col-8 p-0">
								<select class="form-control m-input m-input--square" id="exampleSelect1">
									<c:forEach var="list" items="${blockList}" varStatus="domain">
										<option>${list.bkNm}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label for="example-text-input" class="col-4 col-form-label px-0">
								공휴일
							</label>
							<div class="col-8 p-0">
								<select class="form-control m-input m-input--square" id="exampleSelect1">
									<option>평일</option>
									<option>주말</option>
								</select>
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label for="example-text-input" class="col-4 col-form-label px-0">
								하늘상태
							</label>
							<div class="col-8" style="padding:0">
								<select class="form-control m-input m-input--square" id="exampleSelect1">
									<option>흐림</option>
									<option>날씨좋음</option>
								</select>
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label for="example-text-input" class="col-4 col-form-label px-0">
								강수여부
							</label>
							<div class="col-8" style="padding:0">
								<select class="form-control m-input m-input--square" id="exampleSelect1">
									<option>확률 높음</option>
									<option>확률 낮음</option>
								</select>
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label for="example-text-input" class="col-4 col-form-label px-0">
								최저기온
							</label>
							<div class="col-8" style="padding:0">
								<select class="form-control m-input m-input--square" id="exampleSelect1">
									<option>6~10</option>
									<option>11~15</option>
									<option>16~20</option>
								</select>
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label for="example-text-input" class="col-4 col-form-label px-0">
								최고기온
							</label>
							<div class="col-8" style="padding:0">
								<select class="form-control m-input m-input--square" id="exampleSelect1">
									<option>11~15</option>
									<option>16~20</option>
									<option>21~25</option>
								</select>
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label for="example-text-input" class="col-4 col-form-label px-0">
								습도
							</label>
							<div class="col-8 p-0">
								<select class="form-control m-input m-input--square" id="exampleSelect1">
									<option>60~89</option>
									<option>90~100</option>
								</select>
							</div>
						</div>
						<div class="row mt-30">
							<button type="button" class="btn btn-info btn-block">
								오늘 날씨 세팅
							</button>
							<button type="button" class="btn btn-success btn-block">
								페턴 검색
							</button>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-8">
				<div class="m-portlet">
					<div class="m-portlet__body">
						<div class="row">
							<div id="chartdiv" style="width: 100%; height: 420px;"></div>
						</div>
						<div class="row mt-20">
							<div class="col-md-4" style="padding:50px 50px 50px 50px">
								<label style="font-size:20px;font-weight:500;">기준일(2015-04-14)</label><br>
								<table style="font-size:19px;width:100%">
									<tr>
										<td>
											총 예상 수요량
										</td>
										<td style="text-align:right;font-weight:600;color:#ec7959">
											1021 m²
										</td>
									</tr>
									<tr>
										<td >
											현재까지 수요량
										</td>
										<td style="text-align:right;font-weight:600;color:#ec7959">
											621 m²
										</td>
									</tr>
									<tr>
										<td>
											남은 예상 수요량
										</td>
										<td style="text-align:right;font-weight:600;color:#ec7959">
											400 m²
										</td>
									</tr>
								</table>
							</div>
							<div class="col-md-8">
								<div id="m_datatable"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2">
				<div class="m-portlet" style="height:600px">
					<div class="m-portlet__body">
						<div style="background-color:#ec7959;color:#ffffff;font-weight:700;padding:20px 0 0 20px">
							<label style="font-size:20px">현재유량</label><br>
							<label style="margin-bottom:0">패턴코드</label><br>
							<label>03105068</label>
						</div>
						<div style="background-color:#3198c7;color:#ffffff;font-weight:700;padding:20px 0 0 20px">
							<label style="font-size:20px">구역 예상 수요량</label><br>
							<label style="margin-bottom:0">패턴코드</label><br>
							<label>03105069</label>
						</div>
						<div style="background-color:#7db6c7;color:#ffffff;font-weight:700;padding:20px 0 0 20px">
							<label style="font-size:20px">유사패턴0</label><br>
							<label style="margin-bottom:0">패턴코드</label><br>
							<label>03105010</label>
						</div>
						<div style="background-color:#83d1ce;color:#ffffff;font-weight:700;padding:20px 0 0 20px">
							<label style="font-size:20px">유사패턴1</label><br>
							<label style="margin-bottom:0">패턴코드</label><br>
							<label>03103258</label>
						</div>
						<div style="background-color:#7ebaa7;color:#ffffff;font-weight:700;padding:20px 0 0 20px">
							<label style="font-size:20px">유사패턴2</label><br>
							<label style="margin-bottom:0">패턴코드</label><br>
							<label>03106658</label>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
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

var e = JSON.parse('[{ "RecordID": "00:00:00","OrderID": "33.10","ShipCountry": "40.00"},{ "RecordID": "00:00:00","OrderID": "33.10","ShipCountry": "40.00"},{ "RecordID": "00:00:00","OrderID": "33.10","ShipCountry": "40.00"},{ "RecordID": "00:00:00","OrderID": "33.10","ShipCountry": "40.00"},{ "RecordID": "00:00:00","OrderID": "33.10","ShipCountry": "40.00"},{ "RecordID": "00:00:00","OrderID": "33.10","ShipCountry": "40.00"},{ "RecordID": "00:00:00","OrderID": "33.10","ShipCountry": "40.00"},{ "RecordID": "00:00:00","OrderID": "33.10","ShipCountry": "40.00"},{ "RecordID": "00:00:00","OrderID": "33.10","ShipCountry": "40.00"},{ "RecordID": "00:00:00","OrderID": "33.10","ShipCountry": "40.00"}]');
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
    }, {
        field: "OrderID",
        title: "현재유량",
    }, {
        field: "ShipCountry",
        title: "구역 예상 수요량"
    }]
});

</script>