<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tagLib.jsp"%>

<style>
.m-portlet {
	margin-bottom: 2rem;
}

.weather-body {
	padding: 0 0 1.6rem !important;
}

.chart-container {
	height: 398px;
}

.pattern-body {
	padding: 0 !important;
}

.pattern-code-box {
	color: #fff;
	font-weight: 600;
	font-size: 18px;
	padding: 12px 24px;
}

.current-pressure {background-color: #ec7959;}
.pressure-pattern {background-color: #3198c7;}
.similar-pattern0 {background-color: #7db6c7;}
.similar-pattern1 {background-color: #83d1ce;}
.similar-pattern2 {background-color: #7ebaa7;}

.standard-date-box {
	padding: 30px 60px;
}

.standard-date-box span {
	font-size: 20px;
	font-weight: 600;
}

.standard-date-box table {
	font-size: 18px;
	width: 100%;
}

.standard-date-box table tr {
	height: 45px;
}

.standard-date-box table td {
	text-align: right;
	font-weight: 500;
	color: #ec7959;
}
</style>

<div class="m-grid__item m-grid__item--fluid m-wrapper">
	<div class="m-subheader"> 
		<div class="d-flex align-items-center">
			<div class="mr-auto">
				<h3 class="m-subheader__title">
					수압분석 <i class="la la-angle-right arrow-icon"></i> <small>수압패턴분석</small>
				</h3>
			</div>
		</div>
	</div>
	<div class="m-content">
		<div class="row">
			<div class="col-md-2">
				<div class="m-portlet">
					<div class="m-portlet__body weather-body">
						<div class="text-center">
							<img src="../images/weather/${weatherImage}" height="100">
						</div>
						<div class="row">
							<div class="col-md-6 text-right">
								<img src="../images/weather/temperature.png">
							</div>
							<div class="col-md-6">
								<span class="m--font-boldest text-left">${weather.temperature} ℃</span>
							</div>
						</div>
						<div class="row m--margin-top-5">
							<div class="col-md-6 text-right">
								<img src="../images/weather/humidity.png">
							</div>
							<div class="col-md-6">
								<span class="m--font-boldest text-left">${weather.humidity} %</span>
							</div>
						</div>
						<div class="row m--margin-top-5">
							<div class="col-md-6 text-right">
								<img src="../images/weather/wind.png">
							</div>
							<div class="col-md-6">
								<span class="m--font-boldest text-left">${weather.windspeed} m/s</span>
							</div>
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
					<div class="m-portlet__body m--font-boldest">
						<div class="form-group m-form__group row">
							<label for="blockSelect" class="col-4 col-form-label px-0">블록명</label>
							<div class="col-8 p-0">
								<select class="form-control m-input m-input--square" id="blockSelect">
									<c:forEach var="block" items="${blockList}" varStatus="status">
		           						<option value="${block.flctcFm}">${block.bkNm}</option>
		           					</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label for="holidaySelect" class="col-4 col-form-label px-0">공휴일</label>
							<div class="col-8 p-0">
								<select class="form-control m-input m-input--square" id="holidaySelect">
									<option value="평일">평일</option>
									<option value="휴일">휴일</option>
								</select>
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label for="skySelect" class="col-4 col-form-label px-0">하늘상태</label>
							<div class="col-8 p-0">
								<select class="form-control m-input m-input--square" id="skySelect">
									<c:forEach var="sky" items="${skys}" varStatus="status">
		           						<option value="${sky}">${sky}</option>
		           					</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label for="rainfallSelect" class="col-4 col-form-label px-0">강수여부</label>
							<div class="col-8 p-0">
								<select class="form-control m-input m-input--square" id="rainfallSelect">
									<c:forEach var="rainfall" items="${rainfalls}" varStatus="status">
		           						<option value="${rainfall}">${rainfall.name}</option>
		           					</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label for="lowestTempSelect" class="col-4 col-form-label px-0">최저기온</label>
							<div class="col-8 p-0">
								<select class="p-0 m-input m-input--square" id="lowestTempSelect">
									<c:forEach var="lowestTemp" items="${lowestTemps}" varStatus="status">
		           						<option value="${lowestTemp}">${lowestTemp.name}</option>
		           					</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label for="highestTempSelect" class="col-4 col-form-label px-0">최고기온</label>
							<div class="col-8 p-0">
								<select class="form-control m-input m-input--square" id="highestTempSelect">
									<c:forEach var="highestTemp" items="${highestTemps}" varStatus="status">
		           						<option value="${highestTemp}">${highestTemp.name}</option>
		           					</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label for="humiditySelect" class="col-4 col-form-label px-0">습도</label>
							<div class="col-8 p-0">
								<select class="form-control m-input m-input--square" id="humiditySelect">
									<c:forEach var="humidity" items="${humiditys}" varStatus="status">
		           						<option value="${humidity}">${humidity.name}</option>
		           					</c:forEach>
								</select>
							</div>
						</div>
						<div class="row mt-30">
							<button id="currentWeatherSetting" type="button" class="btn btn-info btn-block">
								오늘 날씨 세팅
							</button>
							<button id="patternSearch" type="button" class="btn btn-success btn-block">
								패턴 검색
							</button>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-10">
				<div class="row">
					<div class="col-md-9">
						<div class="m-portlet">
							<div class="m-portlet__body">
								<div class="chart-container" id="chartdiv"></div>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="m-portlet">
							<div class="m-portlet__body pattern-body">
								<div class="pattern-code-box current-pressure">
									<div>현재수압</div>
									<div class="font-size-12 m--margin-top-5">패턴코드</div>
									<div class="font-size-12">03105068</div>
								</div>
								<div class="pattern-code-box pressure-pattern">
									<div>구역 예상 수압 패턴</div>
									<div class="font-size-12 m--margin-top-5">패턴코드</div>
									<div class="font-size-12">03105069</div>
								</div>
								<div class="pattern-code-box similar-pattern0">
									<div>유사패턴0</div>
									<div class="font-size-12 m--margin-top-5">패턴코드</div>
									<div class="font-size-12">03105010</div>
								</div>
								<div class="pattern-code-box similar-pattern1">
									<div>유사패턴1</div>
									<div class="font-size-12 m--margin-top-5">패턴코드</div>
									<div class="font-size-12">03103258</div>
								</div>
								<div class="pattern-code-box similar-pattern2">
									<div>유사패턴2</div>
									<div class="font-size-12 m--margin-top-5">패턴코드</div>
									<div class="font-size-12">03106658</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="m-portlet">
							<div class="m-portlet__body">
								<div class="row">
									<div class="col-md-4 standard-date-box">
										<span>기준일(2015-04-14)</span>
										<table class="m--margin-top-10">
											<tbody>
												<tr>
													<th>당일 최고 수압</th>
													<td>6.7 kg/cm²</td>
												</tr>
												<tr>
													<th>당일 최저 수압</th>
													<td>5.78 kg/cm²</td>
												</tr>
												<tr>
													<th>당일 평균 수압</th>
													<td>6.36 kg/cm²</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="col-md-8">
										<table class="table table-striped- table-bordered" id="dataTable">
											<thead class="text-center">
												<tr>
													<th>시간</th>
													<th>현재수압</th>
													<th>구역 예상 수압패턴</th>
												</tr>
											</thead>
										 	<tbody class="text-center"></tbody>
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

<script>
makePatternLineChart("chartdiv")

var table = $("#dataTable").DataTable({
	select: {
        style: "single"
    },
	language: {
		emptyTable: "데이터가 없습니다.",
		infoEmpty: ""
	},
    columns: [{
        data: "dateTime"
    }, {
        data: "blockId"
    }, {
        data: "blockName"
    }],
    responsive: true,
    searching: false,
	lengthChange: false,
    ordering: false,
    paging: false,
    info: false
});

$("#currentWeatherSetting").click(function () {
	$.ajax({
		url: contextPath + "/pressure/weather/setting",
		type: "post",
		dataType: "json",
		success: function(response) {
			console.log(response);
		}
	});
});

$("#patternSearch").click(function () {
	var param = new Object();
	param.blockId = $("#blockSelect option:selected").val();
	param.holiday = $("#holidaySelect option:selected").val();
	param.sky = $("#skySelect option:selected").val();
	param.rainfall = $("#rainfallSelect option:selected").val();
	param.lowestTemp = $("#lowestTempSelect option:selected").val();
	param.highestTemp = $("#highestTempSelect option:selected").val();
	param.humidity = $("#humiditySelect option:selected").val();
	
	console.log(param);
	
	$.ajax({
		url: contextPath + "/pressure/pattern",
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(param),
		success: function(response) {
			console.log(response);
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
