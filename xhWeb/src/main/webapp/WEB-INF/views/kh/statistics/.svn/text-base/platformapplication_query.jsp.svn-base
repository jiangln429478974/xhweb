<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rs" value="${ctx}/resources" />

<rapid:override name="title">宁波市公共信用信息服务平台</rapid:override>

<rapid:override name="css">
	<link href="${rs}/css/plugins/jQueryUI/jquery-ui-1.10.4.custom.min.css"
		rel="stylesheet">
	<!-- Data Tables -->
	<link href="${rs}/css/plugins/jqgrid/ui.jqgrid.css" rel="stylesheet">
	<link href="${rs}/js/plugins/layer/skin/layer.css" rel="stylesheet">
	<style>
/* Additional style to fix warning dialog position */
#alertmod_table_list_2 {
	top: 900px !important;
}

.input-control {
	height: 34px;
	font-size: 14px;
	color: #555;
	background-color: #FFF;
	background-image: none;
	border: 1px solid #CCC;
	border-radius: 4px;
	box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075) inset;
}

</style>
</rapid:override>
<rapid:override name="content">
	<div class="wrapper">
		<div class="portlet box blue">
			<div class="portlet-title ">
				<div class="caption">平台应用查询情况</div>
<!-- 				<div class="tools"> -->
<!-- 					<a class="collapse" href="" data-original-title="" title=""> </a> -->
<!-- 				</div> -->
			</div>
			<div class="portlet-body form">
				<div class="form-horizontal">
					<div class="wrapper wrapper-content  animated fadeInRight">
						<br/>
						<div class="row">
							<div class="col-md-12" id="bumen">
								<a href="javascript:;" class="btn green" id="fr" style="margin-left:12px; margin-bottom:10px;" onClick="submitCondition(this)">法人信用信息查询</a>
								<a href="javascript:;" class="btn blue" id="zr" style="margin-left:12px; margin-bottom:10px;" onClick="submitCondition(this)">自然人信用信息查询</a>
								<a href="javascript:;" class="btn blue"  style="margin-left:12px; margin-bottom:10px;" onClick="quarterQuery(this)">各部门查询明细</a>
							</div>
						</div>
						<br/>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="margin-top-10 margin-bottom-10 margin-right-10 clearfix" style="margin-left:10px;">
		<table class="table table-bordered table-striped">
			<tbody  id="table_body">
				
			</tbody>
		</table>
	</div>

