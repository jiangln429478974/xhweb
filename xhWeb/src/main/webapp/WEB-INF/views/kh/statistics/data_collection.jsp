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
				<div class="caption">数据采集</div>
				<div class="tools">
<!-- 					<a class="collapse" href="" data-original-title="" title=""> </a> -->
				</div>
			</div>
			<div class="portlet-body form">
				<div class="form-horizontal">
					<div class="wrapper wrapper-content  animated fadeInRight">
						<br />
						<div class="row">
							<div class="col-md-3">
								<span style="margin-left: 12px">提供单位：</span> <select
									id="selectDeparment" onchange="getZyst(this)"
									class="input-control">

								</select>
							</div>
							<div class="col-md-9">
								<span>资源实体：</span> <select id="select_zyst"
									class="input-control" style="width: 60%">
								</select>
							</div>
						</div>
						<br/>
						<div class="row">
							<div class="col-md-3">
								<span style="margin-left: 12px">统计类型：</span>
								 <select id="statis_type" class="input-control" onchange="dateTypeChange(this)">
									<option value="month">月</option>
									<option value="year">年</option>
								</select>
							</div>
							<div class="col-md-6">
								<span>采集时间段：</span> <input style="width: 36%" type="text"
									id="fbsj_start" name="fbsj_start" readonly
									class="input-control"/> -- <input
									style="width: 36%" type="text" id="fbsj_end" name="fbsj_end"
									readonly class="input-control"/>
							</div>
							<div class="col-md-3"></div>
						</div>

						<div class="row">
							<div class="col-md-offset-5 col-md-7" style="margin-top: 12px">
								<button class="btn blue" type="button"
									onClick="submitCondition()">
									<i class="fa fa-search"></i>检索
								</button>
							</div>
						</div>
						<br/>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="main" style="height: 400px;"></div>
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
		function initCharts(xList, yList) {
			var myChart = echarts.init(document.getElementById('main'));
			option = {
				title : {
					text : '数据采集统计表',
				//  subtext: '纯属虚构'
				},
				tooltip : {
					trigger : 'axis'
				},
				legend : {//折现说明
					// data:['最高气温','最低气温']
					data : [ '采集量' ]
				},
				toolbox : {
					show : true,
					feature : {//特点
						mark : {
							show : true
						},
						dataView : {
							show : true,
							readOnly : false
						},
						magicType : {
							show : true,
							type : [ 'line', 'bar' ]
						},
						restore : {
							show : true
						},
						saveAsImage : {
							show : true
						}
					}
				},
				calculable : true,
				xAxis : [ {
					type : 'category',
					boundaryGap : false,
					data : xList
				} ],
				yAxis : [ {
					type : 'value',
					axisLabel : {
						formatter : '{value} '
					}
				} ],
				series : [ {
					name : '采集量',
					type : 'line',
					data : yList,
					/**
					markPoint : {
						data : [ {
							type : 'max',
							name : '最大值'
						}, {
							type : 'min',
							name : '最小值'
						} ]
					},
					markLine : {
						data : [ {
							type : 'average',
							name : '平均值'
						} ]
					}**/
				},
				]
			};
			myChart.setOption(option);
		}

		function getBMList() {
			$.ajax({
				url : '${ctx}/message/findAllBMs/',
				type : "POST",
				data : {},
				dataType : "json"
			}).done(
					function(resultData, ss) {
						var data = resultData["BMList"];
						for ( var i = 0; i < data.length; i++) {
							$("#selectDeparment").append(
									"<option id="+data[i].ID+" value="+data[i].ID+">"
											+ data[i].BMMC + "</option>");
						}
						getZyst(data[0].ID);

					}).fail(function(jqXHR, textStatus, errorThrown) {
				layer.msg('数据获取失败，请稍后重试');
			});
		}

		//根据所选部门 获取对应资源实体列表
		function getZyst(obj) {
			var bmid;
			if (typeof obj == "string")
				bmid = obj;
			else
				bmid = $(obj).find("option:selected").val();
			$("#select_zyst").html("");
			$.ajax({
				url : '${ctx}/statistics/getZyst/',
				type : "POST",
				data : {
					"BMID" : bmid
				},
				dataType : "json"
			}).done(
					function(resultData, ss) {
						var data = resultData["zystList"];
						if (data == null || data == "" || data.length == 0)
							return;
						for ( var i = 0; i < data.length; i++) {
							$("#select_zyst").append(
									"<option id="+data[i].GXMLYWMC+" title="+data[i].GXMLMC+" alue="+data[i].GXMLYWMC+">"
											+ data[i].GXMLMC + "</option>");
						}

					}).fail(function(jqXHR, textStatus, errorThrown) {
				layer.msg('数据获取失败，请稍后重试');
			});
		}

		$(document).ready(function() {
			getBMList();
		
			$("#fbsj_start").focus(function(){
				WdatePicker({dateFmt:'yyyy-MM'});
			});
			$("#fbsj_end").focus(function(){
				WdatePicker({dateFmt:'yyyy-MM'});
			});
			/**
			var xList = new Array();
			var yList = new Array();

			var myDate = new Date(); //获取今天日期
			myDate.setDate(myDate.getDate() - 14);
			//var dateArray = []; 
			var dateTemp;
			var flag = 1;
			var year = myDate.getFullYear();
			for ( var i = 0; i < 14; i++) {
				dateTemp = (myDate.getMonth() + 1) + "-" + myDate.getDate();

				//	dateArray.push(year+dateTemp);
				xList.push(year + dateTemp);
				yList.push(parseInt(300 + 100 * Math.random()));
				myDate.setDate(myDate.getDate() + flag);
			}
			initCharts(xList, yList);
			**/
		});

		function otherThread() {
			hideLoading();
			initCharts();
		}

		function loading() {
			layer.load(4, {
				shade : [ 0.5, '#ccc' ]
			//0.1透明度的白色背景
			});
		}

		function hideLoading() {
			layer.closeAll('loading');
		}
		
		function  dateTypeChange(obj){
			var  dateType = $(obj).find("option:selected").val();
			$("#fbsj_start").val("");
			$("#fbsj_end").val("");
			if(dateType=="month"){
				$("#fbsj_start").unbind("focus");
				$("#fbsj_end").unbind("focus");
				$("#fbsj_start").focus(function(){
					WdatePicker({dateFmt:'yyyy-MM'});
				});
				$("#fbsj_end").focus(function(){
					WdatePicker({dateFmt:'yyyy-MM'});
				});
			}else if(dateType="year"){
				$("#fbsj_start").unbind("focus");
				$("#fbsj_end").unbind("focus");
				$("#fbsj_start").focus(function(){
					WdatePicker({dateFmt:'yyyy'});
				});
				$("#fbsj_end").focus(function(){
					WdatePicker({dateFmt:'yyyy'});
				});
				
			}
		}

		function submitCondition() {
			var selectDeparment = $("#selectDeparment").find("option:selected").val();//选择部门
			var data_type = $("#statis_type").find("option:selected").val();//统计的时间类型
			var collect_type = $("#collect_type").find("option:selected").val();//采集类型
			var start = $("#fbsj_start").val();//开始时间
			var end = $("#fbsj_end").val();//结束时间
			var zyst = $("#select_zyst").find("option:selected").val();//资源实体
		
			if (start == null || start == "") {
				layer.msg("请选择开始时间");
				return;
			}
			if (end == null || end == "") {
				layer.msg("请选择结束时间");
				return;
			}

			if (start > end) {
				layer.msg("结束时间应大于开始时间");
				return;
			}
			if (zyst == null || zyst == "") {
				layer.msg("请选择对应的资源实体");
				return;
			}
			/**
			var xList = new Array();
			var yList = new Array();

			var myDate = new Date(); //获取今天日期
			myDate.setDate(myDate.getDate() - 14);
			//var dateArray = []; 
			var dateTemp;
			var flag = 1;
			var year = myDate.getFullYear();
			for ( var i = 0; i < 14; i++) {
				dateTemp = (myDate.getMonth() + 1) + "-" + myDate.getDate();

				//	dateArray.push(year+dateTemp);
				xList.push(year + dateTemp);
				yList.push(parseInt(300 + 100 * Math.random()));
				myDate.setDate(myDate.getDate() + flag);
			}
			initCharts(xList, yList);
			**/
			loading();
			
			$.ajax({
				url : '${ctx}/statistics/collectByCondition/',
				type : "POST",
				data : {
					"start" : start,
					"end" : end,
					"dateType" : data_type
				},
				dataType : "json"
			}).done(
					function(resultData, ss) {
						hideLoading();
						if (resultData == null || resultData == ""
								|| resultData.length == 0) {
							layer.msg("没有数据");
							return;
						}
						var xList = new Array();
						var yList = new Array();
						for(var i=0;i<resultData.length;i++){
							xList.push(resultData[i]["date"]);
							yList.push(resultData[i]["number"]);
						}

						initCharts(xList, yList);

					}).fail(function(jqXHR, textStatus, errorThrown) {
				hideLoading();
				layer.msg('数据获取失败，请稍后重试');
			});
			//	 setTimeout("otherThread()",5000);  
		}
	</script>

</rapid:override>
<%@ include file="../../template/base.jsp"%>