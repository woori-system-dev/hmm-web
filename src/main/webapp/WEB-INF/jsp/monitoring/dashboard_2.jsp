<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tagLib.jsp"%>
<script>
	function changeBar(flag) {
		if(flag == 0){
			$("#defaultBar").show();
			$("#editBar").hide();
		}else{
			$("#defaultBar").hide();
			$("#editBar").show();
		}
	}
</script>
<style>

#mydiv1{
    position: absolute;
    top :243px;
    left :627px;
    z-index: 9;
    background-color: #f1f1f1;
    text-align: center;
    border: 1px solid #d3d3d3;
    margin: 0;
    padding: 0;
}
#mydiv2{
    position: absolute;
    top :366px;
    left :627px;
    z-index: 9;
    background-color: #f1f1f1;
    text-align: center;
    border: 1px solid #d3d3d3;
    margin: 0;
    padding: 0;
}
#mydiv3{
    position: absolute;
    top :366px;
    left :874px;
    z-index: 9;
    background-color: #f1f1f1;
    text-align: center;
    border: 1px solid #d3d3d3;
    margin: 0;
    padding: 0;
}
#mydiv4{
    position: absolute;
    top :366px;
    left :1020px;
    z-index: 9;
    background-color: #f1f1f1;
    text-align: center;
    border: 1px solid #d3d3d3;
    margin: 0;
    padding: 0;
}
#mydiv5{
    position: absolute;
    top :366px;
    left :1162px;
    z-index: 9;
    background-color: #f1f1f1;
    text-align: center;
    border: 1px solid #d3d3d3;
    margin: 0;
    padding: 0;
}
#mydiv6{
    position: absolute;
    top :366px;
    left :1334px;
    z-index: 9;
    background-color: #f1f1f1;
    text-align: center;
    border: 1px solid #d3d3d3;
    margin: 0;
    padding: 0;
}
#mydiv7{
    position: absolute;
    top :515px;
    left :367px;
    z-index: 9;
    background-color: #f1f1f1;
    text-align: center;
    border: 1px solid #d3d3d3;
    margin: 0;
    padding: 0;
}
#mydiv8{
    position: absolute;
    top :646px;
    left :367px;
    z-index: 9;
    background-color: #f1f1f1;
    text-align: center;
    border: 1px solid #d3d3d3;
    margin: 0;
    padding: 0;
}
#mydiv9{
    position: absolute;
    top :753px;
    left :518px;
    z-index: 9;
    background-color: #f1f1f1;
    text-align: center;
    border: 1px solid #d3d3d3;
    margin: 0;
    padding: 0;
}
#mydiv10{
    position: absolute;
    top :534px;
    left :718px;
    z-index: 9;
    background-color: #f1f1f1;
    text-align: center;
    border: 1px solid #d3d3d3;
    margin: 0;
    padding: 0;
}
#mydiv11{
    position: absolute;
    top :658px;
    left :698px;
    z-index: 9;
    background-color: #f1f1f1;
    text-align: center;
    border: 1px solid #d3d3d3;
    margin: 0;
    padding: 0;
}
#mydiv12{
    position: absolute;
    top :697px;
    left :841px;
    z-index: 9;
    background-color: #f1f1f1;
    text-align: center;
    border: 1px solid #d3d3d3;
    margin: 0;
    padding: 0;
}
#mydiv13{
    position: absolute;
    top :571px;
    left :1051px;
    z-index: 9;
    background-color: #f1f1f1;
    text-align: center;
    border: 1px solid #d3d3d3;
    margin: 0;
    padding: 0;
}
#mydiv14{
    position: absolute;
    left :1051px;
    top :701px;
    z-index: 9;
    background-color: #f1f1f1;
    text-align: center;
    border: 1px solid #d3d3d3;
    margin: 0;
    padding: 0;
}
#mydiv15{
    position: absolute;
    top :571px;
    left :1211px;
    z-index: 9;
    background-color: #f1f1f1;
    text-align: center;
    border: 1px solid #d3d3d3;
    margin: 0;
    padding: 0;
}
#mydiv16{
    position: absolute;
    top :571px;
    left :1341px;
    z-index: 9;
    background-color: #f1f1f1;
    text-align: center;
    border: 1px solid #d3d3d3;
    margin: 0;
    padding: 0;
}
#mydiv17{
    position: absolute;
    top :701px;
    left :1341px;
    z-index: 9;
    background-color: #f1f1f1;
    text-align: center;
    border: 1px solid #d3d3d3;
    margin: 0;
    padding: 0;
}
#mydiv1header, 
#mydiv2header,
#mydiv3header,
#mydiv4header,
#mydiv5header,
#mydiv6header,
#mydiv7header,
#mydiv8header,
#mydiv9header,
#mydiv10header,
#mydiv11header,
#mydiv12header,
#mydiv13header,
#mydiv14header,
#mydiv15header,
#mydiv16header,
#mydiv17header {
    padding: 10px;
    cursor: move;
    z-index: 10;
    background-color: #2196F3;
    color: #fff;
    padding: 2px; margin: 0;
}.list-group-item{
	padding: 2px; margin: 0;
}
#editBar{	
	display: none; 
}
</style>
<div class="m-grid__item m-grid__item--fluid m-wrapper">
	<div class="m-subheader">
		<div class="d-flex align-items-center">
			<div class="mr-auto">
				<h3 class="m-subheader__title ">
					실시간 모니터링
				</h3>
			</div>
		</div>
	</div>
	<div class="m-content">
		<div class="row">
			<div class="col-xl-12" >
				<div class="m-portlet" id="defaultBar">
					<ul class="nav">
					  <li class="nav-item">
					    <a class="nav-link active" href="javascript:changeBar(0);">전체화면</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link disabled" href="javascript:changeBar(1);">블록관리</a>
					  </li>
					</ul>
				</div>
				<div class="m-portlet" id="editBar">
					<ul class="nav">
					  <li class="nav-item">
					    <a class="nav-link active" href="javascript:changeBar(0);">전체화면</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link disabled" href="#">블록관리</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link disabled" href="#">블록추가</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link disabled" href="#">블록수정</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link disabled" href="#">블록이동</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link disabled" href="#">블록삭제</a>
					  </li>
					</ul>
				</div>
			</div>
			<div class="col-xl-12">
				<img alt="" src="${pageContext.request.contextPath}/images/mornitoring/water.png" style="height: 700px;">
			</div>
			
			<ul class="list-group fa-ul" id="mydiv1">
			  <li id="mydiv1header" class="list-group-item list-group-item-dark text-white" >
			  	소블록A
			  	<span class="badge badge-danger">BAD</span>
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-tint fa-2x text-primary"></i>
				 &nbsp;239.6 ㎡/hr
			  </li>
			  <li class="list-group-item list-group-item-light " >
			  	<i class="fa fa-square-o fa-5x text-warning"></i>
			  	&nbsp;12,512,045 ㎡
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-clock-o fa-lg text-danger"></i>
			  &nbsp;6.28 kg/
			  </li>
			</ul>
			<ul class="list-group fa-ul" id="mydiv2">
			  <li id="mydiv2header" class="list-group-item list-group-item-dark text-white" >
			  	소블록 B
			  	<span class="badge badge-success">OK</span>
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-tint fa-2x text-primary"></i>
				 &nbsp;239.6 ㎡/hr
			  </li>
			  <li class="list-group-item list-group-item-light " >
			  	<i class="fa fa-square-o fa-5x text-warning"></i>
			  	&nbsp;12,512,045 ㎡
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-clock-o fa-lg text-danger"></i>
			  &nbsp;6.28 kg/
			  </li>
			</ul>
			<ul class="list-group fa-ul" id="mydiv3">
			  <li id="mydiv3header" class="list-group-item list-group-item-dark text-white" >
			  	소블록 C
			  	<span class="badge badge-danger">BAD</span>
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-tint fa-2x text-primary"></i>
				 &nbsp;239.6 ㎡/hr
			  </li>
			  <li class="list-group-item list-group-item-light " >
			  	<i class="fa fa-square-o fa-5x text-warning"></i>
			  	&nbsp;12,512,045 ㎡
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-clock-o fa-lg text-danger"></i>
			  &nbsp;6.28 kg/
			  </li>
			</ul>
			<ul class="list-group fa-ul" id="mydiv4">
			  <li id="mydiv4header" class="list-group-item list-group-item-dark text-white" >
			  	소블록 D
			  	<span class="badge badge-success">OK</span>
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-tint fa-2x text-primary"></i>
				 &nbsp;239.6 ㎡/hr
			  </li>
			  <li class="list-group-item list-group-item-light " >
			  	<i class="fa fa-square-o fa-5x text-warning"></i>
			  	&nbsp;12,512,045 ㎡
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-clock-o fa-lg text-danger"></i>
			  &nbsp;6.28 kg/
			  </li>
			</ul>
			<ul class="list-group fa-ul" id="mydiv5">
			  <li id="mydiv5header" class="list-group-item list-group-item-dark text-white" >
			  	소블록 E
			  	<span class="badge badge-danger">BAD</span>
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-tint fa-2x text-primary"></i>
				 &nbsp;239.6 ㎡/hr
			  </li>
			  <li class="list-group-item list-group-item-light " >
			  	<i class="fa fa-square-o fa-5x text-warning"></i>
			  	&nbsp;12,512,045 ㎡
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-clock-o fa-lg text-danger"></i>
			  &nbsp;6.28 kg/
			  </li>
			</ul>
			<ul class="list-group fa-ul" id="mydiv6">
			  <li id="mydiv6header" class="list-group-item list-group-item-dark text-white" >
			  	소블록 F
			  	<span class="badge badge-success">OK</span>
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-tint fa-2x text-primary"></i>
				 &nbsp;239.6 ㎡/hr
			  </li>
			  <li class="list-group-item list-group-item-light " >
			  	<i class="fa fa-square-o fa-5x text-warning"></i>
			  	&nbsp;12,512,045 ㎡
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-clock-o fa-lg text-danger"></i>
			  &nbsp;6.28 kg/
			  </li>
			</ul>
			<ul class="list-group fa-ul" id="mydiv7">
			  <li id="mydiv7header" class="list-group-item list-group-item-dark text-white" >
			  	소블록 G
			  	<span class="badge badge-danger">BAD</span>
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-tint fa-2x text-primary"></i>
				 &nbsp;239.6 ㎡/hr
			  </li>
			  <li class="list-group-item list-group-item-light " >
			  	<i class="fa fa-square-o fa-5x text-warning"></i>
			  	&nbsp;12,512,045 ㎡
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-clock-o fa-lg text-danger"></i>
			  &nbsp;6.28 kg/
			  </li>
			</ul>
			<ul class="list-group fa-ul" id="mydiv8">
			  <li id="mydiv8header" class="list-group-item list-group-item-dark text-white" >
			  	소블록 H
			  	<span class="badge badge-success">OK</span>
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-tint fa-2x text-primary"></i>
				 &nbsp;239.6 ㎡/hr
			  </li>
			  <li class="list-group-item list-group-item-light " >
			  	<i class="fa fa-square-o fa-5x text-warning"></i>
			  	&nbsp;12,512,045 ㎡
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-clock-o fa-lg text-danger"></i>
			  &nbsp;6.28 kg/
			  </li>
			</ul>
			<ul class="list-group fa-ul" id="mydiv9">
			  <li id="mydiv9header" class="list-group-item list-group-item-dark text-white" >
			  	소블록 I
			  	<span class="badge badge-danger">BAD</span>
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-tint fa-2x text-primary"></i>
				 &nbsp;239.6 ㎡/hr
			  </li>
			  <li class="list-group-item list-group-item-light " >
			  	<i class="fa fa-square-o fa-5x text-warning"></i>
			  	&nbsp;12,512,045 ㎡
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-clock-o fa-lg text-danger"></i>
			  &nbsp;6.28 kg/
			  </li>
			</ul>
			<ul class="list-group fa-ul" id="mydiv10">
			  <li id="mydiv10header" class="list-group-item list-group-item-dark text-white" >
			  	소블록 J
			  	<span class="badge badge-success">OK</span>
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-tint fa-2x text-primary"></i>
				 &nbsp;239.6 ㎡/hr
			  </li>
			  <li class="list-group-item list-group-item-light " >
			  	<i class="fa fa-square-o fa-5x text-warning"></i>
			  	&nbsp;12,512,045 ㎡
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-clock-o fa-lg text-danger"></i>
			  &nbsp;6.28 kg/
			  </li>
			</ul>
			<ul class="list-group fa-ul" id="mydiv11">
			  <li id="mydiv11header" class="list-group-item list-group-item-dark text-white" >
			  	소블록 K
			  	<span class="badge badge-danger">BAD</span>
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-tint fa-2x text-primary"></i>
				 &nbsp;239.6 ㎡/hr
			  </li>
			  <li class="list-group-item list-group-item-light " >
			  	<i class="fa fa-square-o fa-5x text-warning"></i>
			  	&nbsp;12,512,045 ㎡
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-clock-o fa-lg text-danger"></i>
			  &nbsp;6.28 kg/
			  </li>
			</ul>
			<ul class="list-group fa-ul" id="mydiv12">
			  <li id="mydiv12header" class="list-group-item list-group-item-dark text-white" >
			  	소블록 L
			  	<span class="badge badge-success">OK</span>
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-tint fa-2x text-primary"></i>
				 &nbsp;239.6 ㎡/hr
			  </li>
			  <li class="list-group-item list-group-item-light " >
			  	<i class="fa fa-square-o fa-5x text-warning"></i>
			  	&nbsp;12,512,045 ㎡
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-clock-o fa-lg text-danger"></i>
			  &nbsp;6.28 kg/
			  </li>
			</ul>
			<ul class="list-group fa-ul" id="mydiv13">
			  <li id="mydiv13header" class="list-group-item list-group-item-dark text-white" >
			  	소블록 M
			  	<span class="badge badge-danger">BAD</span>
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-tint fa-2x text-primary"></i>
				 &nbsp;239.6 ㎡/hr
			  </li>
			  <li class="list-group-item list-group-item-light " >
			  	<i class="fa fa-square-o fa-5x text-warning"></i>
			  	&nbsp;12,512,045 ㎡
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-clock-o fa-lg text-danger"></i>
			  &nbsp;6.28 kg/
			  </li>
			</ul>
			<ul class="list-group fa-ul" id="mydiv14">
			  <li id="mydiv14header" class="list-group-item list-group-item-dark text-white" >
			  	소블록 N
			  	<span class="badge badge-success">OK</span>
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-tint fa-2x text-primary"></i>
				 &nbsp;239.6 ㎡/hr
			  </li>
			  <li class="list-group-item list-group-item-light " >
			  	<i class="fa fa-square-o fa-5x text-warning"></i>
			  	&nbsp;12,512,045 ㎡
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-clock-o fa-lg text-danger"></i>
			  &nbsp;6.28 kg/
			  </li>
			</ul>
			<ul class="list-group fa-ul" id="mydiv15">
			  <li id="mydiv15header" class="list-group-item list-group-item-dark text-white" >
			  	소블록 O
			  	<span class="badge badge-danger">BAD</span>
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-tint fa-2x text-primary"></i>
				 &nbsp;239.6 ㎡/hr
			  </li>
			  <li class="list-group-item list-group-item-light " >
			  	<i class="fa fa-square-o fa-5x text-warning"></i>
			  	&nbsp;12,512,045 ㎡
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-clock-o fa-lg text-danger"></i>
			  &nbsp;6.28 kg/
			  </li>
			</ul>
			<ul class="list-group fa-ul" id="mydiv16">
			  <li id="mydiv16header" class="list-group-item list-group-item-dark text-white" >
			  	소블록 P
			  	<span class="badge badge-success">OK</span>
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-tint fa-2x text-primary"></i>
				 &nbsp;239.6 ㎡/hr
			  </li>
			  <li class="list-group-item list-group-item-light " >
			  	<i class="fa fa-square-o fa-5x text-warning"></i>
			  	&nbsp;12,512,045 ㎡
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-clock-o fa-lg text-danger"></i>
			  &nbsp;6.28 kg/
			  </li>
			</ul>
			<ul class="list-group fa-ul" id="mydiv17">
			  <li id="mydiv17header" class="list-group-item list-group-item-dark text-white" >
			  	소블록 Q
			  	<span class="badge badge-danger">BAD</span>
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-tint fa-2x text-primary"></i>
				 &nbsp;239.6 ㎡/hr
			  </li>
			  <li class="list-group-item list-group-item-light " >
			  	<i class="fa fa-square-o fa-5x text-warning"></i>
			  	&nbsp;12,512,045 ㎡
			  </li>
			  <li class="list-group-item list-group-item-light" >
			  	<i class="m-menu__link-icon fa fa-clock-o fa-lg text-danger"></i>
			  &nbsp;6.28 kg/
			  </li>
			</ul>
		</div>
	</div>
