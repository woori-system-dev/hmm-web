<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tagLib.jsp"%>

<style>
.map {
	height: 800px;
}

.m-portlet .m-portlet__body {
	padding: 1rem 1rem;
}

.nav-link {
	padding: 0.4rem 0.4rem;
}

.m-demo .m-demo__preview {
	padding: 15px;
}

.form-group {
	margin-bottom: 5px;
}

.btn {
	line-height: 0.8;
}
</style>

<div class="m-grid__item m-grid__item--fluid m-wrapper">
	<div class="m-subheader">
		<div class="d-flex align-items-center">
			<div class="mr-auto">
				<h3 class="m-subheader__title">
					시설물 정보
				</h3>
			</div>
		</div>
	</div>
	<div class="m-content">
		<div class="row">
			<div class="col-md-9">
				<div class="m-portlet">
					<div class="m-portlet__body">
						<div id="map" class="map"></div>
					</div>
				</div>
			</div>
			<div class="col-md-3" style="padding-left:0px">
				<div class="m-portlet">
					<div class="m-portlet__body">
						<ul class="nav nav-tabs" role="tablist">
							<!-- <li class="nav-item">
								<a class="nav-link active" data-toggle="tab" href="#m_tabs_1_1">
									지도검색
								</a>
							</li> -->
							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#m_tabs_1_2">
									시설검색
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#m_tabs_1_3">
									레이어
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#m_tabs_1_4">
									정보조회
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link active" data-toggle="tab" href="#m_tabs_1_5">
									블록관리
								</a>
							</li>
						</ul>
						<div class="tab-content">
							<!-- <div class="tab-pane active" id="m_tabs_1_1" role="tabpanel">
								<div class="m-section m-section--last">
									<div class="m-section__content">
										begin::Preview
										<div class="m-demo" data-code-preview="true" data-code-html="true" data-code-js="false">
											<div class="m-demo__preview">
												<div class="m-form__group form-group row">
													<h5 class="m--font-boldest">
														검색조건
													</h5>
													<div class="col-12">
														<div class="m-radio-inline" style="margin-left:15px">
															<label class="m-radio">
																<input type="radio" name="search" value="1">
																명칭
																<span></span>
															</label>
															<label class="m-radio">
																<input type="radio" name="search" value="2">
																지번
																<span></span>
															</label>
															<label class="m-radio">
																<input type="radio" name="search" value="3">
																도로명
																<span></span>
															</label>
														</div>
													</div>
													<label for="example-text-input" class="col-3 col-form-label" style="text-align:right">
														검색어
													</label>
													<div class="col-9">
														<input class="form-control m-input" type="text" id="search">
													</div>
												</div>
												<div style="text-align: right;">
													<button type="button" class="btn btn-info m-btn--wide">
														<i class="fa flaticon-pie-chart"></i>
														 초기화
													</button>
													<button type="button" class="btn btn-success m-btn--wide">
														<i class="fa fa-search"></i>
														검 색
													</button>
												</div>
											</div>
											<div class="m-demo__preview">
												<div id="m_datatable"></div>
											</div>
										</div>
									</div>
								</div>
							</div> -->
							<div class="tab-pane" id="m_tabs_1_2" role="tabpanel">
								<div class="m-portlet">
									<div class="m-portlet__head" style="height:40px">
										<div class="m-portlet__head-caption">
											<div class="m-portlet__head-title">
												<span class="m-portlet__head-icon">
													<i class="flaticon-search"></i>
											 	</span>
												<h6 class="m-portlet__head-text">
													검색 조건 설정
												</h6>
											</div>
										</div>
									</div>
									<div class="m-portlet__body" style="font-weight:900">
										<div class="form-group m-form__group row">
											<label for="example-text-input" class="col-4 col-form-label">
												시설물종류
											</label>
											<div class="col-7" style="padding:0">
												<select class="form-control m-input m-input--square" id="exampleSelect1">
													<option>상수관로</option>
													<option>1</option>
													<option>2</option>
												</select>
											</div>
										</div>
										<div class="form-group m-form__group row">
											<label for="example-text-input" class="col-4 col-form-label">
												관리번호
											</label>
											<div class="col-7" style="padding:0">
												<input class="form-control m-input" type="text" id="example-text-input">
											</div>
										</div>
										<div class="form-group m-form__group row">
											<label for="example-text-input" class="col-4 col-form-label">
												상수관용도
											</label>
											<div class="col-7" style="padding:0">
												<select class="form-control m-input m-input--square" id="exampleSelect1">
													<option>전체</option>
													<option>1</option>
													<option>2</option>
												</select>
											</div>
										</div>
										<div class="form-group m-form__group row" style="margin">
											<label for="example-text-input" class="col-4 col-form-label">
												관재질
											</label>
											<div class="col-7" style="padding:0">
												<select class="form-control m-input m-input--square" id="exampleSelect1">
													<option>전체</option>
													<option>1</option>
													<option>2</option>
												</select>
											</div>
										</div>
										
										<div class="row" style="text-align: right;">
											<div class="col-12">
												<button type="button" class="btn btn-info m-btn--wide">
														초기화
												</button>
												<button type="button" class="btn btn-success m-btn--wide">
													<i class="fa fa-search"></i>
														검 색
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="tab-pane" id="m_tabs_1_3" role="tabpanel">
								<div class="m-portlet" style="padding-left:30px">
									<br>
									<label class="m-checkbox m-checkbox--check-bold">
										<input type="checkbox" name ="checkbox" value="${list}">
											수압계
										<span></span>
									</label><br>
									<label class="m-checkbox m-checkbox--check-bold">
										<input type="checkbox" name ="checkbox" value="${list}">
											유량계
										<span></span>
									</label><br>
									<label class="m-checkbox m-checkbox--check-bold">
										<input type="checkbox" name ="checkbox" value="${list}">
											변류시설
										<span></span>
									</label><br>
									<label class="m-checkbox m-checkbox--check-bold">
										<input type="checkbox" name ="checkbox" value="${list}">
											소방시설
										<span></span>
									</label><br>
									<label class="m-checkbox m-checkbox--check-bold">
										<input type="checkbox" name ="checkbox" value="${list}">
											상수맨홀
										<span></span>
									</label><br>
									<label class="m-checkbox m-checkbox--check-bold">
										<input type="checkbox" name ="checkbox" value="${list}">
											스탠드파이프
										<span></span>
									</label><br>
									<label class="m-checkbox m-checkbox--check-bold">
										<input type="checkbox" name ="checkbox" value="${list}">
											저수조
										<span></span>
									</label><br>
								</div>
							</div>
							<div class="tab-pane" id="m_tabs_1_4" role="tabpanel">
								<div class="m-portlet">
									<div class="m-portlet__head" style="height:60px;font-weight:900">
										<div class="m-portlet__head-caption">
											<div class="form-group m-form__group row">
												<label for="example-text-input" class="col-4 col-form-label">
													시설물종류
												</label>
												<div class="col-7" style="padding:0">
													<select class="form-control m-input m-input--square" id="exampleSelect1">
														<option>상수관로</option>
														<option>1</option>
														<option>2</option>
													</select>
												</div>
											</div>
										</div>
									</div>
									<div class="m-portlet__body" style="font-weight:900">
										<div class="row" style="margin-left:10px;margin-right:5px">
											<div style="border:1px solid;width:99%;height:400px;overflow-y:scroll;">
												<table class="table table-bordered m-table" style="line-height:0.4rem;">
													<colgroup>
															<col style="width:50%;">
															<col style="width:50%;">
													</colgroup>
														<tr>
															<td style="background-color:#358097;color:#FFFFFF;">
																필드명
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
																관리기관
															</td>
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
										<div class="row" style="text-align:right;margin-top:10px;">
											<div class="col-12">
												<button type="button" class="btn btn-success m-btn--wide">
													위치확인
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="tab-pane active" id="m_tabs_1_5" role="tabpanel">
								<div class="m-portlet">
									<div class="m-portlet__head" style="height:40px">
										<div class="m-portlet__head-caption">
											<div class="m-portlet__head-title">
												<span class="m-portlet__head-icon">
													<i class="la la-edit"></i>
											 	</span>
												<h6 class="m-portlet__head-text">
													블록 추가 설정
												</h6>
											</div>
										</div>
									</div>
									<div class="m-portlet__body" style="font-weight:900">
										<div class="form-group m-form__group row">
											<label for="example-text-input" class="col-4 col-form-label">
												시설물번호
											</label>
											<div class="col-7" style="padding:0">
												<input class="form-control m-input" type="number" id="flctcFm">
											</div>
										</div>
										<div class="form-group m-form__group row">
											<label for="example-text-input" class="col-4 col-form-label">
												블록명칭
											</label>
											<div class="col-7" style="padding:0">
												<input class="form-control m-input" type="text" id="bkNm">
											</div>
										</div>
										<div class="form-group m-form__group row">
											<label for="example-text-input" class="col-4 col-form-label">
												유량계 번호
											</label>
											<div class="col-7" style="padding:0">
												<input class="form-control m-input" type="number" id="fmtIdn">
											</div>
										</div>
										<div class="form-group m-form__group row">
											<label for="example-text-input" class="col-4 col-form-label">
												수압계 번호
											</label>
											<div class="col-7" style="padding:0">
												<input class="form-control m-input" type="number" id="pmtIdn">
											</div>
										</div>
										<div class="form-group m-form__group row">
											<label for="example-text-input" class="col-4 col-form-label">
												영역 선택
											</label>
											<div class="col-8" style="padding:0">
												<button type="button" class="btn btn-info m-btn--wide" id="location">
													그리기
												</button>
												<button type="button" class="btn btn-danger m-btn--wide" id="locationClean">
													지우기
												</button>
											</div>
										</div>
										<div class="row" style="text-align:right;margin-top:10px;">
											<div class="col-12">
												<button type="button" class="btn btn-success m-btn--wide" id="blockInsert">
													블록 추가
												</button>
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
</div>

