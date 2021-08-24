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

.gaugeChart {
	height: 120px;
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
					<div class="m-portlet__body pt-10">
						<table id="colligationTable" class="table table-striped- table-bordered table-hover mt-0">
							<thead class="text-center">
								<tr>
									<th>블록명</th>
									<th>기간</th>
									<th>총공급량</th>
									<th>유수수량</th>
									<th>무수수량</th>
									<th>누수량</th>
									<th>유수율</th>
								</tr>
							</thead>
							<tbody class="text-center"></tbody>
						</table>
						
						<div class="row mt-20">
							<div class="col-md-8" style="text-align:center">
								<div class="row" >
					                <div class="col-md-4"></div>
					                <div class="col-md-4">
					                    <label class="margin_bottom_0 font_weight700">총공급량</label><br>
					                    <label id="totSpyText" class="margin_bottom_0"></label>
					                </div>
					            </div>
					            <div class="row" style="height:10px">        
					                <div class="col-md-3"></div>
					                <div class="col-md-1" style="border-bottom:6px solid;"></div>
					                <div class="col-md-2" style="border-right:6px solid; border-bottom:6px solid;"></div>
					                <div class="col-md-2" style="border-bottom:6px solid;"></div>
					            </div>
					            <div class="row" style="height:10px">        
					                 <div class="col-md-3"></div>
				        	         <div class="col-md-5" style="border-left:6px solid;border-right:6px solid;"></div>
				                </div>
				                <div class="row">
				                	 <div class="col-md-6">
				                	 	<label class="margin_bottom_0 font_weight700">유효수량</label><br>
					                    <label class="margin_bottom_0" id="validAmtText"></label>
				                	 </div>
				                	  <div class="col-md-4">
				                	 	<label class="margin_bottom_0 font_weight700">무효수량</label><br>
					                    <label class="margin_bottom_0" id="invalidAmtText"></label>
				                	 </div>
				                </div>
				                <div class="row" style="height:20px">        
					                 <div class="col-md-3" style="border-right:6px solid #4cbeff;"></div>
				        	         <div class="col-md-5"></div>
					                 <div class="col-md-1" style="border-left:6px solid #bf4336;"></div>
					                 <div class="col-md-2">
					                 	<label class="margin_bottom_0 font_weight700">조정감액수량</label>
					                 </div>
				                </div>
			                 	<div class="row" style="height:20px">        
					                 <div class="col-md-3" style="border-right:6px solid #4cbeff;"></div>
				        	         <div class="col-md-5"></div>
					                 <div class="col-md-1" style="border-top:6px solid #bf4336;"></div>
					                 <div class="col-md-2">
					                 	<label class="margin_bottom_0" id="iReduceAmtText"></label>
					                 </div>
				                </div>
				                <div class="row" style="height:10px">
				                	 <div class="col-md-2"></div>
				                	 <div class="col-md-1" style="border-top:6px solid #4cbeff;border-left:6px solid #4cbeff;"></div>
					                 <div class="col-md-5" style="border-top:6px solid #4cbeff;border-right:6px solid #4cbeff;"></div>
				                </div>
				                <div class="row">
				                	 <div class="col-md-4">
				                	 	<label class="margin_bottom_0 font_weight700">유수수량</label><br>
					                    <label class="margin_bottom_0" id="paidAmtText"></label>
				                	 </div>
				                	 <div class="col-md-2"></div>
				                	 <div class="col-md-4">
				                	 	<label class="margin_bottom_0 font_weight700">무수수량</label><br>
					                    <label class="margin_bottom_0" id="unpaidAmtText"></label>
				                	 </div>
				                </div>
				                <div class="row" style="height:10px">
				                	 <div class="col-md-2"></div>
				                	 <div class="col-md-1" style="border-left:6px solid #559927;"></div>
					                 <div class="col-md-5"></div>
					                 <div class="col-md-1" style="border-left:6px solid #c69a04;"></div>
				                </div>
				                <div class="row" style="height:10px">
				                	<div class="col-md-2"></div>
				                	<div class="col-md-2" style="border-left:6px solid #559927;"></div>
				                	<div class="col-md-2" style="border-top:6px solid #c69a04;border-left:6px solid #c69a04;"></div>
			                		<div class="col-md-2" style="border-top:6px solid #c69a04;border-left:6px solid #c69a04;"></div>
				                	<div class="col-md-2" style="border-top:6px solid #c69a04;border-left:6px solid #c69a04;"></div>
				                	<div class="col-md-2" style="border-left:6px solid #c69a04;"></div>
				                </div>
				                <div class="row">
				                	<div class="col-md-2"></div>
				                	<div class="col-md-1" style="border-left:6px solid #559927;"></div>
			               	 		<div class="col-md-2">
			               	 			<label class="margin_bottom_0 font_weight700">계량기불감수량</label><br>
					                    <label class="margin_bottom_0" id="uMchkAmtText"></label>
			               	 		</div>
			               	 		<div class="col-md-2">
			               	 			<label class="margin_bottom_0 font_weight700">수도사업용수량</label><br>
					                    <label class="margin_bottom_0" id="uSudoAmtText"></label>
			               	 		</div>
			               	 		<div class="col-md-2">
			               	 			<label class="margin_bottom_0 font_weight700">공공수량</label><br>
					                    <label class="margin_bottom_0" id="uCommAmtText"></label>
			               	 		</div>
			               	 		<div class="col-md-2">
			               	 			<label class="margin_bottom_0 font_weight700">부정사용량</label><br>
					                    <label class="margin_bottom_0" id="uIllegalAmtText"></label>
			               	 		</div>
				                </div>
				                <div class="row" style="height:10px">
				                	<div class="col-md-1" style="border-right:6px solid #559927;"></div>
				                	<div class="col-md-2" style="border-top:6px solid #559927;border-right:6px solid #559927;"></div>
				                	<div class="col-md-2" style="border-top:6px solid #559927;border-right:6px solid #559927;"></div>
				                	<div class="col-md-2" style="border-top:6px solid #559927;border-right:6px solid #559927;"></div>
			                	</div>
				                <div class="row">
				                	<div class="col-md-2">
				                		<label class="margin_bottom_0 font_weight700">계량요금수량</label><br>
					                    <label class="margin_bottom_0" id="pChkAmtText"></label>
				                	</div>
				                	<div class="col-md-2">
				                		<label class="margin_bottom_0 font_weight700">미계량요금수량</label><br>
					                    <label class="margin_bottom_0" id="pUchkAmtText"></label>
				                	</div>
				                	<div class="col-md-2">
				                		<label class="margin_bottom_0 font_weight700">분수량</label><br>
					                    <label class="margin_bottom_0" id="pLendAmtText"></label>
				                	</div>
				                	<div class="col-md-2">
				                		<label class="margin_bottom_0 font_weight700">기타부과량</label><br>
					                    <label class="margin_bottom_0" id="pEtcAmtText"></label>
				                	</div>
				                </div> 
				                
								<div class="row mt-20">
									<div class="col-md-4" style="padding:0;border:1px solid #f4f5f8;">
										<div class="d-flex justify-content-center align-items-center table-header">누수량(톤)</div>
										<div id="iLossAmtText" style="height:120px;font-size:1.6rem;"
											class="d-flex justify-content-center align-items-center font-bold" ></div>
									</div>
									<div class="col-md-4" style="padding:0;border:1px solid #f4f5f8;">
										<div class="d-flex justify-content-center align-items-center table-header">누수율</div>
										<div id="gaugeChart1" class="gaugeChart"></div>
									</div>
									<div class = "col-md-4" style="padding:0;border:1px solid #f4f5f8;">
										<div class="d-flex justify-content-center align-items-center table-header">유수율</div>
										<div id="gaugeChart2" class="gaugeChart"></div>
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
										<td style="background-color:#4cbeff;color:#FFFFFF;">총 공급량</td>
										<td style="background-color:#4cbeff;color:#FFFFFF;text-align:right;">
											<span id="totSpyTable"></span>
										</td>
									</tr>
									<tr>
										<td style="background-color:#bf4336;color:#FFFFFF;font-weight:800">유효수량</td>
										<td style="background-color:#bf4336;color:#FFFFFF;text-align:right;">
											<span id="validAmtTable"></span>
										</td>
									</tr>
									<tr>
										<td style="background-color:#559927;color:#FFFFFF;">유수수량</td>
										<td style="background-color:#559927;color:#FFFFFF;text-align:right;">
											<span id="paidAmtTable"></span>
										</td>
									</tr>
									<tr>
										<td>계량요금수량</td>
										<td style="text-align:right;">
											<span id="pChkAmtTable"></span>
										</td>
									</tr>
									<tr>
										<td>미계량요금수량</td>
										<td style="text-align:right;">
											<span id="pUchkAmtTable"></span>
										</td>
									</tr>
									<tr>
										<td>분수량</td>
										<td style="text-align:right;">
											<span id="pLendAmtTable"></span>
										</td>
									</tr>
									<tr>
										<td>기타부과량</td>
										<td style="text-align:right;">
											<span id="pEtcAmtTable"></span>
										</td>
									</tr>
									<tr>
										<td style="background-color:#c69a04;color:#FFFFFF;">무수수량</td>
										<td style="background-color:#c69a04;color:#FFFFFF;text-align:right;">
											<span id="unpaidAmtTable"></span>
										</td>
									</tr>
									<tr>
										<td>계량기불감수량</td>
										<td style="text-align:right;">
											<span id="uMchkAmtTable"></span>
										</td>
									</tr>
									<tr>
										<td>수도사업용수량</td>
										<td style="text-align:right;">
											<span id="uSudoAmtTable"></span>
										</td>
									</tr>
									<tr>
										<td>공공수량</td>
										<td style="text-align:right;">
											<span id="uCommAmtTable"></span>
										</td>
									</tr>
									<tr>
										<td style="font-weight:800">부정수량</td>
										<td style="text-align:right;">
											<span id="uIllegalAmtTable"></span>
										</td>
									</tr>
									<tr>
										<td style="background-color:#bf4336;color:#FFFFFF;">무효수량</td>
										<td style="background-color:#bf4336;color:#FFFFFF;text-align:right;">
											<span id="invalidAmtTable"></span>
										</td>
									</tr>
									<tr>
										<td style="font-weight:800">조정감액수량</td>
										<td style="text-align:right;font-weight:800">
											<span id="iReduceAmtTable"></span>
										</td>
									</tr>
									<tr>
										<td>누수수량</td>
										<td style="text-align:right;">
											<span id="iLossAmtTable"></span>
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
const ColligationManager = function() {
	var DataTable = {
		ele: "#colligationTable",
		table: null,
		option: {
			columns: [{
		        data: "bkNm"
		    }, {
		        data: "anaYm"
		    }, {
		        data: "totSpy"
		    }, {
		        data: "paidAmt",
		    }, {
		        data: "unpaidAmt",
		    }, {
		        data: "lossAmt",
		    }, {
		        data: "wtrFlowRate",
		    }],
		},
		init: function() {
			this.table = Datatables.scroll(this.ele, this.option);
		}
	}

	return {
		init: function() {
			DataTable.init();
			return DataTable.table;
		},
		table: function() {
			return DataTable.table;
		}
	}
}();

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

	var table = ColligationManager.init();

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
		
		setColligation($('#startDatePicker').val(), $('#endDatePicker').val() );
	});

	var gaugeChart1;
	var gaugeChart2;

	function setColligation(startDate, endDate) {
		var checkbox = document.getElementsByName('checkbox');
		var checkboxLength = checkbox.length;
		var checkList = [];
		
		for (var i = 0; i < checkboxLength; i++){
			if (checkbox[i].checked) {
				checkList.push(checkbox[i].value);
			}
		}
		
		table.clear().draw();
		
		var data = {"startDate": startDate, "endDate": endDate, "checkList": checkList};

		$.ajax({
			url: contextPath + "/flux/colligation/search",
			type: "get",
			dataType: "json",
			data: data,
			success: function(data) {
				table.rows.add(data.waterFlowAnalysis).draw();

				$("#totSpyText").text(data.totSpy);
				$("#totSpyTable").text(data.totSpy);

				$("#validAmtText").text(data.validAmt);
				$("#validAmtTable").text(data.validAmt);

				$("#invalidAmtText").text(data.invalidAmt);
				$("#invalidAmtTable").text(data.invalidAmt);
				
				$("#iReduceAmtText").text(data.reduceAmt);
				$("#iReduceAmtTable").text(data.reduceAmt);
				
				$("#paidAmtText").text(data.paidAmt);
				$("#paidAmtTable").text(data.paidAmt);
				
				$("#unpaidAmtText").text(data.unpaidAmt);
				$("#unpaidAmtTable").text(data.unpaidAmt);
				
				$("#uMchkAmtText").text(data.mchkAmt);
				$("#uMchkAmtTable").text(data.mchkAmt);
				
				$("#uSudoAmtText").text(data.sudoAmt);
				$("#uSudoAmtTable").text(data.sudoAmt);
				
				$("#uCommAmtText").text(data.commAmt);
				$("#uCommAmtTable").text(data.commAmt);
				
				$("#uIllegalAmtText").text(data.illegalAmt);
				$("#uIllegalAmtTable").text(data.illegalAmt);
				
				$("#pChkAmtText").text(data.chkAmt);
				$("#pChkAmtTable").text(data.chkAmt);
				
				$("#pUchkAmtText").text(data.uchkAmt);
				$("#pUchkAmtTable").text(data.uchkAmt);
				
				$("#pLendAmtText").text(data.lendAmt);
				$("#pLendAmtTable").text(data.lendAmt);
				
				$("#pEtcAmtText").text(data.etcAmt);
				$("#pEtcAmtTable").text(data.etcAmt);
				
				$("#iLossAmtText").text(data.lossAmt);
				$("#iLossAmtTable").text(data.lossAmt);

				var lossRate;
				if (data.lossAmt == 0 && data.totSpy == 0)
					lossRate = 0;
				else
					lossRate = data.lossAmt / data.totSpy * 100;

				if (gaugeChart1 != undefined)
					gaugeChart1.clear();

				if (gaugeChart2 != undefined)
					gaugeChart2.clear();
				

				gaugeChart1 = makeBgReadGaugeChart("gaugeChart1", lossRate);
				gaugeChart2 = makeBgGrayGaugeChart("gaugeChart2", data.wtrFlowRate);
			},
			beforeSend:function(){
		        $('.loading-container').removeClass('display-none');
		    },
		    complete:function(){
		        $('.loading-container').addClass('display-none');
		    }
		});
	}
	
	setColligation($('#startDatePicker').val(), $('#endDatePicker').val() );
});
</script>