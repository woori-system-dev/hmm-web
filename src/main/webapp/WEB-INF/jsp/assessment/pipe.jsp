<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tagLib.jsp"%>

<style>
.m-checkbox {
	font-size: 1.1rem;
	margin-bottom: 5px;
}

.map {
	height: 260px;
}
</style>

<div class="m-grid__item m-grid__item--fluid m-wrapper">
	<div class="m-subheader">
		<div class="d-flex align-items-center">
			<div class="mr-auto">
				<h3 class="m-subheader__title ">
					건전도 평가 <i class="la la-angle-right arrow-icon"></i> <small>관로 평가</small>
				</h3>
			</div>
		</div>
	</div>
	<div class="m-content">
		<div class="row">
			<div class = "col-md-2">
				<div class="m-portlet">
					<div class="m-portlet__head">
						<div class="m-portlet__head-caption">
							<div class="m-portlet__head-title">
								<span class="m-portlet__head-icon">
									<i class="flaticon-search"></i>
							 	</span>
								<h3 class="m-portlet__head-text">
									소블록 선택
								</h3>
							</div>
						</div>
					</div>
					<div class="m-portlet__body">
						<div class="row" style="font-weight:700;">
							<label class="m-checkbox m-checkbox--check-bold">
								<input type="checkbox" id="checkBoxAll" checked="checked" onclick="checkBox()">
									전체 선택
								<span></span>
							</label>
						</div>
						<div class="row" style="margin-left:35px;">
							<c:forEach var="list" items="${blockList}" varStatus="domain">
								<div class="m-checkbox m-checkbox--check-bold">
									<input type="checkbox" name ="checkbox" checked="checked" value="${list}">
										${list}
									<span></span>
								</div>
							</c:forEach>
						</div>
						<div class="row" style="margin:10px 0 0 35px;">
							<button type="button" class="btn btn-success m-btn--wide" onclick="search()">
								<i class="fa fa-search"></i>
									검 색
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
			<div class="col-10">
				<div class="row">
					<div class="col-md-9">
						<div class="m-portlet" style="height:620px">
							<div class="m-portlet__body">
								<div id="m_datatable">
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="m-portlet">
							<div class="m-portlet__body">
								<div class="row">
									<div style="border:1px solid;width:99%;height:300px;overflow-y:scroll;">
										<table class="table table-bordered m-table" style="line-height:0.4rem;">
											<colgroup>
													<col style="width:50%;">
													<col style="width:50%;">
											</colgroup>
												<tr>
													<td style="background-color:#358097;color:#FFFFFF;">
														필드
													</td>
													<td style="background-color:#358097;color:#FFFFFF;">
														값
													</td>
												</tr>
												<tr>
													<td>
														지형지물부호
													</td>
													<td>
														상수관로
													</td>
												</tr>
												<tr>
													<td>
														관리번호
													</td>
													<td>
														703
													</td>
												</tr>
												<tr>
													<td>
														행정읍면동
													</td>
													<td>
														한남시
													</td>
												</tr>
												<tr>
													<td>
														도엽번호
													</td>
													<td>
													</td>
												</tr>
												<tr>
													<td>
														관리기관															</td>
													<td>
														시청
													</td>
												</tr>
												<tr>
													<td>
														설치일자
													</td>
													<td>
														20140201
													</td>
												</tr>
												<tr>
													<td>
														상수관용도
													</td>
													<td>
														배수관
													</td>
												</tr>
												<tr>
													<td>
														관재질
													</td>
													<td>
														닥타일주철관
													</td>
												</tr>
												<tr>
													<td>
														구경(mm)
													</td>
													<td>
														200
													</td>
												</tr>
												<tr>
													<td>
														연장(m)
													</td>
													<td>
														337.91
													</td>
												</tr>
												<tr>
													<td>
														접합종류
													</td>
													<td>
														KP메카니칼
													</td>
												</tr>
												<tr>
													<td>
														최저깊이(m)
													</td>
													<td>
														1.2
													</td>
												</tr>
												<tr>
													<td>
														최고깊이(m)
													</td>
													<td>
														1.2
													</td>
												</tr>
												<tr>
													<td>
														공사번호
													</td>
													<td>
													</td>
												</tr>
												<tr>
													<td>
														개통상태
													</td>
													<td>
													</td>
												</tr>
												<tr>
													<td>
														탐사여부
													</td>
													<td>
													</td>
												</tr>
												<tr>
													<td>
														대장초기화여부
													</td>
													<td>
														대장 초기화
													</td>
												</tr>
										</table>
									</div>
								</div>
								<div class="row">
									<div id="map" class="map"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="m-portlet">
					<div class="m-portlet__body" style="padding:20px">
						<div class="row">
							<div class="col-md-2" style="text-align:center;background-color:#ffff00">
								<div style="font-weight:700;">위험도</div>
								<div style="font-size:40px; font-weight:900;">9</div>
								<div style="font-weight:700;">주의</div>
							</div>
							<div class="col-md-10">
								<div class="row">
									<div class="col-md-3">
										<h4>관로번호 : 564</h4>
									</div>
									<div class="col-md-3">
										<h4>총점수 : 50.657점</h4>
									</div>
								</div>
								<div class="row">
									<div class="col-12">
										<h4>관로가 노후되었으나 사고이력은 없음</h4>
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
function checkBox(){
	var checkbox = document.getElementsByName('checkbox');
	var checkboxLength = checkbox.length;
	if ($('#checkBoxAll').is(":checked")){
		for(var i=0; i<checkboxLength; i++){
			checkbox[i].checked = true;
		}
	} else{
		for(var i=0; i<checkboxLength; i++){
			checkbox[i].checked = false;
		}
	}
} 