<script>

var shpVectorLayer = [];
$("input:checkbox").on('click', function() {
	if(shpVectorLayer.length==0){
		if ( $(this).prop('checked') ) {
		}
		var layer = "layersgo";
		var data = {"layer":layer};
		$.ajax({
			url: "/hmm-web/facility/layer",
			type: "get",
			/* dataType: "json", */
			data: data,
			success: function(data) {
				for(var i = 0; data.length; i++){
					var jsonObject = JSON.parse(data[i].geojson);
					shpVectorLayer[i] = new ol.layer.Vector({
						style: styleFunction,
						source: new ol.source.Vector({
					    	features: (new ol.format.GeoJSON()).readFeatures({
					    		'type': 'FeatureCollection',
								'features':[jsonObject]
					        })
					    })
					});
					map.addLayer(shpVectorLayer[i]);
				}
			}
		});
	} else {
		for (var i = 0; i<shpVectorLayer.length; i++){
			map.removeLayer(shpVectorLayer[i]);
		}
		shpVectorLayer = [];
	}
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
/* var geojsonObject = {
		'type': 'FeatureCollection',
        'features':[{ 
            "type": "Feature", 
            "id":"HOYWON",
            "geometry": { 
                "type": "Polygon",
                "coordinates":[
                    [ [ 14158095.018640989, 4520012.5974429073 ], [ 14158095.018639714, 4520012.5974427005 ], [ 14158093.644294927, 4520012.3735318296 ], [ 14158092.270626429, 4520012.1459784415 ], [ 14158090.897641076, 4520011.9147843411 ], [ 14158089.525345728, 4520011.6799512655 ], [ 14158088.153747234, 4520011.4414809402 ], [ 14158086.782852471, 4520011.1993751656 ], [ 14158085.412668291, 4520010.9536356833 ], [ 14158084.043201547, 4520010.7042642562 ], [ 14158082.674459117, 4520010.4512626342 ], [ 14158081.306447845, 4520010.194632574 ], [ 14158079.939174598, 4520009.9343758281 ], [ 14158078.572646243, 4520009.6704941699 ], [ 14158077.20686963, 4520009.4029893121 ], [ 14158075.841851631, 4520009.1318630697 ], [ 14158074.477599114, 4520008.8571171509 ], [ 14158073.114118923, 4520008.5787533242 ], [ 14158071.751417942, 4520008.2967733471 ], [ 14158070.389503011, 4520008.0111789713 ], [ 14158069.028381009, 4520007.7219719244 ], [ 14158067.66805879, 4520007.429154003 ], [ 14158066.308543231, 4520007.1327269282 ], [ 14158064.949841181, 4520006.8326924462 ], [ 14158063.591959512, 4520006.5290523442 ], [ 14158062.234905088, 4520006.2218083506 ], [ 14158060.878684772, 4520005.9109621961 ], [ 14158059.523305438, 4520005.596515662 ], [ 14158058.168773936, 4520005.278470478 ], [ 14158056.81509714, 4520004.9568284117 ], [ 14158055.462281918, 4520004.6315911878 ], [ 14158054.11033513, 4520004.3027605852 ], [ 14158052.759263644, 4520003.9703383194 ], [ 14158051.409074334, 4520003.6343261637 ], [ 14158050.059774058, 4520003.2947258484 ], [ 14158048.711369688, 4520002.9515391141 ], [ 14158047.363868091, 4520002.6047677305 ], [ 14158046.017276132, 4520002.2544134231 ], [ 14158044.671600688, 4520001.9004779551 ], [ 14158043.326848609, 4520001.5429630559 ], [ 14158041.983026786, 4520001.1818704884 ], [ 14158040.640142076, 4520000.8172019618 ], [ 14158039.298201345, 4520000.4489592556 ], [ 14158037.95721148, 4520000.077144078 ], [ 14158036.617179325, 4519999.701758218 ], [ 14158035.278111769, 4519999.32280338 ], [ 14158033.940015683, 4519998.9402813064 ], [ 14158032.602897933, 4519998.5541937435 ], [ 14158031.266765384, 4519998.1645424496 ], [ 14158029.931624917, 4519997.7713291487 ], [ 14158028.597483406, 4519997.3745555812 ], [ 14158027.264347715, 4519996.9742234843 ], [ 14158025.932224721, 4519996.5703346068 ], [ 14158024.601121295, 4519996.1628906736 ], [ 14158023.271044316, 4519995.7518934263 ], [ 14158021.942000644, 4519995.3373446111 ], [ 14158020.613997165, 4519994.9192459527 ], [ 14158019.287040751, 4519994.4975991799 ], [ 14158017.96113828, 4519994.0724060526 ], [ 14158016.636296619, 4519993.6436682753 ], [ 14158015.312522661, 4519993.2113876259 ], [ 14158013.989823254, 4519992.7755657993 ], [ 14158012.668205295, 4519992.3362045372 ], [ 14158011.347675659, 4519991.8933055745 ], [ 14158010.028241206, 4519991.4468706353 ], [ 14158008.709908832, 4519990.9969014768 ], [ 14157965.069929257, 4519976.0371848615 ], [ 14157963.331996411, 4519975.3411826678 ], [ 14157961.682861215, 4519974.4818259971 ], [ 14157960.132614518, 4519973.4680775795 ], [ 14157958.691347504, 4519972.3088997109 ], [ 14157957.369151581, 4519971.013254283 ], [ 14157956.176118273, 4519969.5901030283 ], [ 14157955.1223391, 4519968.0484077455 ], [ 14157954.217905475, 4519966.3971303385 ], [ 14157953.479999142, 4519964.6647850107 ], [ 14157952.918560453, 4519962.8813914591 ], [ 14157952.534614135, 4519961.0599808656 ], [ 14157952.329183979, 4519959.2135857949 ], [ 14157952.303292742, 4519957.3552403366 ], [ 14157952.45796215, 4519955.4979801532 ], [ 14157952.794212865, 4519953.6548425099 ], [ 14157953.313064447, 4519951.8388663074 ], [ 14157990.547841324, 4519842.1299222559 ], [ 14157902.800568335, 4519811.9427809007 ], [ 14157753.570588311, 4519760.6034457842 ], [ 14157723.71346795, 4519754.3992500659 ], [ 14157692.478111928, 4519743.6562135508 ], [ 14157679.405039323, 4519748.5755483275 ], [ 14157590.416729679, 4519983.6808509147 ], [ 14157589.949997138, 4519985.0141490204 ], [ 14157589.552225165, 4519986.3630881021 ], [ 14157589.223325184, 4519987.7250484247 ], [ 14157588.963208495, 4519989.097410542 ], [ 14157588.771786191, 4519990.4775552088 ], [ 14157588.648969226, 4519991.8628634475 ], [ 14157588.594668407, 4519993.2507165084 ], [ 14157588.60879438, 4519994.6384958653 ], [ 14157588.691257648, 4519996.0235831905 ], [ 14157588.841968583, 4519997.4033604041 ], [ 14157589.060837435, 4519998.7752095629 ], [ 14157589.347774312, 4520000.1365129501 ], [ 14157589.702689242, 4520001.4846529765 ], [ 14157590.125492122, 4520002.8170122635 ], [ 14157590.616092749, 4520004.1309735375 ], [ 14157591.174400849, 4520005.4239196787 ], [ 14157591.797548456, 4520006.6866986006 ], [ 14157592.480776349, 4520007.9107160782 ], [ 14157593.222056804, 4520009.0941885449 ], [ 14157594.019362124, 4520010.2353324089 ], [ 14157594.870664628, 4520011.3323639985 ], [ 14157595.773936719, 4520012.3834995516 ], [ 14157596.727150841, 4520013.3869552668 ], [ 14157597.728279497, 4520014.3409472164 ], [ 14157598.775295259, 4520015.2436913578 ], [ 14157599.866170773, 4520016.0934035759 ], [ 14157600.99887878, 4520016.8882996123 ], [ 14157602.171392079, 4520017.626595052 ], [ 14157603.381683595, 4520018.3065053876 ], [ 14157604.627726337, 4520018.9262459166 ], [ 14157605.907493409, 4520019.4840318142 ], [ 14157607.218958043, 4520019.978078071 ], [ 14157625.828652704, 4520041.0547615355 ], [ 14157697.05680974, 4520067.9945748076 ], [ 14157768.764375692, 4520091.5964139774 ], [ 14157793.32303708, 4520097.8534467919 ], [ 14157840.04577123, 4520117.8064352106 ], [ 14157904.790706711, 4520142.7477302803 ], [ 14157911.00332308, 4520140.5364764277 ], [ 14157912.223278336, 4520135.1869436968 ], [ 14157915.487412304, 4520135.1531474385 ], [ 14157924.366467014, 4520147.2973055448 ], [ 14157935.079685392, 4520152.2617391348 ], [ 14158031.174044704, 4520181.7559238803 ], [ 14158087.498958731, 4520032.5133145833 ], [ 14158095.018640989, 4520012.5974429073 ] ]
                ]
            } 
        }]
}; 

var vectorSource = new ol.source.Vector({
    features: (new ol.format.GeoJSON()).readFeatures({
		'type': 'FeatureCollection',
        'features':[{ 
            "type": "Feature", 
            "id":"HOYWON",
            "geometry": { 
                "type": "Polygon",
                "coordinates":[
                    [ [ 14158095.018640989, 4520012.5974429073 ], [ 14158095.018639714, 4520012.5974427005 ], [ 14158093.644294927, 4520012.3735318296 ], [ 14158092.270626429, 4520012.1459784415 ], [ 14158090.897641076, 4520011.9147843411 ], [ 14158089.525345728, 4520011.6799512655 ], [ 14158088.153747234, 4520011.4414809402 ], [ 14158086.782852471, 4520011.1993751656 ], [ 14158085.412668291, 4520010.9536356833 ], [ 14158084.043201547, 4520010.7042642562 ], [ 14158082.674459117, 4520010.4512626342 ], [ 14158081.306447845, 4520010.194632574 ], [ 14158079.939174598, 4520009.9343758281 ], [ 14158078.572646243, 4520009.6704941699 ], [ 14158077.20686963, 4520009.4029893121 ], [ 14158075.841851631, 4520009.1318630697 ], [ 14158074.477599114, 4520008.8571171509 ], [ 14158073.114118923, 4520008.5787533242 ], [ 14158071.751417942, 4520008.2967733471 ], [ 14158070.389503011, 4520008.0111789713 ], [ 14158069.028381009, 4520007.7219719244 ], [ 14158067.66805879, 4520007.429154003 ], [ 14158066.308543231, 4520007.1327269282 ], [ 14158064.949841181, 4520006.8326924462 ], [ 14158063.591959512, 4520006.5290523442 ], [ 14158062.234905088, 4520006.2218083506 ], [ 14158060.878684772, 4520005.9109621961 ], [ 14158059.523305438, 4520005.596515662 ], [ 14158058.168773936, 4520005.278470478 ], [ 14158056.81509714, 4520004.9568284117 ], [ 14158055.462281918, 4520004.6315911878 ], [ 14158054.11033513, 4520004.3027605852 ], [ 14158052.759263644, 4520003.9703383194 ], [ 14158051.409074334, 4520003.6343261637 ], [ 14158050.059774058, 4520003.2947258484 ], [ 14158048.711369688, 4520002.9515391141 ], [ 14158047.363868091, 4520002.6047677305 ], [ 14158046.017276132, 4520002.2544134231 ], [ 14158044.671600688, 4520001.9004779551 ], [ 14158043.326848609, 4520001.5429630559 ], [ 14158041.983026786, 4520001.1818704884 ], [ 14158040.640142076, 4520000.8172019618 ], [ 14158039.298201345, 4520000.4489592556 ], [ 14158037.95721148, 4520000.077144078 ], [ 14158036.617179325, 4519999.701758218 ], [ 14158035.278111769, 4519999.32280338 ], [ 14158033.940015683, 4519998.9402813064 ], [ 14158032.602897933, 4519998.5541937435 ], [ 14158031.266765384, 4519998.1645424496 ], [ 14158029.931624917, 4519997.7713291487 ], [ 14158028.597483406, 4519997.3745555812 ], [ 14158027.264347715, 4519996.9742234843 ], [ 14158025.932224721, 4519996.5703346068 ], [ 14158024.601121295, 4519996.1628906736 ], [ 14158023.271044316, 4519995.7518934263 ], [ 14158021.942000644, 4519995.3373446111 ], [ 14158020.613997165, 4519994.9192459527 ], [ 14158019.287040751, 4519994.4975991799 ], [ 14158017.96113828, 4519994.0724060526 ], [ 14158016.636296619, 4519993.6436682753 ], [ 14158015.312522661, 4519993.2113876259 ], [ 14158013.989823254, 4519992.7755657993 ], [ 14158012.668205295, 4519992.3362045372 ], [ 14158011.347675659, 4519991.8933055745 ], [ 14158010.028241206, 4519991.4468706353 ], [ 14158008.709908832, 4519990.9969014768 ], [ 14157965.069929257, 4519976.0371848615 ], [ 14157963.331996411, 4519975.3411826678 ], [ 14157961.682861215, 4519974.4818259971 ], [ 14157960.132614518, 4519973.4680775795 ], [ 14157958.691347504, 4519972.3088997109 ], [ 14157957.369151581, 4519971.013254283 ], [ 14157956.176118273, 4519969.5901030283 ], [ 14157955.1223391, 4519968.0484077455 ], [ 14157954.217905475, 4519966.3971303385 ], [ 14157953.479999142, 4519964.6647850107 ], [ 14157952.918560453, 4519962.8813914591 ], [ 14157952.534614135, 4519961.0599808656 ], [ 14157952.329183979, 4519959.2135857949 ], [ 14157952.303292742, 4519957.3552403366 ], [ 14157952.45796215, 4519955.4979801532 ], [ 14157952.794212865, 4519953.6548425099 ], [ 14157953.313064447, 4519951.8388663074 ], [ 14157990.547841324, 4519842.1299222559 ], [ 14157902.800568335, 4519811.9427809007 ], [ 14157753.570588311, 4519760.6034457842 ], [ 14157723.71346795, 4519754.3992500659 ], [ 14157692.478111928, 4519743.6562135508 ], [ 14157679.405039323, 4519748.5755483275 ], [ 14157590.416729679, 4519983.6808509147 ], [ 14157589.949997138, 4519985.0141490204 ], [ 14157589.552225165, 4519986.3630881021 ], [ 14157589.223325184, 4519987.7250484247 ], [ 14157588.963208495, 4519989.097410542 ], [ 14157588.771786191, 4519990.4775552088 ], [ 14157588.648969226, 4519991.8628634475 ], [ 14157588.594668407, 4519993.2507165084 ], [ 14157588.60879438, 4519994.6384958653 ], [ 14157588.691257648, 4519996.0235831905 ], [ 14157588.841968583, 4519997.4033604041 ], [ 14157589.060837435, 4519998.7752095629 ], [ 14157589.347774312, 4520000.1365129501 ], [ 14157589.702689242, 4520001.4846529765 ], [ 14157590.125492122, 4520002.8170122635 ], [ 14157590.616092749, 4520004.1309735375 ], [ 14157591.174400849, 4520005.4239196787 ], [ 14157591.797548456, 4520006.6866986006 ], [ 14157592.480776349, 4520007.9107160782 ], [ 14157593.222056804, 4520009.0941885449 ], [ 14157594.019362124, 4520010.2353324089 ], [ 14157594.870664628, 4520011.3323639985 ], [ 14157595.773936719, 4520012.3834995516 ], [ 14157596.727150841, 4520013.3869552668 ], [ 14157597.728279497, 4520014.3409472164 ], [ 14157598.775295259, 4520015.2436913578 ], [ 14157599.866170773, 4520016.0934035759 ], [ 14157600.99887878, 4520016.8882996123 ], [ 14157602.171392079, 4520017.626595052 ], [ 14157603.381683595, 4520018.3065053876 ], [ 14157604.627726337, 4520018.9262459166 ], [ 14157605.907493409, 4520019.4840318142 ], [ 14157607.218958043, 4520019.978078071 ], [ 14157625.828652704, 4520041.0547615355 ], [ 14157697.05680974, 4520067.9945748076 ], [ 14157768.764375692, 4520091.5964139774 ], [ 14157793.32303708, 4520097.8534467919 ], [ 14157840.04577123, 4520117.8064352106 ], [ 14157904.790706711, 4520142.7477302803 ], [ 14157911.00332308, 4520140.5364764277 ], [ 14157912.223278336, 4520135.1869436968 ], [ 14157915.487412304, 4520135.1531474385 ], [ 14157924.366467014, 4520147.2973055448 ], [ 14157935.079685392, 4520152.2617391348 ], [ 14158031.174044704, 4520181.7559238803 ], [ 14158087.498958731, 4520032.5133145833 ], [ 14158095.018640989, 4520012.5974429073 ] ]
                ]
            } 
        }]
})
});*/
var source = new ol.source.Vector({ wrapX: false });

var vector = new ol.layer.Vector({
    source: source
});

var map = new ol.Map({
    layers: [
      new ol.layer.Tile({
        source: new ol.source.OSM()
      }),vector
      /* vectorLayer[0] */
    ],
    target: 'map',
    controls: ol.control.defaults({
      attributionOptions: {
        collapsible: false
      }
    }),
    view: new ol.View({
      	projection: 'EPSG:4326',
		center: [127.190, 37.56],
		/* center: [14158030, 4518500], */
		zoom: 14
    })
});

var vetorJson= [];
<c:forEach items="${blockList}" var="item" varStatus="listldx">
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
			}/*, {
	        	'dataProjection': 'EPSG:4326',
				'featureProjection': 'EPSG:3857'
	        } */)
	    })
	});
	map.addLayer(vectorLayer[i]);
}

 


