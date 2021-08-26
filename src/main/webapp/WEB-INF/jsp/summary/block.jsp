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

.monitoring-box table td {
	padding: .40rem .50rem !important;
}

.monitoring-box {
    padding: 10px;
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
									<div class="col-md-4">
										<div id="map" class="map" style="width:100%;height:150px"></div>
									</div>
									<div class="col-md-4 p-0">
										<table class="table table-bordered m-table" style="margin-top: 15px">
											<tr>
												<td class="color-white" style="background-color:#358097;">
													급수전수
												</td>
												<td style="text-align:right;">
													${block.bkWspPopCo} 전
												</td>
											</tr>
											<tr>
												<td class="color-white" style="background-color:#358097;">
													관로연장
												</td>
												<td class="text-right">
													${block.bkPipeEx} km
												</td>
											</tr>
											<tr>
												<td class="color-white" style="background-color:#358097;">
													1시간적산유량
												</td>
												<td class="text-right">
													24 m²
												</td>
											</tr>
											<tr>
												<td class="color-white" style="background-color:#358097;">
													금일적산유량
												</td>
												<td class="text-right">
													307 m²
												</td>
											</tr>
										</table>
									</div>
									<div class="col-md-4 text-center" style="padding:5px 0 0 0;">
										<span class="m--font-boldest">유수율</span>
										<div id="chartdiv0" style="height:120px"></div>
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
											계측기기정보
										</h3>
									</div>
								</div>
							</div>
							<div class="m-portlet__body">
								<div class="m-section">
									<div class="m-section__content">
										<table class="table m-table text-center">
											<thead>
												<tr>
													<th></th>
													<th class="color-white" style="background-color:#4bc6ff;">유량계</th>
													<th class="color-white" style="background-color:#e64b6a;">수압계</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<th class="color-white" style="background-color:#358097;">관리번호</th>
													<td>${flowDevice.ftrIdn}</td>
													<td>${pressureDevice.ftrIdn}</td>
												</tr>
												<tr>
													<th class="color-white" style="background-color:#358097;">설치일자</th>
													<td>${flowDevice.istYmd}</td>
													<td>${pressureDevice.istYmd}</td>
												</tr>
												<tr>
													<th class="color-white" style="background-color:#358097;">종 류</th>
													<td>배수유량계</td>
													<td>고정식</td>
												</tr>
												<tr>
													<th class="color-white" style="background-color:#358097;">형 식</th>
													<td>초음파식</td>
													<td>전자유량계</td>
												</tr>
											</tbody>
										</table>
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
											실시간 모니터링
										</h3>
									</div>
								</div>
							</div>
							<div class="m-portlet__body">
								<div class="row">
									<div class="col-md-5 pr-10 monitoring-body">
										<div class="monitoring-box block-normal">
											<table class="table table-bordered" style="line-height:0.9;">
												<thead>
													<tr>
														<th colspan="3">${block.bkNm}</th>
													</tr>
												</thead>
												<tbody>
													<tr class="text-right">
														<td colspan="3">
															<span class="m--font-boldest">${realTimeMeasurement.pressure}</span>&nbsp;&nbsp;kg/cm²
														</td>
													</tr>
													<tr class="text-right">
														<td colspan="3">
															<span class="m--font-boldest">${realTimeMeasurement.flow}</span>&nbsp;&nbsp;㎥/h
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
										<div class="text-center mt-15">
											<h4 id="time"></h4>
										</div>
										<div class="row">
											<div class="col-md-4" style="padding-right:0px; text-align:center;">
												<img src="../images/weather/weather_cloud_sun.png" style="width:100%;height:80px">
												날씨 좋음
											</div>
											<div class="col-md-8" style="padding-right:0px">
												<div class="row mb-10">
													<div class="col-md-5">
														<img src="../images/weather/temperature.png"> 기온
													</div>
													<div class="col-md-7">
														${weather.temperature} ℃
													</div>
												</div>
												<div class="row mb-10">
													<div class="col-md-5">
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
								<div id="measurementChart" style="width: 100%; height: 250px;"></div>
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
											수압분포분석
										</h3>
									</div>
								</div>
							</div>
							<div class="m-portlet__body">
								<div class="row">
									<div class="col-8" style="padding-right:0px">
										<div id="pressureChart" style="width: 100%; height: 240px;"></div>
									</div>
									<div class="col-4" style="padding-left:0px">
										<div id="pressurePieChart" style="width: 100%; height: 240px;"></div>
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
											금일 야간 누수분석
										</h3>
									</div>
								</div>
							</div>
							<div class="m-portlet__body">
								<div class="col-12 pl-0">
									<div id="leakageChart" style="width: 100%; height: 150px;"></div>
								</div>
								<div class="col-12">
									<div class="m-section">
										<div class="m-section__content">				
											<table class="table table-bordered m-table text-center">
												<tr style="background-color:#076db4;color:#FFFFFF">
													<td colspan="2">유량 최대증가</td>
													<td colspan="2">수압 최대감소</td>
													<td rowspan="2" style="vertical-align:middle;">누수판단</td>
												</tr>
												<tr style="background-color:#358097;color:#FFFFFF">
													<td>비율</td>
													<td>시간</td>
													<td>비율</td>
													<td>시간</td>
												</tr>
												<tr>
													<td>5.4 %</td>
													<td>00:20~00:30</td>
													<td>0.4 %</td>
													<td>00:10~00:20</td>
													<td>정상</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>	
				<div class="row">
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
								<div class="col-12 pl-0">
									<div id="demandChart" style="width: 100%; height: 220px;"></div>
								</div>
								<div class="col-12">
									<div class="m-section">
										<div class= "m-section__content">				
											<table class="table table-bordered m-table text-center">
												<tr style="background-color:#076db4;color:#FFFFFF">
													<td>총예상수요량</td>
													<td>현재수요량</td>
													<td>남은수요량</td>
												</tr>
												<tr>
													<td>698 m²</td>
													<td>307 m²</td>
													<td>391 m²</td>
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
					
					<div class="col-md-4">
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
								<div class="col-12 pl-0">
									<div id="minFlowChart" style="width: 100%; height: 200px;"></div>
								</div>
								<div class="col-12">
									<div class="m-section">
										<div class="m-section__content">				
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
$(document).ready(function() {
	baseMap('${block.coords}');

	$("#time").text(moment().format('YYYY-MM-DD HH:mm'));  
	makeBgGrayGaugeChart("chartdiv0", 0, '40%');

	var pressureData = [
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

	var leakageData = [
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

	var demandData = [
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

	var minFlowData = [
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

	Charts.measurement("measurementChart", generateChartData());
	Charts.pressure("pressureChart", pressureData);
	Charts.pressurePie("pressurePieChart");
	Charts.leakage("leakageChart", leakageData);
	Charts.demand("demandChart", demandData);
	Charts.minFlow("minFlowChart", minFlowData);

 	// generate some random data, quite different range
	function generateChartData() {
	     var firstDate = new Date();
	     firstDate.setDate(firstDate.getDate() - 50);

	     var chartData = [];

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

	     return chartData;
	 }

 	var e = JSON.parse('[{ "RecordID": "00:00 - 06:35","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분"},{ "RecordID": "00:00 - 06:35","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분"},{ "RecordID": "00:00 - 06:35","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분"},{ "RecordID": "00:00 - 06:35","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분"},{ "RecordID": "00:00 - 06:35","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분"},{ "RecordID": "00:00 - 06:35","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분"},{ "RecordID": "00:00 - 06:35","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분"},{ "RecordID": "00:00 - 06:35","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분"},{ "RecordID": "00:00 - 06:35","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분"},{ "RecordID": "00:00 - 06:35","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분"},{ "RecordID": "00:00 - 06:35","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분"},{ "RecordID": "00:00 - 06:35","OrderID": "고수압","ShipCountry": "경고","ShipCity": "15","ShipName": "5분"}]');
	var table = $("#m_datatable").mDatatable({
		data: {
		    type: "local",
		    source: e,
		    pageSize: 10,
		},
		layout: {
		    scroll: !0,  // 스크롤  y축 
		    height: 280, // min-height: 300px; 스크롤 x 축
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
});
</script>

<script src="${pageContext.request.contextPath}/js/common/summary.js" type="text/javascript"></script>