var e = JSON.parse('[{ "RecordID": "564","OrderID": "50.701","ShipCountry": "2.627","ShipCity": "13.529","ShipName":"0","ShipAddress":"0","CompanyEmail": "29.247","CompanyAgent": "3.503","CompanyName": "0","Currency": "","Notes": "81","Department": "62"},{ "RecordID": "564","OrderID": "50.701","ShipCountry": "2.627","ShipCity": "13.529","ShipName":"0","ShipAddress":"0","CompanyEmail": "29.247","CompanyAgent": "3.503","CompanyName": "0","Currency": "","Notes": "81","Department": "62"},{ "RecordID": "564","OrderID": "50.701","ShipCountry": "2.627","ShipCity": "13.529","ShipName":"0","ShipAddress":"0","CompanyEmail": "29.247","CompanyAgent": "3.503","CompanyName": "0","Currency": "","Notes": "81","Department": "62"},{ "RecordID": "564","OrderID": "50.701","ShipCountry": "2.627","ShipCity": "13.529","ShipName":"0","ShipAddress":"0","CompanyEmail": "29.247","CompanyAgent": "3.503","CompanyName": "0","Currency": "","Notes": "81","Department": "62"},{ "RecordID": "564","OrderID": "50.701","ShipCountry": "2.627","ShipCity": "13.529","ShipName":"0","ShipAddress":"0","CompanyEmail": "29.247","CompanyAgent": "3.503","CompanyName": "0","Currency": "","Notes": "81","Department": "62"},{ "RecordID": "564","OrderID": "50.701","ShipCountry": "2.627","ShipCity": "13.529","ShipName":"0","ShipAddress":"0","CompanyEmail": "29.247","CompanyAgent": "3.503","CompanyName": "0","Currency": "","Notes": "81","Department": "62"},{ "RecordID": "564","OrderID": "50.701","ShipCountry": "2.627","ShipCity": "13.529","ShipName":"0","ShipAddress":"0","CompanyEmail": "29.247","CompanyAgent": "3.503","CompanyName": "0","Currency": "","Notes": "81","Department": "62"},{ "RecordID": "564","OrderID": "50.701","ShipCountry": "2.627","ShipCity": "13.529","ShipName":"0","ShipAddress":"0","CompanyEmail": "29.247","CompanyAgent": "3.503","CompanyName": "0","Currency": "","Notes": "81","Department": "62"},{ "RecordID": "564","OrderID": "50.701","ShipCountry": "2.627","ShipCity": "13.529","ShipName":"0","ShipAddress":"0","CompanyEmail": "29.247","CompanyAgent": "3.503","CompanyName": "0","Currency": "","Notes": "81","Department": "62"},{ "RecordID": "564","OrderID": "50.701","ShipCountry": "2.627","ShipCity": "13.529","ShipName":"0","ShipAddress":"0","CompanyEmail": "29.247","CompanyAgent": "3.503","CompanyName": "0","Currency": "","Notes": "81","Department": "62"},{ "RecordID": "564","OrderID": "50.701","ShipCountry": "2.627","ShipCity": "13.529","ShipName":"0","ShipAddress":"0","CompanyEmail": "29.247","CompanyAgent": "3.503","CompanyName": "0","Currency": "","Notes": "81","Department": "62"},{ "RecordID": "564","OrderID": "50.701","ShipCountry": "2.627","ShipCity": "13.529","ShipName":"0","ShipAddress":"0","CompanyEmail": "29.247","CompanyAgent": "3.503","CompanyName": "0","Currency": "","Notes": "81","Department": "62"},{ "RecordID": "564","OrderID": "50.701","ShipCountry": "2.627","ShipCity": "13.529","ShipName":"0","ShipAddress":"0","CompanyEmail": "29.247","CompanyAgent": "3.503","CompanyName": "0","Currency": "","Notes": "81","Department": "62"},{ "RecordID": "564","OrderID": "50.701","ShipCountry": "2.627","ShipCity": "13.529","ShipName":"0","ShipAddress":"0","CompanyEmail": "29.247","CompanyAgent": "3.503","CompanyName": "0","Currency": "","Notes": "81","Department": "62"},{ "RecordID": "564","OrderID": "50.701","ShipCountry": "2.627","ShipCity": "13.529","ShipName":"0","ShipAddress":"0","CompanyEmail": "29.247","CompanyAgent": "3.503","CompanyName": "0","Currency": "","Notes": "81","Department": "62"},{ "RecordID": "564","OrderID": "50.701","ShipCountry": "2.627","ShipCity": "13.529","ShipName":"0","ShipAddress":"0","CompanyEmail": "29.247","CompanyAgent": "3.503","CompanyName": "0","Currency": "","Notes": "81","Department": "62"},{ "RecordID": "564","OrderID": "50.701","ShipCountry": "2.627","ShipCity": "13.529","ShipName":"0","ShipAddress":"0","CompanyEmail": "29.247","CompanyAgent": "3.503","CompanyName": "0","Currency": "","Notes": "81","Department": "62"},{ "RecordID": "564","OrderID": "50.701","ShipCountry": "2.627","ShipCity": "13.529","ShipName":"0","ShipAddress":"0","CompanyEmail": "29.247","CompanyAgent": "3.503","CompanyName": "0","Currency": "","Notes": "81","Department": "62"}]');
	var table = $("#m_datatable").mDatatable({
    data: {
        type: "local",
        source:e,
        pageSize: 10,
       
    },
    layout: {
        scroll: !0,  // 스크롤  y축 
        height: 540, // min-height: 300px; 스크롤 x 축
        footer: !1  //아래 레이어 컬럼 생성 유무
    },
    sortable: !0, //컬럼 선택을 통한 순서 선택 유무
    pagination: !1, //패이지네이션 생성 유무
    columns: [{
        field: "RecordID",
        title: "관로번호",
        width: 150,
    }, {
        field: "OrderID",
        title: "총점수",
        filterable: !1,
    }, {
        field: "ShipCountry",
        title: "관용도",
    }, {
        field: "ShipCity",
        title: "관재질",
    }, {
        field: "ShipName",
        title: "구경",
    }, {
        field: "ShipAddress",
        title: "설치일자",
    }, {
        field: "CompanyEmail",
        title: "매설심도",
    }, {
        field: "ShipName",
        title: "접합종류",
    }, {
        field: "CompanyName",
        title: "누수이력",
    }, {
        field: "CompanyName",
        title: "누수건수",
    }]
});