/* 
var e = JSON.parse('[{ "address": "경기도 하남시 미사동 미사대교","OrderID": "53150-422","ShipCountry": "AF","ShipCity": "Qaram Q\u014dl","ShipName": "Welch Group","ShipAddress": "45 Nova Road","CompanyEmail": "jbutner0@de.vu","CompanyAgent": "John Butner","CompanyName": "Bosco-Turner","Currency": "AFN","Notes": "platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien","Department": "Baby","Website": "dropbox.com","Latitude": 36.533332999999999,"Longitude": 69.016666999999998,"ShipDate": "5\/20\/2017","PaymentDate": "2017-03-17 07:39:53","TimeZone": "Asia\/Kabul","Status": 4,"Type": 3,"TotalPayment": "80,238.30 AFN"},{ "address": "경기도 하남시 미사동 미사대교","OrderID": "53150-422","ShipCountry": "AF","ShipCity": "Qaram Q\u014dl","ShipName": "Welch Group","ShipAddress": "45 Nova Road","CompanyEmail": "jbutner0@de.vu","CompanyAgent": "John Butner","CompanyName": "Bosco-Turner","Currency": "AFN","Notes": "platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien","Department": "Baby","Website": "dropbox.com","Latitude": 36.533332999999999,"Longitude": 69.016666999999998,"ShipDate": "5\/20\/2017","PaymentDate": "2017-03-17 07:39:53","TimeZone": "Asia\/Kabul","Status": 4,"Type": 3,"TotalPayment": "80,238.30 AFN"},{ "address": "경기도 하남시 미사동 미사대교","OrderID": "53150-422","ShipCountry": "AF","ShipCity": "Qaram Q\u014dl","ShipName": "Welch Group","ShipAddress": "45 Nova Road","CompanyEmail": "jbutner0@de.vu","CompanyAgent": "John Butner","CompanyName": "Bosco-Turner","Currency": "AFN","Notes": "platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien","Department": "Baby","Website": "dropbox.com","Latitude": 36.533332999999999,"Longitude": 69.016666999999998,"ShipDate": "5\/20\/2017","PaymentDate": "2017-03-17 07:39:53","TimeZone": "Asia\/Kabul","Status": 4,"Type": 3,"TotalPayment": "80,238.30 AFN"},{ "address": "경기도 하남시 미사동 미사대교","OrderID": "53150-422","ShipCountry": "AF","ShipCity": "Qaram Q\u014dl","ShipName": "Welch Group","ShipAddress": "45 Nova Road","CompanyEmail": "jbutner0@de.vu","CompanyAgent": "John Butner","CompanyName": "Bosco-Turner","Currency": "AFN","Notes": "platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien","Department": "Baby","Website": "dropbox.com","Latitude": 36.533332999999999,"Longitude": 69.016666999999998,"ShipDate": "5\/20\/2017","PaymentDate": "2017-03-17 07:39:53","TimeZone": "Asia\/Kabul","Status": 4,"Type": 3,"TotalPayment": "80,238.30 AFN"},{ "address": "경기도 하남시 미사동 미사대교","OrderID": "53150-422","ShipCountry": "AF","ShipCity": "Qaram Q\u014dl","ShipName": "Welch Group","ShipAddress": "45 Nova Road","CompanyEmail": "jbutner0@de.vu","CompanyAgent": "John Butner","CompanyName": "Bosco-Turner","Currency": "AFN","Notes": "platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien","Department": "Baby","Website": "dropbox.com","Latitude": 36.533332999999999,"Longitude": 69.016666999999998,"ShipDate": "5\/20\/2017","PaymentDate": "2017-03-17 07:39:53","TimeZone": "Asia\/Kabul","Status": 4,"Type": 3,"TotalPayment": "80,238.30 AFN"},{ "address": "경기도 하남시 미사동 미사대교","OrderID": "53150-422","ShipCountry": "AF","ShipCity": "Qaram Q\u014dl","ShipName": "Welch Group","ShipAddress": "45 Nova Road","CompanyEmail": "jbutner0@de.vu","CompanyAgent": "John Butner","CompanyName": "Bosco-Turner","Currency": "AFN","Notes": "platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien","Department": "Baby","Website": "dropbox.com","Latitude": 36.533332999999999,"Longitude": 69.016666999999998,"ShipDate": "5\/20\/2017","PaymentDate": "2017-03-17 07:39:53","TimeZone": "Asia\/Kabul","Status": 4,"Type": 3,"TotalPayment": "80,238.30 AFN"},{ "address": "경기도 하남시 미사동 미사대교","OrderID": "53150-422","ShipCountry": "AF","ShipCity": "Qaram Q\u014dl","ShipName": "Welch Group","ShipAddress": "45 Nova Road","CompanyEmail": "jbutner0@de.vu","CompanyAgent": "John Butner","CompanyName": "Bosco-Turner","Currency": "AFN","Notes": "platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien","Department": "Baby","Website": "dropbox.com","Latitude": 36.533332999999999,"Longitude": 69.016666999999998,"ShipDate": "5\/20\/2017","PaymentDate": "2017-03-17 07:39:53","TimeZone": "Asia\/Kabul","Status": 4,"Type": 3,"TotalPayment": "80,238.30 AFN"},{ "address": "경기도 하남시 미사동 미사대교","OrderID": "53150-422","ShipCountry": "AF","ShipCity": "Qaram Q\u014dl","ShipName": "Welch Group","ShipAddress": "45 Nova Road","CompanyEmail": "jbutner0@de.vu","CompanyAgent": "John Butner","CompanyName": "Bosco-Turner","Currency": "AFN","Notes": "platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien","Department": "Baby","Website": "dropbox.com","Latitude": 36.533332999999999,"Longitude": 69.016666999999998,"ShipDate": "5\/20\/2017","PaymentDate": "2017-03-17 07:39:53","TimeZone": "Asia\/Kabul","Status": 4,"Type": 3,"TotalPayment": "80,238.30 AFN"},{ "address": "경기도 하남시 미사동 미사대교","OrderID": "53150-422","ShipCountry": "AF","ShipCity": "Qaram Q\u014dl","ShipName": "Welch Group","ShipAddress": "45 Nova Road","CompanyEmail": "jbutner0@de.vu","CompanyAgent": "John Butner","CompanyName": "Bosco-Turner","Currency": "AFN","Notes": "platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien","Department": "Baby","Website": "dropbox.com","Latitude": 36.533332999999999,"Longitude": 69.016666999999998,"ShipDate": "5\/20\/2017","PaymentDate": "2017-03-17 07:39:53","TimeZone": "Asia\/Kabul","Status": 4,"Type": 3,"TotalPayment": "80,238.30 AFN"},{ "address": "경기도 하남시 미사동 미사대교","OrderID": "53150-422","ShipCountry": "AF","ShipCity": "Qaram Q\u014dl","ShipName": "Welch Group","ShipAddress": "45 Nova Road","CompanyEmail": "jbutner0@de.vu","CompanyAgent": "John Butner","CompanyName": "Bosco-Turner","Currency": "AFN","Notes": "platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien","Department": "Baby","Website": "dropbox.com","Latitude": 36.533332999999999,"Longitude": 69.016666999999998,"ShipDate": "5\/20\/2017","PaymentDate": "2017-03-17 07:39:53","TimeZone": "Asia\/Kabul","Status": 4,"Type": 3,"TotalPayment": "80,238.30 AFN"},{ "address": "경기도 하남시 미사동 미사대교","OrderID": "53150-422","ShipCountry": "AF","ShipCity": "Qaram Q\u014dl","ShipName": "Welch Group","ShipAddress": "45 Nova Road","CompanyEmail": "jbutner0@de.vu","CompanyAgent": "John Butner","CompanyName": "Bosco-Turner","Currency": "AFN","Notes": "platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien","Department": "Baby","Website": "dropbox.com","Latitude": 36.533332999999999,"Longitude": 69.016666999999998,"ShipDate": "5\/20\/2017","PaymentDate": "2017-03-17 07:39:53","TimeZone": "Asia\/Kabul","Status": 4,"Type": 3,"TotalPayment": "80,238.30 AFN"},{ "address": "경기도 하남시 미사동 미사대교","OrderID": "53150-422","ShipCountry": "AF","ShipCity": "Qaram Q\u014dl","ShipName": "Welch Group","ShipAddress": "45 Nova Road","CompanyEmail": "jbutner0@de.vu","CompanyAgent": "John Butner","CompanyName": "Bosco-Turner","Currency": "AFN","Notes": "platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien","Department": "Baby","Website": "dropbox.com","Latitude": 36.533332999999999,"Longitude": 69.016666999999998,"ShipDate": "5\/20\/2017","PaymentDate": "2017-03-17 07:39:53","TimeZone": "Asia\/Kabul","Status": 4,"Type": 3,"TotalPayment": "80,238.30 AFN"},{ "address": "경기도 하남시 미사동 미사대교","OrderID": "53150-422","ShipCountry": "AF","ShipCity": "Qaram Q\u014dl","ShipName": "Welch Group","ShipAddress": "45 Nova Road","CompanyEmail": "jbutner0@de.vu","CompanyAgent": "John Butner","CompanyName": "Bosco-Turner","Currency": "AFN","Notes": "platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien","Department": "Baby","Website": "dropbox.com","Latitude": 36.533332999999999,"Longitude": 69.016666999999998,"ShipDate": "5\/20\/2017","PaymentDate": "2017-03-17 07:39:53","TimeZone": "Asia\/Kabul","Status": 4,"Type": 3,"TotalPayment": "80,238.30 AFN"}]');
var table = $("#m_datatable").mDatatable({
    data: {
        type: "local",
        source:e,
    },
    layout: {
    	theme: "default",
        scroll: !0,  // 스크롤  y축 
        height: 500, // min-height: 300px; 스크롤 x 축
        footer: !1  //아래 레이어 컬럼 생성 유무
    },
    sortable: !0, //컬럼 선택을 통한 순서 선택 유무
    pagination: !1, //패이지네이션 생성 유무
    columns: [{
        field: "address",
        title: "주소",
     	width: 150,
    }, {
        field: "OrderID",
        title: "",
        width: 50,
        template: function(t) {
        	return '<button type="button">이동</button>'
        }
    }]
}); */