</rapid:override>
<rapid:override name="script">
	<script src="${rs}/js/plugins/jqgrid/i18n/grid.locale-cn.js"></script>
	<script src="${rs}/js/plugins/jqgrid/jquery.jqGrid.min.js"></script>
	<script src="${rs}/js/plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="${rs}/js/plugins/layer/layer.js"></script>
	<script src="${ctx}/resources/scripts/My97DatePicker/WdatePicker.js"></script>
	<script src="${ctx}/resources/dist/echarts-all.js"></script>
	
	<!-- <script src="${rs}/js/jquery-2.1.1.min.js"></script>  -->
	<script type="text/javascript">
	
	function loading() {
		layer.load(4, {
			shade : [ 0.5, '#ccc' ]
		//0.1透明度的白色背景
		});
	}

	function hideLoading() {
		layer.closeAll('loading');
	}
	
	function submitCondition(obj){
		var frOrzr = $(obj).attr("id");
		$("#bumen a").removeClass();
		$("#bumen a").addClass("btn blue");
		$(obj).removeClass();
		$(obj).addClass("btn green");
		/**
		$("#bumen a").each(function(){
			if($(this).hasClass("btn green")){
				$(this).removeClass();
				$(this).addClass("btn blue");
			}else{
				$(this).removeClass();
				$(this).addClass("btn blue");
			}
		});**/
		
		loading();
		$.ajax({
			url : '${ctx}/statistics/bmQueryList/',
			type : "POST",
			data : {
				"frOrzr" : frOrzr
			},
			dataType : "json"
		}).done(function(resultData, ss) {
			hideLoading();
			var  appendTable="<tr><td style='text-align: center;' colspan='3' id='table_title'></td></tr>"+
			"<tr><td>序号</td><td>应用单位</td><td>累计查询次数</td></tr>";
		
			for(var i=0;i<resultData.length;i++){
				appendTable+="<tr><td>"+(i+1)+"</td>"+
				"<td>"+resultData[i]["BMMC"]+"</td>"+
				"<td>"+resultData[i]["NUM"]+"</td>"+
				"</tr>";
				
			}
			$("#table_body").html(appendTable);
			
			if(frOrzr=="fr"){
				$("#table_title").text("法人信用信息查询情况");
			}else{
				$("#table_title").text("自然人信用信息查询情况");
			}
			
		}).fail(function(jqXHR, textStatus, errorThrown) {
			hideLoading();
			layer.msg('数据获取失败，请稍后重试');
		});
	}
	
	function  quarterQuery(obj){
		$("#bumen a").removeClass();
		$("#bumen a").addClass("btn blue");
		$(obj).removeClass();
		$(obj).addClass("btn green");
		
		loading();
		$.ajax({
			url : '${ctx}/statistics/quarterQuery/',
			type : "POST",
			data : {},
			dataType : "json"
		}).done(function(resultData, ss) {
			hideLoading();
			var  appendTable = "<tr><td style='text-align: center;' colspan='3'>法人</td>"+
			"<td style='text-align: center;' colspan='2'>自然人</td></tr>"+
			"<tr><td>应用单位</td><td>当季查询次数</td><td>累计查询次数</td>"+
			"<td>当季查询次数</td><td>累计查询次数</td>"+
			"</tr>";
			
			var sumFrResultList = resultData["sumFrResultList"];
			var sumZrResultList = resultData["sumZrResultList"];
			var quarterFrResultList = resultData["quarterFrResultList"];
			var quarterZrResultList = resultData["quarterZrResultList"];
			for(var i=0;i<sumFrResultList.length;i++){
				appendTable+="<tr><td>"+sumFrResultList[i]["BMMC"]+"</td>"+
				"<td>"+quarterFrResultList[i]["NUM"]+"</td>"+
				"<td>"+sumFrResultList[i]["NUM"]+"</td>"+
				"<td>"+quarterZrResultList[i]["NUM"]+"</td>"+
				"<td>"+sumZrResultList[i]["NUM"]+"</td>"+
				"</tr>";
			}
			$("#table_body").html(appendTable);
		}).fail(function(jqXHR, textStatus, errorThrown) {
			hideLoading();
			layer.msg('数据获取失败，请稍后重试');
		});
	}
	
	$(document).ready(function(){
		var frOrzr = "fr";
		loading();
		$.ajax({
			url : '${ctx}/statistics/bmQueryList/',
			type : "POST",
			data : {
				"frOrzr" : frOrzr
			},
			dataType : "json"
		}).done(function(resultData, ss) {
			hideLoading();
			var  appendTable="<tr><td style='text-align: center;' colspan='3' id='table_title'></td></tr>"+
			"<tr><td>序号</td><td>应用单位</td><td>累计查询次数</td></tr>";
		
			for(var i=0;i<resultData.length;i++){
				appendTable+="<tr><td>"+(i+1)+"</td>"+
				"<td>"+resultData[i]["BMMC"]+"</td>"+
				"<td>"+resultData[i]["NUM"]+"</td>"+
				"</tr>";
				
			}
			$("#table_body").html(appendTable);
			
			if(frOrzr=="fr"){
				$("#table_title").text("法人信用信息查询情况");
			}else{
				$("#table_title").text("自然人信用信息查询情况");
			}
			
		}).fail(function(jqXHR, textStatus, errorThrown) {
			hideLoading();
			layer.msg('数据获取失败，请稍后重试');
		});
		
		
	});
	</script>

</rapid:override>
<%@ include file="../../template/base.jsp"%>