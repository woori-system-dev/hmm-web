<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tagLib.jsp"%>

<div class="m-grid__item m-grid__item--fluid m-wrapper">
	<div class="m-subheader">
		<div class="d-flex align-items-center">
			<div class="mr-auto">
				<h3 class="m-subheader__title ">
					유량 분석 <i class="la la-angle-right arrow-icon"></i> <small>검침데이터 관리</small>
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
					<div class="m-portlet__body" style="font-weight:900">
						<div class="form-group m-form__group row">
							<label for="example-text-input" class="col-4 col-form-label p-0">
								관리번호(수용가)
							</label>
							<div class="col-8 p-0">
								<input class="form-control m-input" type="text" id="suyNoInput">
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label for="example-text-input" class="col-4 col-form-label px-0">
								상수업종
							</label>
							<div class="col-8 p-0">
								<select name="sangBiz" class="form-control m-input m-input--square">
									<option value="전체">전체</option>
									<option value="08:일반용">08:일반용</option>
								</select>
							</div>
						</div>
						<div class="form-group m-form__group row">
							<label for="example-text-input" class="col-4 col-form-label px-0">
								계기번호
							</label>
							<div class="col-8 p-0">
								<input class="form-control m-input" type="text" id="metaNumInput">
							</div>
						</div>
						<div class="row">
							<div class="input-group">
								<div style="padding:6px 15px 0 0;">시작일</div> 
								<input type="text" class="form-control m-input" name="date" placeholder="날짜" id="startDatePicker"/>
								<div class="input-group-append">
									<span class="input-group-text">
										<i class="la la-calendar-check-o"></i>
									</span>
								</div>
							</div>
						</div>
						<div class="row mt-20">
							<div class="input-group">
								<div style="padding:6px 15px 0 0;">종료일</div> 
								<input type="text" class="form-control m-input" name="date" placeholder="날짜" id="endDatePicker"/>
								<div class="input-group-append">
									<span class="input-group-text">
										<i class="la la-calendar-check-o"></i>
									</span>
								</div>
							</div>
						</div>
						<div class="mt-30 text-center">
							<button type="button" class="btn btn-success m-btn--wide" id="searchBtn">
								<i class="fa fa-search"></i> 검 색
							</button>
						</div>
					</div>
				</div>
				<div class="m-portlet">
					<div class="m-portlet__body">
						<button type="button" class="btn btn-outline-success btn-block" data-toggle="modal" data-target="#m_modal">
							업로드
						</button>
						<button type="button" class="btn btn-outline-success btn-block">
							엑셀출력
						</button>
					</div>
				</div>
			</div>
			<div class="col-md-10">
				<div class="m-portlet mb-0" style="height:800px">
					<div class="m-portlet__body pb-0">
						<div id="m_datatable">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="m_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">
					검침데이터 업로드
				</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">
						&times;
					</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="form-group m-form__group row">
					<label for="example-text-input" class="col-3 col-form-label" >
						파일선택
					</label>
					
					<div class="col-8" style="padding:0">
						<div class="custom-file">
							<input type="file" class="custom-file-input" id="customFile">
							<label class="custom-file-label" for="customFile">
								파일 선택
							</label>
						</div>
					</div>
				</div>
				<div class="form-group m-form__group row">
					<label for="example-text-input" class="col-3 col-form-label">
						데이터건수
					</label>
					<div class="col-8" style="padding:0">
						<input class="form-control m-input" type="text" id="example-text-input">
					</div>
				</div>
				<div class="form-group m-form__group row">
					<label for="example-text-input" class="col-3 col-form-label" >
						파일선택
					</label>
					<div class="col-8" style="padding:0px;border:1px solid;width:99%;height:400px;overflow-y:scroll;">
						<table class="table table-bordered m-table" style="line-height:0.4rem;">
							<colgroup>
								<col style="width:50%;">
								<col style="width:50%;">
							</colgroup>
							<tr>
								<td style="background-color:#358097;color:#FFFFFF;">
									검침데이터 항목
								</td>
								<td style="background-color:#358097;color:#FFFFFF;">
									엑셀파일 항목
								</td>
							</tr>
							<tr>
								<td>(*)관리번호</td>
								<td></td>
							</tr>
							<tr>
								<td>(*)납기
								</td><td></td>
							</tr>
							<tr>
								<td>(*)주소</td>
								<td></td>
							</tr>
							<tr>
								<td>상수업종</td>
								<td></td>
							</tr>
							<tr>
								<td>구경</td>
								<td></td>
							</tr>
							<tr>
								<td>계기번호</td>
								<td></td>
							</tr>
							<tr>
								<td>세대수</td>
								<td></td>
							</tr>
							<tr>
								<td>(*)검침일자</td>
								<td></td>
							</tr>
							<tr>
								<td>(*)상수지침</td>
								<td></td>
							</tr>
							<tr>
								<td>연장(m)</td>
								<td>337.91</td>
							</tr>
							<tr>
								<td>접합종류</td>
								<td>KP메카니칼</td>
							</tr>
							<tr>
								<td>최저깊이(m)</td>
								<td>1.2</td>
							</tr>
							<tr>
								<td>최고깊이(m)</td>
								<td>1.2</td>
							</tr>
							<tr>
								<td>공사번호</td>
								<td></td>
							</tr>
							<tr>
								<td>개통상태</td>
								<td></td>
							</tr>
							<tr>
								<td>탐사여부</td>
								<td></td>
							</tr>
							<tr>
								<td>대장초기화여부</td>
								<td>대장 초기화</td>
							</tr>
						</table>
					</div>
				</div>
				
				<div class="form-group mb-0">
					<div class="m-radio-inline">
						<label for="example-text-input" class="col-4 col-form-label p-0">
								중복처리
						</label>
						<label class="m-radio m-radio--success">
							<input type="radio" id="peroid_1" name="example_1" value="1" checked="checked">
								건너뛰기
							<span></span>
						</label>
						<label class="m-radio m-radio--success">
							<input type="radio" id="peroid_1" name="example_1" value="1">
								덮어쓰기
							<span></span>
						</label>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success">
					업로드
				</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">
					닫기
				</button>
			</div>
		</div>
	</div>
