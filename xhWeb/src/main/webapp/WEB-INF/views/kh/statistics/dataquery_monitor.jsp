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

#ul_key li{
	list-style-type:none;
	float:left;
	margin-right:12px;
	line-height: 24px;
	cursor:pointer
}
.myliselected {
    background: #1C90DB none repeat scroll 0% 0%;
    color: #FFF;
    line-height: 24px;
}
</style>
</rapid:override>
<rapid:override name="content">
	<div class="wrapper">
		<div class="portlet box blue">
			<div class="portlet-title ">
				<div class="caption">数据查询监控</div>
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
								<span style="margin-left: 12px">查询类别：</span> <select
									id="queryType" class="input-control">
									<option>所有类别</option>
									<option>外网类别</option>
									<option>内网类别</option>
									<option>窗口查询</option>
								</select>
							</div>
							<div class="col-md-9">
								<ul id="ul_key">
									<li class="myliselected" id="time_tool_today"   value="1">今日</li>

									<li value="-1">昨日</li>
									<li value="7">最近7日</li>
									<li value="30">最近30日</li>
								</ul>
							</div>
						</div>
						<br />
						<div class="row">
						
							<div class="col-md-3">
								<span style="margin-left: 12px">日期类型：</span> 
								<select onchange="dateTypeChange(this)" id="dateType" 
										class="input-control">
									<option value="month">月</option>
									<option value="year">年</option>
								</select>
							</div>
							<div class="col-md-6">
								<span style="margin-left: 12px">监控时间段：</span> <input
									style="width: 24%" type="text" id="fbsj_start"
									name="fbsj_start" readonly class="input-control" /> -- <input
									style="width: 24%" type="text" id="fbsj_end" name="fbsj_end"
									class="input-control" readonly />
							</div>
							<div class="col-md-3"></div>
						</div>
						<br />
						
						<div class="row">
							<div class=" col-md-offset-5 col-md-7">
								<button style="margin-left: 12px" class="btn blue" type="button"
									onClick="submitCondition()">
									<i class="fa fa-search"></i>检索
								</button>
							</div>
						</div>
						<br />
						<div  class="row">
							<div  class="col-md-12"><a href="${ctx}/statistics/platformapplication_query/">平台应用查询情况</a></div>
						</div>
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
		function submitCondition() {
			var queryType = $("#queryType").find("option:selected").val();
			var dateType = $("#dateType").find("option:selected").val();
			var start = $("#fbsj_start").val();
			var end = $("#fbsj_end").val();
			if (start == null || start == "") {
				layer.msg("请选择开始时间");
				return;
			}
			if (end == null || end == "") {
				layer.msg("请选择结束时间");
				return;
			}
			if (start>end) {
				layer.msg("结束时间应大于开始时间");
				return;
			}
			loading();
			$.ajax({
				url : '${ctx}/statistics/queryMonitorByCondition/',
				type : "POST",
				data : {
					"start" : start,
					"end" : end,
					"dateType" : dateType
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
						
						var data = resultData["dataList"];
						
						var xList = new Array();
						var yList = new Array();
						for(var i=0;i<data.length;i++){
							xList.push(data[i]["date"]);
							yList.push(data[i]["number"]);
						}
						
						initCharts("",xList, yList);

					}).fail(function(jqXHR, textStatus, errorThrown) {
				hideLoading();
				layer.msg('数据获取失败，请稍后重试');
			});
			// setTimeout("otherThread()",5000);  
		}

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

		function initCharts(dayValue,xList, yList) {
			var myChart = echarts.init(document.getElementById('main'));
			option = {
				title : {
					text : dayValue+'数据查询监控图',
				//  subtext: '纯属虚构'
				},
				tooltip : {
					trigger : 'axis'
				},
				legend : {//折现说明
					// data:['最高气温','最低气温']
					data : [ '数据查询次数' ]
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
					/**
					data : ['2015-01','2015-02','2015-03','2015-04','2015-05','2015-06','2015-07',
					        '2015-08','2015-09','2015-10']
					 **/
					data : xList
				} ],
				yAxis : [ {
					type : 'value',
					axisLabel : {
						formatter : '{value} 次'
					}
				} ],
				series : [ {
					name : '数据查询次数',
					type : 'line',
					/**
					data:[11, 11, 15, 13, 12, 13, 10,
					      11, 11, 15],
					 **/
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
					}
					**/
					
				}, ]
			};
			myChart.setOption(option);
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

		$(document).ready(function() {
			$("#fbsj_start").focus(function(){
				WdatePicker({dateFmt:'yyyy-MM'});
			});
			$("#fbsj_end").focus(function(){
				WdatePicker({dateFmt:'yyyy-MM'});
			});
			var dateValue="1";
			loading();
			$.ajax({
				url : '${ctx}/statistics/queryMonitorByCondition/',
				type : "POST",
				data : {
					"dateType":dateValue
				},
				dataType : "json"
			}).done(
					function(resultData, ss) {
						
						if (resultData == null || resultData == "") {
							hideLoading();
							layer.msg("没有数据");
							return;
						}
						
						var data = resultData["dataList"];
						if (data == null || data == "") {
							hideLoading();
							layer.msg("没有数据");
							return;
						}
						
						var xList = new Array();
						var yList = new Array();

						for(var i=0;i<data.length;i++){
							xList.push(data[i]["date"]);
							yList.push(data[i]["number"]);
						}
						
						if(dateValue=="1")
							initCharts("今日",xList, yList);
						else if(dateValue=="-1")
							initCharts("昨日",xList, yList);
						else if(dateValue=="7")
							initCharts("最近七天",xList, yList);
						else if(dateValue=="30")
							initCharts("最近30天",xList, yList);
						hideLoading();
					}).fail(function(jqXHR, textStatus, errorThrown) {
						hideLoading();
						layer.msg('数据获取失败，请稍后重试');
			});
			
			
			$("#ul_key  li").bind("click",function(){
				$("#ul_key  li").removeClass();
				$(this).addClass("myliselected");
				var  dateValue = $(this).val();
				
				loading();
				$.ajax({
					url : '${ctx}/statistics/queryMonitorByCondition/',
					type : "POST",
					data : {
						"dateType":dateValue
					},
					dataType : "json"
				}).done(
						function(resultData, ss) {
							var data = resultData["dataList"];
							
							if (data == null || data == "") {
								hideLoading();
								layer.msg("没有数据");
								return;
							}
							var xList = new Array();
							var yList = new Array();

							for(var i=0;i<data.length;i++){
								xList.push(data[i]["date"]);
								yList.push(data[i]["number"]);
							}
							
							if(dateValue=="1")
								initCharts("今日",xList, yList);
							else if(dateValue=="-1")
								initCharts("昨日",xList, yList);
							else if(dateValue=="7")
								initCharts("最近七天",xList, yList);
							else if(dateValue=="30")
								initCharts("最近30天",xList, yList);
							hideLoading();
						}).fail(function(jqXHR, textStatus, errorThrown) {
							hideLoading();
							layer.msg('数据获取失败，请稍后重试');
				});
			
			});
		});
	</script>

</rapid:override>
<%@ include file="../../template/base.jsp"%>