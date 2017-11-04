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

.fontset {
	font-size: 16px;
	font-style: bold;
	color: #5E5E5E
}

.spanstyle {
	word-break: normal;
	width: auto;
	display: block;
	white-space: pre-wrap;
	word-wrap: break-word;
	overflow: hidden
}

.table_font {
	weight: 600;
	color: #7FB0DB
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
				<div class="caption">数据核查</div>
				<div class="tools">
<!-- 					<a class="collapse" href="" data-original-title="" title=""> </a> -->
				</div>
			</div>
			<div class="portlet-body form">
				<div class="form-horizontal">
					<br>
					<div class="row">
						<label class="control-label col-md-2"> 查询事项: </label>
						<div class="col-md-2">
							<select name="select" class="form-control" id="select_xyInfoType">
								<option>自然人</option>
								<option>法人</option>
							</select>
						</div>
						<div class="col-md-2">
							<select name="select" class="form-control" id="BMID"
								onchange="initXXSX(this)">
							</select>
						</div>
						<div class="col-md-3">
							<select name="select" class="form-control" id="XXSX"
								onchange="initXXNR(this)">
							</select>
						</div>

						<div class="col-md-3">
							<select name="select" class="form-control" id="XXNR" style="width:90%">
							</select>
						</div>
					</div>
					<br/>
					<div class="row">
						<label class="control-label col-md-2">身份证号码: </label>
						<div class="col-md-4">
							<input class="form-control" placeholder="身份证号码" type="text"
								id="sfzhm" onkeyup="value=value.replace(/[\W]/g,'')">
						</div>
						<div class="col-md-6">
							<input class="form-control" placeholder="或  填写UNID号" type="text"
								id="unid" style="width: 96%">
						</div>
					</div>
				</div>
				<br />
				<div class="row">
						<label class="control-label col-md-2" style="text-align: right">比对基准: </label>
						<div class="col-md-4">
							<input class="form-control" placeholder="请输入比对基准" type="text"
								id="bdjz"/>
						</div>
						<div class="col-md-6">
						</div>
				</div>
				<br/>
				<div class="row">
					<div class="col-md-offset-5 col-md-2">
						<span><button class="btn blue" type="button" id="search">
								<i class="fa fa-search"></i>搜 索
							</button></span>
					</div>
				</div>
				<br/>
			</div>
		</div>
	</div>
	
	<div id="div_original" class="portlet box blue"
		style="margin-left: 6px; margin-right: 6px">
		<div class="portlet-title">
			<div class="caption">
				<i class="fa fa-coffee"></i>原始库查询结果
			</div>
<!-- 			<div class="tools"> -->
<!-- 				<a title="" data-original-title="" href="javascript:;" -->
<!-- 					class="collapse"> </a> <a title="" data-original-title="" -->
<!-- 					href="javascript:;" class="reload"> </a> -->
<!-- 			</div> -->
		</div>
		<div class="portlet-body">
			<div class="table-scrollable">
				<table class="table table-bordered table-hover" id="table_original">
					<thead>
						<tr>
							<th style="width: 15%"><span>数据表</span></th>
							<th style="width: 15%"><span>数据字段</span></th>
							<th style="width: 30%"><span>数据内容</span></th>
							<th style="width: 28%"><span>UNID</span></th>
							<th style="width: 12%"><span>入库日期</span></th>
						</tr>
					</thead>
					<tbody id="tbody_original"></tbody>
				</table>
			</div>
		</div>
	</div>
	
	<div id="div_clean" class="portlet box blue"
		style="margin-left: 6px; margin-right: 6px">
		<div class="portlet-title">
			<div class="caption">
				<i class="fa fa-coffee"></i>数据清洗库查询结果
			</div>
<!-- 			<div class="tools"> -->
<!-- 				<a title="" data-original-title="" href="javascript:;" -->
<!-- 					class="collapse"> </a> <a title="" data-original-title="" -->
<!-- 					href="javascript:;" class="reload"> </a> -->
<!-- 			</div> -->
		</div>
		<div class="portlet-body">
			<div class="table-scrollable">
				<table class="table table-bordered table-hover" id="table_clean">
					<thead>
						<tr>
							<th style="width: 15%"><span>数据表</span></th>
							<th style="width: 15%"><span>数据字段</span></th>
							<th style="width: 30%"><span>数据内容</span></th>
							<th style="width: 28%"><span>UNID</span></th>
							<th style="width: 12%"><span>入库日期</span></th>
						</tr>
					</thead>
					<tbody id="tbody_clean"></tbody>
				</table>
			</div>
		</div>
	</div>

	<div id="div_compare" class="portlet box blue"
		style="margin-left: 6px; margin-right: 6px">
		<div class="portlet-title">
			<div class="caption">
				<i class="fa fa-coffee"></i>数据比对库查询结果
			</div>
<!-- 			<div class="tools"> -->
<!-- 				<a title="" data-original-title="" href="javascript:;" -->
<!-- 					class="collapse"> </a> <a title="" data-original-title="" -->
<!-- 					href="javascript:;" class="reload"> </a> -->
<!-- 			</div> -->
		</div>
		<div class="portlet-body">
			<div class="table-scrollable">
				<table class="table table-bordered table-hover" id="table_compare">
					<thead>
						<tr>
							<th style="width: 15%"><span>数据表</span></th>
							<th style="width: 15%"><span>数据字段</span></th>
							<th style="width: 30%"><span>数据内容</span></th>
							<th style="width: 28%"><span>UNID</span></th>
							<th style="width: 12%"><span>入库日期</span></th>
						</tr>
					</thead>
					<tbody id="tbody_compare"></tbody>
				</table>
			</div>
		</div>
	</div>

	<div id="div_center" class="portlet box blue"
		style="margin-left: 6px; margin-right: 6px">
		<div class="portlet-title">
			<div class="caption">
				<i class="fa fa-coffee"></i>核心库查询结果
			</div>
<!-- 			<div class="tools"> -->
<!-- 				<a title="" data-original-title="" href="javascript:;" -->
<!-- 					class="collapse"> </a> <a title="" data-original-title="" -->
<!-- 					href="javascript:;" class="reload"> </a> -->
<!-- 			</div> -->
		</div>
		<div class="portlet-body">
			<div class="table-scrollable">
				<table class="table table-bordered table-hover" id="table_center">
					<thead>
						<tr>
							<th style="width: 15%"><span>数据表</span></th>
							<th style="width: 15%"><span>数据字段</span></th>
							<th style="width: 30%"><span>数据内容</span></th>
							<th style="width: 28%"><span>UNID</span></th>
							<th style="width: 12%"><span>入库日期</span></th>
						</tr>
					</thead>
					<tbody id="tbody_center"></tbody>
				</table>
			</div>
		</div>
	</div>

</rapid:override>
<rapid:override name="script">
	<script src="${rs}/js/plugins/jqgrid/i18n/grid.locale-cn.js"></script>
	<script src="${rs}/js/plugins/jqgrid/jquery.jqGrid.min.js"></script>
	<script src="${rs}/js/plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="${rs}/js/plugins/layer/layer.js"></script>
	<script type="text/javascript">
		var globalObject = new Object();
		globalObject["defaultValue"] = "请选择";

		globalObject = {
			"list" : "",
			"BMDefaultoption" : "<option  name="+globalObject["defaultValue"]+" title="+globalObject["defaultValue"]+" value="+globalObject["defaultValue"]+">请选择部门</option>",
			"XXSXDefaultoption" : "<option  name="+globalObject["defaultValue"]+" title="+globalObject["defaultValue"]+"  value="+globalObject["defaultValue"]+">请选择信息类别</option>",
			"XXNRDefaultoption" : "<option  name="+globalObject["defaultValue"]+" title="+globalObject["defaultValue"]+" value="+globalObject["defaultValue"]+" >请选择具体信息</option>"
		};

		$(document).ready(function() {
			if (globalObject["defaultValue"] == undefined)
				globalObject["defaultValue"] = "请选择";
			//初始化部门
			$.ajax({
						url : '${ctx}/dept/initDeptList',
						type : "POST",
						data : {},
						dataType : "json"
					}).done(
							function(data, ss) {
								globalObject["list"] = globalObject["BMDefaultoption"];
								for ( var i = 0; i < data.length; i++) {
									globalObject["list"] += "<option  value="+data[i].ID+">"+ data[i].BMMC
											+ "</option>";
								}
								
								$("#BMID").html(globalObject["list"]);
								$("#XXSX").html(globalObject["XXSXDefaultoption"]);
								$("#XXNR").html(globalObject["XXNRDefaultoption"]);
							}).fail(
							function(jqXHR, textStatus,
									errorThrown) {
								layer.msg('数据加载失败，请稍后重试');
							});

			$("#search").bind("click", function() {
				submitCondition();
			});
		});

		//根据部门id加载信息事项
		function initXXSX(obj) {
			//if(globalObject["defaultValue"]==undefined)globalObject["defaultValue"]="10000";
			var BMID = $("#BMID").find("option:selected").val();
			globalObject["list"] = globalObject["XXSXDefaultoption"];
			if (BMID == globalObject["defaultValue"]) {
				$("#XXSX").html(globalObject["list"]);
				$("#XXNR").html(globalObject["XXNRDefaultoption"]);
				return;
			}
			
			$.ajax({
				url : '${ctx}/sjhc/initXXSX',
				type : "POST",
				data : {
					"BMID" : BMID
				},
				dataType : "json"
			}).done(
					function(data, ss) {
						for ( var i = 0; i < data.length; i++) {
							globalObject["list"] += "<option style='width:190px;' name="+data[i].GXMLYWMC+" title="+data[i].GXMLMC+" value="+data[i].ID+">"
									+ data[i].GXMLMC + "</option>";
						}
						$("#XXSX").html(globalObject["list"]);
						$("#XXNR").html(
								globalObject["XXNRDefaultoption"]);
					}).fail(function(jqXHR, textStatus, errirThrown) {
				layer.msg('数据加载失败,请稍后重试');
			});
		}

		//根据信息事项id加载信息内容
		function initXXNR(obj) {
			//if(globalObject["defaultValue"]==undefined)globalObject["defaultValue"]="10000";
		
			var SJBID = $("#XXSX").find("option:selected").val();
		
			globalObject["list"] = globalObject["XXNRDefaultoption"];
			if (SJBID == globalObject["defaultValue"]) {
				$("#XXNR").html(globalObject["list"]);
				return;
			}
			
			$.ajax({
				url : '${ctx}/sjhc/initXXNR',
				type : "POST",
				data : {
					"SJBID" : SJBID
				},
				dataType : "json"
			}).done(function(data, ss) {
						for ( var i = 0; i < data.length; i++) {
							
							globalObject["list"] += "<option style='width:190px;'  name="+data[i].SJXYWMC+"  title="+data[i].SJXZWMC+" value='"+data[i].ID+"'>"
									+ data[i].SJXZWMC + "</option>";
						}
						$("#XXNR").html(globalObject["list"]);
					}).fail(function(jqXHR, textStatus, errirThrown) {
				layer.msg('数据加载失败,请稍后重试');
			});
		}
		
		function isCardID(sId) {
			var aCity = {
				11 : "北京",
				12 : "天津",
				13 : "河北",
				14 : "山西",
				15 : "内蒙古",
				21 : "辽宁",
				22 : "吉林",
				23 : "黑龙江",
				31 : "上海",
				32 : "江苏",
				33 : "浙江",
				34 : "安徽",
				35 : "福建",
				36 : "江西",
				37 : "山东",
				41 : "河南",
				42 : "湖北",
				43 : "湖南",
				44 : "广东",
				45 : "广西",
				46 : "海南",
				50 : "重庆",
				51 : "四川",
				52 : "贵州",
				53 : "云南",
				54 : "西藏",
				61 : "陕西",
				62 : "甘肃",
				63 : "青海",
				64 : "宁夏",
				65 : "新疆",
				71 : "台湾",
				81 : "香港",
				82 : "澳门",
				91 : "国外"
			}
			var iSum = 0;
			var info = "";
			if (!/^\d{17}(\d|x)$/i.test(sId))
				return false;
			sId = sId.replace(/x$/i, "a");
			if (aCity[parseInt(sId.substr(0, 2))] == null)
				return false;
			sBirthday = sId.substr(6, 4) + "-" + Number(sId.substr(10, 2))
					+ "-" + Number(sId.substr(12, 2));
			var d = new Date(sBirthday.replace(/-/g, "/"));
			if (sBirthday != (d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d
					.getDate()))
				return false;
			for ( var i = 17; i >= 0; i--)
				iSum += (Math.pow(2, i) % 11)
						* parseInt(sId.charAt(17 - i), 11);
			if (iSum % 11 != 1)
				return false;
			return true;//aCity[parseInt(sId.substr(0,2))]+","+sBirthday+","+(sId.substr(16,1)%2?"男":"女") 
		}

		function resetResult() {
			$("#sp_dxmc").text(defaultValue);
			$("#sp_zjhm").text(defaultValue);

		}
		function submitCondition() {
			//if(globalObject["defaultValue"]==undefined)globalObject["defaultValue"]="10000";

			var tableName = $("#XXSX").find("option:selected").val();
			var columnName = $("#XXNR").find("option:selected").val();
			var sfzhm = $("#sfzhm").val() + "";
			var UNID = $("#unid").val();
			if (UNID == null || UNID == "") {
				UNID = "0";
			}
			var zjArray = [];
			$("#XXNR option").each(function() {
				var nameItem = ($(this).attr("name"));
				if (nameItem.indexOf("SFZH") >= 0) {
					zjArray.push(nameItem);
				}
			});
				
			if (tableName == globalObject["defaultValue"]) {
				layer.msg("请选择信息类别");
				return;
			}

			if (columnName == globalObject["defaultValue"]) {
				layer.msg("请选择具体信息");
				return;
			}

			if (!isCardID(sfzhm) && UNID == "0") {
				layer.msg("请输入正确的身份证号或UNID号");
				return;
			}
			tableName = $("#XXSX").find("option:selected").attr("name");
			var columnName = $("#XXNR").find("option:selected").attr("name");
			var  bdjz = $("#bdjz").val();
			
			$.ajax({
						url : '${ctx}/sjhc/getInfoByTableAndColumn',
						type : "POST",
						data : {
							"tableName" : tableName,
							"columnName" : columnName,
							"zjArray" : zjArray.toString(),
							"SFZH" : sfzhm,
							"UNID" : UNID
						},
						dataType : "json"
					}).done(
							function(resultData, ss) {

								data = resultData["center"];//核心库数据
								processData = resultData["process"];
								orginalData = resultData["orginal"];
								var resultTableName = $("#XXSX").find(
										"option:selected").text();
								var resultColumnName = $("#XXNR").find(
										"option:selected").text();
								//核心库
								if (data != null && data.length > 0) {
									//	layer.msg(data[0][columnName]);
									$("#sp_dxmc").text(data[0][columnName]);
									$("#sp_zjhm").text(sfzhm);
									$("#table_center tbody").html("");
									for ( var i = 0; i < data.length; i++) {
										var resultContent = data[i][columnName];
										var resultUNID = data[i]["UNID"];
										var resultRKRQ = data[i]["RKRQ"];
										
										var  appendHtml = "<tr><td>" + resultTableName
										+ "</td><td>"+ resultColumnName+ "</td>";
										
										if(bdjz!=null&&bdjz!=""&&bdjz!=resultContent){
											appendHtml+="<td style='color:red'>"+ resultContent+ "</td>";
											
										}else{
											appendHtml+="<td>"+ resultContent+ "</td>";
										}
										appendHtml+="<td>"+ resultUNID+ "</td><td>"+ resultRKRQ+ "</td></tr>";
										$("#tbody_center").append(appendHtml);
									}

								} else if (data == null || data == ""
										|| data.length == 0)
									layer.msg("没有找到相应结果");

								if (processData != null
										&& processData.length > 0) {
									//清洗
									$("#table_clean tbody").html("");
									for ( var i = 0; i < processData.length; i++) {
										var resultContent = processData[i][columnName];
										var resultUNID = processData[i]["UNID"];
										var resultRKRQ = processData[i]["RKRQ"];
										
										var  appendHtml = "<tr><td>" + resultTableName
										+ "</td><td>"+ resultColumnName+ "</td>";
										
										if(bdjz!=null&&bdjz!=""&&bdjz!=resultContent){
											appendHtml+="<td style='color:red'>"+ resultContent+ "</td>";
											
										}else{
											appendHtml+="<td>"+ resultContent+ "</td>";
										}
										appendHtml+="<td>"+ resultUNID+ "</td><td>"+ resultRKRQ+ "</td></tr>";
										
										$("#tbody_clean").append(appendHtml);
									}

									//比对
									$("#table_compare tbody").html("");
									for ( var i = 0; i < processData.length; i++) {
										var resultContent = processData[i][columnName];
										var resultUNID = processData[i]["UNID"];
										var resultRKRQ = processData[i]["RKRQ"];
										
										var  appendHtml = "<tr><td>" + resultTableName
										+ "</td><td>"+ resultColumnName+ "</td>";
										
										if(bdjz!=null&&bdjz!=""&&bdjz!=resultContent){
											appendHtml+="<td style='color:red'>"+ resultContent+ "</td>";
											
										}else{
											appendHtml+="<td>"+ resultContent+ "</td>";
										}
										appendHtml+="<td>"+ resultUNID+ "</td><td>"+ resultRKRQ+ "</td></tr>";
										
										$("#tbody_compare").append(appendHtml);
										
									}
								}
								if (orginalData != null
										&& orginalData.length > 0) {
									//原始
									
									$("#tbody_original").html("");
									for ( var i = 0; i < orginalData.length; i++) {
										var resultContent = orginalData[i][columnName];
										var resultUNID = orginalData[i]["UNID"];
										var resultRKRQ = orginalData[i]["RKRQ"];
										var  appendHtml = "<tr><td>" + resultTableName
										+ "</td><td>"+ resultColumnName+ "</td>";
										
										if(bdjz!=null&&bdjz!=""&&bdjz!=resultContent){
											appendHtml+="<td style='color:red'>"+ resultContent+ "</td>";
											
										}else{
											appendHtml+="<td>"+ resultContent+ "</td>";
										}
										appendHtml+="<td>"+ resultUNID+ "</td><td>"+ resultRKRQ+ "</td></tr>";
										
										$("#tbody_original").append(appendHtml);
									}

								}

							}).fail(function(jqXHR, textStatus, errirThrown) {
						layer.msg('数据加载失败,请稍后重试');
					});
		}
	</script>
</rapid:override>
<%@ include file="../template/base.jsp"%>