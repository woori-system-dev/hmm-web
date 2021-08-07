<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tagLib.jsp"%>

<style>
.m-portlet {
	margin-bottom: 1.8rem;
}

.dataTables_wrapper .dataTables_scroll {
	margin: 0 !important;
}

.map {
	height: 600px;
}

.m-portlet__risk {
	padding: 1.2rem !important;
}

.risk-box {
	padding: 14px 0px;
}

.risk-box div {
	font-size: 16px;
}

.risk-box .level {
	font-size: 40px !important;
}

.warning-color {
	background-color: #ffff00;
}
</style>

<div class="m-grid__item m-grid__item--fluid m-wrapper">
	<div class="m-subheader">
		<div class="d-flex align-items-center">
			<div class="mr-auto">
				<h3 class="m-subheader__title ">
					건전도 평가 <i class="la la-angle-right arrow-icon"></i> <small>블록 평가</small>
				</h3>
			</div>
		</div>
	</div>
	<div class="m-content">
		<div class="row">
			<div class="col-md-9">
				<div class="m-portlet" style="height:600px">
					<div class="m-portlet__body">
						<table class="table table-striped- table-bordered table-hover" id="dataTable">
							<thead class="text-center">
								<tr>
									<th></th>
									<th>블록명칭</th>
									<th>총점수</th>
									<th>관로나이<br>(배수관)</th>
									<th>관로나이<br>(급수관)</th>
									<th>노후관<br>(배수관)</th>
									<th>노후관<br>(급수관)</th>
									<th>내식성관<br>(배수관)</th>
									<th>내식성관<br>(급수관)</th>
									<th>누수건수<br>(배수관)</th>
									<th>누수건수<br>(급수관)</th>
								</tr>
							</thead>
						 	<tbody class="text-center"></tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="m-portlet m-portlet-map">
					<div class="m-portlet__body">
						<div id="map" class="map"></div>
					</div>
				</div>
			</div>
			<div class="col-md-12">
				<div id="assessment_portlet" class="m-portlet display-none">
					<div class="m-portlet__body m-portlet__risk">
						<div class="row">
							<div class="col-md-2">
								<div class="risk-box text-center warning-color">
									<div class="m--font-boldest">위험도</div>
									<div class="level m--font-boldest" id="level"></div>
									<div class="m--font-boldest" id="level_string"></div>
								</div>
							</div>
							<div class="col-md-10 m--margin-top-15">
								<div class="row">
									<div class="col-md-3">
										<h4 id="block_name"></h4>
									</div>
									<div class="col-md-3">
										<h4 id="total_score"></h4>
									</div>
									<div class="col-md-12 m--margin-top-10">
										<h4 id="content"></h4>
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
var table = $("#dataTable").DataTable({
	scrollY: "470px",
    scrollX: !0,
    scrollCollapse: !0,
	select: {
        style: "single"
    },
	language: {
		emptyTable: "데이터가 없습니다.",
		infoEmpty: ""
	},
    columns: [{
        data: "flctcFm"
    }, {
        data: "bkNm"
    }, {
        data: "total"
    }, {
        data: "pipeAge1"
    }, {
        data: "pipeAge2",
    }, {
        data: "oldPipe1",
    }, {
        data: "oldPipe2",
    }, {
        data: "corrosionResistancePipe1",
    }, {
        data: "corrosionResistancePipe2",
    }, {
        data: "waterLeakNum1",
    }, {
        data: "waterLeakNum2",
    }],
    columnDefs: [{
    	targets : 0,
		visible : false
    }],
    responsive: true,
    searching: false,
	lengthChange: false,
    ordering: false,
    paging: false,
    info: false
});

var map = makeMap("map");
var vectorLayers = [];

$.ajax({
	url: contextPath + "/assessment/block/getList",
	type: "get",
	dataType: "json",
	success: function(response) {
		table.rows.add(response).draw();
		$.each(response, function(idx, value) {
			var vectorLayer = makeVectorLayer(value);
			map.addLayer(vectorLayer);
			vectorLayers.push({block: value, vectorLayer: vectorLayer});
		});
	}
});

table.on('select', function (e, dt, type, indexes) {
	if (type === "row") {
		var data = table.rows(indexes).data()[0];
		
		$.ajax({
			url: contextPath + "/assessment/block/detail",
			data: {"blockId" : data.flctcFm}, 
			type: "post",
			dataType: "json",
			success: function(info) {
				$("#assessment_portlet").removeClass("display-none");
				
				$("#level").text(info.level);
				$("#level_string").text(info.assessmentLevel);
				$("#block_name").text("블록명 : " + data.bkNm);
				$("#total_score").text("총점수 : " + info.totalScore + "점");
				$("#content").text(info.content);
			}
		});
	}
});
</script>
