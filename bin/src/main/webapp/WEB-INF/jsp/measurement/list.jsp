<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tagLib.jsp"%>

<style>
.m-portlet {
	margin-bottom: 1.8rem;
}

.m-body .m-content {
	padding: 15px 30px 0px 30px;
}

.map {
	height: 500px;
}

.form-group label {
	color: #3f4047;
    font-size: 1rem;
}

.m-portlet__body .form-inline {
	display: table; 
	width: 100%;
}

.recent-time {
	display: table-cell;
	text-align: right;
	font-size: 15px;
}

.dataTables_wrapper .dataTable {
	margin: 0 !important;
}

.dataTables_wrapper table.dataTable th {
	background: rgb(204,215,96);
	color: #fff;
	font-size: 14px !important;
}

.dataTables_wrapper table.dataTable tbody td:first-child {
	background: #358097;
	color: #fff;
}

.dataTables_wrapper .dataTable .selected td:first-child {
	background: #498CA1;
}

.dataTables_wrapper table.dataTable tbody td:last-child {
	padding: 0;
}

.dataTables_empty {
	background: #fff !important;
	color: #000 !important;
}

.table {
	margin-bottom: 0px;
}

.table th {
	font-weight: 700;
}

.first-th {
	background: #4BC6FF;
	color: #fff;
}

.second-th {
	background: #E64B6A;
	color: #fff;
}
</style>

<div class="m-grid__item m-grid__item--fluid m-wrapper">
	<div class="m-subheader"> 
		<div class="d-flex align-items-center">
			<div class="mr-auto">
				<h3 class="m-subheader__title">
					계측 이력 정보
				</h3>
			</div>
		</div>
	</div>
	<div class="m-content">
		<div class="row">
			<div class="col-xl-8">
				<div class="m-portlet">
					<div class="m-portlet__body"> 
						<form class="form-inline">
							<div class="form-group m--padding-bottom-15">
								<label class="m--margin-right-15">날짜선택 : </label>
								<div class="input-group date m--margin-right-15">
									<input type="text" class="form-control" readonly id="datetimepicker" value="${currentTime}">
									<div class="input-group-append">
										<span class="input-group-text">
											<i class="la la-calendar-check-o glyphicon-th"></i>
										</span>
									</div>
								</div>
								<button id="search_button" type="button" class="btn btn-accent m-btn m-btn--icon">
									<span><i class="fa fa-search"></i><span>조 회</span></span>
								</button>
							</div>
							<div id="recent_time" class="recent-time"></div>
						</form>
						<table class="table table-striped- table-bordered table-hover" id="measurementTable">
							<thead class="text-center">
								<tr>
									<th></th>
									<th></th>
									<th>블록명</th>
									<th>수압</th>
									<th>순시유량 (m²/hr)</th>
									<th>적산유량 (m²)</th>
									<th>상세보기</th>
								</tr>
							</thead>
						 	<tbody class="text-center"></tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-xl-4">
				<div class="m-portlet m-portlet-map">
					<div class="m-portlet__body"> 
						<div id="map" class="map"></div>
					</div>
				</div>
				<div class="m-portlet">
					<div class="m-portlet__body">
						<table class="table table-bordered">
							<colgroup>
								<col style="width: 28%;" />
								<col style="width: 36%;" />
								<col style="width: 36%;" />
							</colgroup> 
							<thead class="text-center">
								<tr>
									<th></th>
									<th class="first-th">유량계</th>
									<th class="second-th">수압계</th>
								</tr>
							</thead>
							<tbody class="text-center">
								<tr>
									<th>관리번호</th>
									<td id="fmtIdn"></td>
									<td id="pmtIdn"></td>
								</tr>
								<tr>
									<th>설치일자</th>
									<td id="fmtDate"></td>
									<td id="pmtDate"></td>
								</tr>
								<tr>
									<th>종  류</th>
									<td id="fmtType"></td>
									<td id="pmtType"></td>
								</tr>
								<tr>
									<th>형  식</th>
									<td id="fmtForm"></td>
									<td id="pmtForm"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
moment.locale("ko");

const MeasurementManager = function() {
	var DataTable = {
		ele: "#measurementTable",
		table: null,
		option: {
			columns: [{
		        data: "dateTime"
		    }, {
		        data: "blockId"
		    }, {
		        data: "blockName"
		    }, {
		        data: "pressure",
		        width: "24%"
		    }, {
		        data: "flow",
		        width: "24%"
		    }, {
		        data: "sumFlowString",
		        width: "24%"
		    }, {
		        width: "12%",
		        render: function(data, type, row, meta) {
		            return '<a href="' + contextPath + '/measurement/detail?flctcFm=' + row.blockId + '&dateTime=' + row.dateTime + '"' +
						'class="btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill"><i class="la la-edit"></i></a>';
		        }
		    }],
		},
		init: function() {
			this.table = Datatables.select(this.ele, this.option);
			this.search();
		},
		search: function() {
			var param = new Object();
			param.dateTime = $("#datetimepicker").val();
			Datatables.rowsAdd(this.table, contextPath + "/measurement/search", param);
		}
	}

	var searchControl = function() {
		$("#search_button").click(function() {
			$("#recent_time").text("");
			DataTable.search();
		});
	}

	return {
		init: function() {
			DataTable.init();
			searchControl();
		},
		table: function() {
			return DataTable.table;
		}
	}
}();

$(document).ready(function () {
	$("#datetimepicker").datetimepicker({
		todayHighlight: true,
		autoclose: true,
		format: "yyyy-mm-dd hh:00:00",
		minView : 1,
	});

	var map = makeMap("map");
	var vectorLayers = [];

	$.ajax({
		url: contextPath + "/monitoring/getBlockList",
		type: "get",
		dataType: "json",
		success: function(response) {
			$.each(response, function(idx, value) {
				var vectorLayer = makeVectorLayer(value);
				map.addLayer(vectorLayer);
				vectorLayers.push({block: value, vectorLayer: vectorLayer});
			});
	   	}
	});

	MeasurementManager.init();
	var table = MeasurementManager.table();

	table.on('select', function (e, dt, type, indexes) {
		if (type === 'row') {
			var data = table.rows(indexes).data()[0];
			
			$.ajax({
				url: contextPath + "/measurement/getBlockInfo",
	    		type: "post",
	    		contentType: "application/json",
	    		data: JSON.stringify(data),
	    		success: function(blockInfo) {
	    			$("#recent_time").text(data.dateTime);
	    			$("#fmtIdn").text(blockInfo.fmtIdn);
	    			$("#pmtIdn").text(blockInfo.pmtIdn);
	    			$("#fmtDate").text(blockInfo.flowDate);
	    			$("#pmtDate").text(blockInfo.pressureDate);
	    			$("#fmtType").text("배수유량계");
	    			$("#pmtType").text("설치식");
	    			$("#fmtForm").text("전자유량계");
	    			$("#pmtForm").text("익차형");
	    			
	    			$.each(vectorLayers, function(idx, val) {
	    				var fillColor = "#ffffff00";
	    				if (blockInfo.flctcFm == val.block.flctcFm) {
	    					fillColor = "rgba(0, 0, 255, 0.1)";
	    				}
	    				val.vectorLayer.setStyle([makeStyle(fillColor), makeLabelStyle(val.block.bkNm)]);
	    			});
	    		}
	    	});
	    }
	});
});
</script>