<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tagLib.jsp"%>

<style>
.m-portlet {
	margin-bottom: 1.8rem;
}

.m-body .m-content {
	padding: 15px 30px 0px 30px;
}

.form-group label {
	color: #3f4047;
    font-weight: 400;
    font-size: 1rem;
}

.map {
	height: 500px;
}

.m-portlet__body .form-inline {
	display: table; 
	width: 100%;
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
	background: #498CA1 !important;
}

.dataTables_wrapper table.dataTable tbody td:last-child {
	padding: 0;
}

.dataTables_empty {
	background: #fff !important;
	color: #000 !important;
}

.table {
	font-size: 14px !important;
	margin-bottom: 0px;
}

.table tr {
	height: 25px;
}

.table th {
	font-weight: 700;
}

.first-th {
	background: #53A076;
	color: #fff;
}

.second-th {
	background: #B88946;
	color: #fff;
}

.recent-time {
	display: table-cell;
	text-align: right;
	font-size: 15px;
}
</style>

<div class="m-grid__item m-grid__item--fluid m-wrapper">
	<div class="m-subheader"> 
		<div class="d-flex align-items-center">
			<div class="mr-auto">
				<h3 class="m-subheader__title">
					알람 이력 정보 
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
									<input type="text" class="form-control" id="datePicker" readonly>
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
						<table class="table table-striped- table-bordered table-hover" id="dataTable">
							<thead class="text-center">
								<tr>
									<th></th>
									<th>블록명</th>
									<th>고수압</th>
									<th>저수압</th>
									<th>문열림</th>
									<th>통신이상</th>
									<th>상세보기</th>
								</tr>
							</thead>
						 	<tbody class="text-center">
                        	</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-xl-4">
				<div class="m-portlet m-portlet-map">
					<div class="m-portlet__body text-center">
						<div id="map" class="map"></div>
					</div>
				</div>
				<div class="m-portlet">
					<div class="m-portlet__body">
						<table class="table table-bordered">
							<colgroup>
								<col style="width: 28%;" />
								<col style="width: 28%;" />
								<col style="width: 44%;" />
							</colgroup> 
							<thead class="text-center">
								<tr>
									<th></th>
									<th class="first-th">최대지속단계</th>
									<th class="first-th">최대지속시간</th>
								</tr>
							</thead>
							<tbody class="text-center">
								<tr>
									<th class="second-th">고수압</th>
									<td>경고</td>
									<td>120분(03:29 ~ 05:29)</td>
								</tr>
								<tr>
									<th class="second-th">설치일자</th>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th class="second-th">종  류</th>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th class="second-th">형  식</th>
									<td></td>
									<td></td>
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
$(function() {
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

	var table = $("#dataTable").DataTable({
		select: {
	        style: "single"
	    },
		language: {
			emptyTable: "데이터가 없습니다"
		},
	    columns: [{
	        data: "blockId"
	    }, {
	        data: "blockName"
	    }, {
	        data: "highPressure"
	    }, {
	        data: "lowPressure"
	    }, {
	        data: "doorOpen"
	    }, {
	        data: "deviceError"
	    }, {
	        width: "12%",
	        render: function(data, type, row, meta) {
	        	return '<a href="' + contextPath + '/alarm/detail?flctcFm=' + row.blockId + '&dateTime=' + $("#datePicker").val() + '"' +
				'class="btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill"><i class="la la-edit"></i></a>';
	        }
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

	function setAlarmHistoryList() {
		table.clear().draw();
		
		$.ajax({
			url: contextPath + "/alarm/search",
			data: {"date" : $("#datePicker").val()}, 
			type: "post",
			dataType: "json",
			success: function(response) {
				table.rows.add(response).draw();
			},
			beforeSend:function(){
		        $('.loading-container').removeClass('display-none');
		    },
		    complete:function(){
		        $('.loading-container').addClass('display-none');
		    }
		});
	}
	
	setAlarmHistoryList();

	$("#search_button").click(function() {
		setAlarmHistoryList();
	});

	table.on('select', function (e, dt, type, indexes) {
		if (type === 'row') {
			var data = table.rows(indexes).data()[0];
			
			$.ajax({
				url: contextPath + "/alarm/getBlockInfo",
	    		type: "post",
	    		contentType: "application/json",
	    		data: JSON.stringify(data),
	    		success: function(blockInfo) {
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