</div>
<script>
//Make the DIV element draggagle:
dragElement(document.getElementById(("mydiv1")));
dragElement(document.getElementById(("mydiv2")));
dragElement(document.getElementById(("mydiv3")));
dragElement(document.getElementById(("mydiv4")));
dragElement(document.getElementById(("mydiv5")));
dragElement(document.getElementById(("mydiv6")));
dragElement(document.getElementById(("mydiv7")));
dragElement(document.getElementById(("mydiv8")));
dragElement(document.getElementById(("mydiv9")));
dragElement(document.getElementById(("mydiv10")));
dragElement(document.getElementById(("mydiv11")));
dragElement(document.getElementById(("mydiv12")));
dragElement(document.getElementById(("mydiv13")));
dragElement(document.getElementById(("mydiv14")));
dragElement(document.getElementById(("mydiv15")));
dragElement(document.getElementById(("mydiv16")));
dragElement(document.getElementById(("mydiv17")));

function dragElement(elmnt) {
  var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
  if (document.getElementById(elmnt.id + "header")) {
    /* if present, the header is where you move the DIV from:*/
    document.getElementById(elmnt.id + "header").onmousedown = dragMouseDown;
  } else {
    /* otherwise, move the DIV from anywhere inside the DIV:*/
    elmnt.onmousedown = dragMouseDown;
  }

  function dragMouseDown(e) {
    e = e || window.event;
    // get the mouse cursor position at startup:
    pos3 = e.clientX;
    pos4 = e.clientY;
    
    //alert(pos3);
    //alert(pos4);
    document.onmouseup = closeDragElement;
    // call a function whenever the cursor moves:
    document.onmousemove = elementDrag;
  }

  function elementDrag(e) {
    e = e || window.event;
    // calculate the new cursor position:
    pos1 = pos3 - e.clientX;
    pos2 = pos4 - e.clientY;
    pos3 = e.clientX;
    pos4 = e.clientY;
    // set the element's new position:
    elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
    elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
    //$('#' + elmnt.id + "header").html(elmnt.style.top + ", " + elmnt.style.left);
  }

  function closeDragElement() {
    document.onmouseup = null;
    document.onmousemove = null;
  }
}
</script>