</div>

<script>
$(function() {
	$('#startDatePicker').datepicker({
		autoApply: true,
		autoclose: true,
		orientation: "Bottom left",
		format: "yyyy-mm-dd",
	});

	$('#endDatePicker').datepicker({
		autoApply: true,
		autoclose: true,
		orientation: "Bottom left",
		format: "yyyy-mm-dd",
	});

	const d = new Date();
	$("#startDatePicker").datepicker("setDate", new Date(d.getFullYear(), d.getMonth() - 1, d.getDate()));
	$("#endDatePicker").datepicker("setDate", new Date());

	var table = {
	    data: {
			type: "remote",
			source: {
				read : {
					url: contextPath + "/flux/administration/search",
				}
			}
		},
	    layout: {
	        scroll: !0,  // 스크롤  y축 
	        height: 740, // min-height: 300px; 스크롤 x 축
	        footer: !1  //아래 레이어 컬럼 생성 유무
	    },
	    sortable: !0, //컬럼 선택을 통한 순서 선택 유무
	    pagination: !1, //패이지네이션 생성 유무
	    columns: [{
	        field: "suyNo",
	        title: "관리번호",
	        width: 150,
	    }, {
	        field: "payYm",
	        title: "납기",
	        filterable: !1,
	    }, {
	        field: "suyAddr",
	        title: "주소",
	    }, {
	        field: "sangBiz",
	        title: "상수업종"
	    }, {
	        field: "sangDip",
	        title: "구경",
	    }, {
	        field: "metaNum",
	        title: "계기번호",
	    }, {
	        field: "homCnt",
	        title: "세대수",
	        type: "number"
	    }, {
	        field: "gumchimYmd",
	        title: "검침일자",
	        type: "date",
	        format: "YYYY-MM-DD"
	    }, {
	        field: "gumchim",
	        title: "상수지침",
	        type: "number"
	    }, {
	        field: "sangRec",
	        title: "상수인정",
	    }, {
	        field: "sangAmt",
	        title: "상수사용량",
	        type: "number"
	    }]
	};

	$('#searchBtn').click(function() {
		$("#m_datatable").mDatatable("destroy");
		
		var param = new Object();
		param.suyNo = $("#suyNoInput").val();
		param.sangBiz = $("select[name=sangBiz]").val();
		param.metaNum = $("#metaNumInput").val();
		param.startDate = $("#startDatePicker").val();
		param.endDate = $("#endDatePicker").val();

		table.data.source.read.params = param;
		$("#m_datatable").mDatatable(table);
	});
});
</script>