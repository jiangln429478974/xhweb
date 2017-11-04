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
			<div class="portlet-title">
				<div class="caption">用户登录监控</div>
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
								<span style="margin-left: 12px">用户类型：</span> <select
									id="selectUserType" class="input-control">
									<option>普通用户</option>
									<option>CA用户</option>
									<option>管理员</option>
								</select>
							</div>

							<div class="col-md-9">
								<ul id="ul_key">
									<li class="myliselected" id="time_tool_today"  value="1">今日</li>

									<li value="-1">昨日</li>
									<li value="7">最近7日</li>
									<li value="30">最近30日</li>
								</ul>
							</div>
						</div>
						<br/>
						<div class="row">
							<div class="col-md-3">
								<span style="margin-left: 12px">日期类型：</span> 
								<select onchange="dateTypeChange(this)"
									id="selectStatisType" class="input-control" style="width: 36%">
									<option value="month">月</option>
									<option value="year">年</option>
								</select>
							</div>
							<div class="col-md-6">
								<span style="margin-left: 12px">时&nbsp; 间 &nbsp;段：</span> <input
									style="width: 26%" type="text" id="fbsj_start"
									name="fbsj_start" readonly class="input-control"/> -- <input
									style="width: 26%" type="text" id="fbsj_end"
									class="input-control" name="fbsj_end" readonly
									class="input-control"/>
							</div>
						</div>
						<br />
						<div class="row">
							<div class=" col-md-offset-5 col-md-7">
								<button class="btn blue" id="bt_search" type="button"
									style="margin-left: 12px" onClick="submitCondition()">
									<i class="fa fa-search"></i>检索
								</button>
							</div>
						</div>
						<br />
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="main" style="height: 300px; width: 96%; margin-top: 30px"></div>
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
			var selectUserType = $("#selectUserType").find("option:selected")
					.val();
			var selectStatisType = $("#selectStatisType").find(
					"option:selected").val();

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
			if (start >end) {
				layer.msg("结束时间应大于开始时间");
				return;
			}
			loading();
			$.ajax({
				url : '${ctx}/statistics/getUserLoginLogListByCondition/',
				type : "POST",
				data : {
					"dateValue" : selectStatisType,
					"start" : start,
					"end" : end
				},
				dataType : "json"
			}).done(function(resultData, ss) {
						hideLoading();
						var dataList = resultData["dataList"];
						if (dataList == null || dataList == "") {
							hideLoading();
							layer.msg("没有数据");
							return;
						}
						var xList = new Array();
						var yList = new Array();
						
						for(var i=0;i<dataList.length;i++){
						
							xList.push(dataList[i]["date"]);
							yList.push(dataList[i]["number"]);
						}
						
						initCharts("",xList, yList);
						
					}).fail(function(jqXHR, textStatus, errorThrown) {
						hideLoading();
						layer.msg('数据获取失败，请稍后重试');
			});
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

		function initCharts(day,xList, yList) {

			var myChart = echarts.init(document.getElementById('main'));
			option = {
				title : {
					text : day+'用户登录情况',
					subtext : ''
				},
				tooltip : {
					trigger : 'axis'
				},
				legend : {//折现说明
					// data:['最高气温','最低气温']
					data : [ '用户登录次数' ]
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
						formatter : '{value} 次'
					}
				} ],
				series : [ {
					name : '用户登录次数',
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
		//初始化登录信息
		$(document).ready(function() {
			$("#fbsj_start").focus(function(){
				WdatePicker({dateFmt:'yyyy-MM'});
			});
			$("#fbsj_end").focus(function(){
				WdatePicker({dateFmt:'yyyy-MM'});
			});
			
			loading();
			//获取今天的登录记录
			var dateValue = "1";
			$.ajax({
				url : '${ctx}/statistics/getUserLoginLogListByCondition/',
				type : "POST",
				data : {
					"dateValue":dateValue
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
							xList.push(data[i]["dateHour"]);
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
			//日期切换
			$("#ul_key  li").bind("click",function(){
				$("#ul_key  li").removeClass();
				$(this).addClass("myliselected");
				var  dateValue = $(this).val();
				loading();
				$.ajax({
					url : '${ctx}/statistics/getUserLoginLogListByCondition/',
					type : "POST",
					data : {
						"dateValue":dateValue
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
								xList.push(data[i]["dateHour"]);
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