var draw ="";
var type;
function addInteraction() {
    if (type !== 'None') {
   		draw = new ol.interaction.Draw({
       		source: source,
	       	type: 'Polygon'
      });
      map.addInteraction(draw);
	}
}
 
$("#location").click(function() {
	/* $("#location"). */
	$location = $('#location').attr('disabled', true);
	type = 'Polygon'
	addInteraction();
});

$("#locationClean").click(function() {
	type = 'None';
	map.removeInteraction(draw);
	vector.getSource().clear();
	draw ='';
	$location = $('#location').attr('disabled', false);
});

$("#blockInsert").click(function() {
	if ($('#flctcFm').val()==""){
		alert('시설물번호를 입력하세요');
		return false;
	}
	if ($('#bkNm').val()==""){
		alert('블록명칭을 입력하세요');
		return false;
	}
	if ($('#fmtIdn').val()==""){
		alert('유량계번호를 입력하세요');
		return false;
	}
	if ($('#pmtIdn').val()==""){
		alert('수압계번호를 입력하세요');
		return false;
	}
	if (draw==""){
		alert('영역을 선택하세요');
		return false;
	}
	
	var param = new Object();
	param.flctcCde = 'BK03';
	param.flctcFm = $('#flctcFm').val();
	param.bkNm = $('#bkNm').val();
	param.fmtIdn = $('#fmtIdn').val();
	param.pmtIdn = $('#pmtIdn').val();
	param.coords = '[[['+draw.T.join('],[')+'],['+draw.T[0]+']]]';
	$.ajax({
		url: "/hmm-web/facility/blockInsert",
		type: "post",
		contentType: "application/json",
		/* dataType : "json", */
		data: JSON.stringify(param),
		success: function(data) {
			console.log(data);
			if(data){
				alert("블록 추가");
			} else{
				alert("동일한 시설물번호가 존재합니다");
			}
		}
	});
	
	type = 'None';
	map.removeInteraction(draw);
	vector.getSource().clear();
	draw ='';
	$location = $('#location').attr('disabled', false);
});

</script>