var styles = {       
        'Polygon': new ol.style.Style({
          stroke: new ol.style.Stroke({
            color: 'blue',
            /* lineDash: [4], */
            width: 2
          }),
          fill: new ol.style.Fill({
            color: 'rgba(0, 0, 255, 0.1)'
          })
        })
      };
var styleFunction = function(feature) {
    return styles[feature.getGeometry().getType()];
};	
	
	
	
var map = new ol.Map({
    layers: [
      new ol.layer.Tile({
        source: new ol.source.OSM()
      }),
      /* vectorLayer[0] */
    ],
    target: 'map',
    controls: ol.control.defaults({
      attributionOptions: {
        collapsible: false
      }
    }),
    view: new ol.View({
      /* projection: 'EPSG:4326', */
		center: [14158530, 4518500],
		zoom: 12
    })
});

var vetorJson= [];
<c:forEach items="${blockListShp}" var="item" varStatus="listldx">
	vetorJson.push(JSON.parse("${item.coords}"));
</c:forEach>
var vectorLayer = [];
for(var i=0; i<vetorJson.length; i++){
	vectorLayer[i] = new ol.layer.Vector({
	    style: styleFunction,
	    source: new ol.source.Vector({
	    	features: (new ol.format.GeoJSON()).readFeatures({
	    		'type': 'FeatureCollection',
	            'features':[{ 
	                "type": "Feature", 
	                "id":"HOYWON",
	                "geometry": { 
	                    "type": "Polygon",
	                    "coordinates":vetorJson[i]
	                } 
	            }],
			},{
	        	'dataProjection': 'EPSG:4326',
				'featureProjection': 'EPSG:3857'
	        })
	    })
	});
	map.addLayer(vectorLayer[i]);
}
</script>
