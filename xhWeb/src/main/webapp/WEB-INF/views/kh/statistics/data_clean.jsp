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
				<div class="caption">数据清洗</div>
				<div class="tools">
<!-- 					<a class="collapse" href="" data-original-title="" title=""> </a> -->
				</div>
			</div>
			<div class="portlet-body form">
				<div class="form-horizontal">
					<div class="wrapper wrapper-content  animated fadeInRight">
						<br />
						<div class="row">
							<div class="col-md-4">
								<span style="margin-left: 12px">提供单位：</span> <select
									id="sel_dep" class="input-control">
								</select>
							</div>

							<div class="col-md-4">
								<span>图表类型：</span> <select id="selectChartType"
									class="input-control">
									<option value="line">折线图</option>
									<option value="pie">饼图</option>
								</select>
							</div>
							<div class="col-md-4"></div>
						</div>
						<br />
						<div class="row">
							<div class="col-md-4">
								<span style="margin-left: 12px">统计类型：</span> <select
									id="selectStatisType" onchange="dateTypeChange(this)"
									class="input-control">
									<option value="month">月</option>
									<option value="year">年</option>
								</select>
							</div>
							<div class="col-md-6">
								<span>清洗时间段：</span> <input style="width: 28%" type="text"
									id="fbsj_start" name="fbsj_start" readonly
									class="input-control" /> -- <input style="width: 28%"
									type="text" id="fbsj_end" name="fbsj_end" readonly
									class="input-control" />
							</div>
							<div class="col-md-2"></div>
						</div>
						<br />
						<div class="row">
							<div class="col-md-offset-5 col-md-7">
								<button class="btn blue" onclick="commitCondition()"
									type="button">
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
	<div id="main" style="height: 400px; width: 80%"></div>
</rapid:override>
<rapid:override name="script">

	<script src="${rs}/js/plugins/jqgrid/i18n/grid.locale-cn.js"></script>
	<script src="${rs}/js/plugins/jqgrid/jquery.jqGrid.min.js"></script>
	<script src="${rs}/js/plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="${rs}/js/plugins/layer/layer.js"></script>
	<script src="${ctx}/resources/scripts/My97DatePicker/WdatePicker.js"></script>
	<script src="${ctx}/resources/dist/echarts-all.js"></script>
	<script src="${rs}/js/plugins/validate/messages_zh.min.js"></script>
	<script type="text/javascript">
		var globalObject = {};
		globalObject.PIECHART = {
			'normal' : 15,
			'abnormal' : 2,
			'sum' : 17
		};
		globalObject.LINECHART = {
			"yListNormal" : [ 12, 2 ],
			"yListAbnormal" : [ 12, 2 ],
			"xList" : []
		};

		//饼状统计图
		function initPieCharts() {
			var myChart = echarts.init(document.getElementById('main'));
			option = {
				title : {
					text : '数据清洗',
					subtext : '',
					x : 'center'
				},
				tooltip : {
					trigger : 'item',
					formatter : "{a} <br/>{b} : {c} ({d}%)"
				},
				legend : {
					orient : 'vertical',
					x : 'left',
					data : [ '正常数据量', '异常数据量', '数据总量' ]
				},
				toolbox : {
					show : true,
					feature : {
						mark : {
							show : true
						},
						dataView : {
							show : true,
							readOnly : false
						},
						magicType : {
							show : true,
							type : [ 'pie', 'funnel' ],
							option : {
								funnel : {
									x : '25%',
									width : '50%',
									funnelAlign : 'left',
									max : 1548
								}
							}
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
				series : [ {
					name : '访问来源',
					type : 'pie',
					radius : '55%',
					center : [ '50%', '60%' ],
					data : [ {
						value : globalObject.PIECHART['normal'],
						name : '正常数据量'
					}, {
						value : globalObject.PIECHART['abnormal'],
						name : '异常数据量'
					}, {
						value : globalObject.PIECHART['sum'],
						name : '数据总量'
					} ]
				} ]
			};
			myChart.setOption(option);
		}

		//折现统计图
		function initLineCharts(xList, yList, yFailList) {
			var myChart = echarts.init(document.getElementById('main'));
			option = {
				title : {
					text : '数据清洗',
					subtext : ''
				},
				tooltip : {
					trigger : 'axis'
				},
				legend : {
					data : [ '结果正常总量', '结果异常总量' ]
				},
				toolbox : {
					show : true,
					feature : {
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
						formatter : '{value}'
					}
				} ],
				series : [ {
					name : '结果正常总量',
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
				}, {
					name : '结果异常总量',
					type : 'line',
					data : yFailList,
					/**
					markPoint : {
					data : [{name : '周最低', value : -2, xAxis: 1, yAxis: -1.5}
					]
					},
					**/
					markLine : {
						data : [ {
							type : 'average',
							name : '平均值'
						} ]
					}
				} ]
			};

			myChart.setOption(option);
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
		function commitCondition() {
			
			var deparment = $("#sel_dep").find("option:selected").val();
			var dateType = $("#selectStatisType").find("option:selected")
					.val(); //日期类型
			var chartType = $("#selectChartType").find("option:selected")
					.val(); //统计图类型

			var begin = $("#fbsj_start").val();
			var end = $("#fbsj_end").val();

			if (begin == null || begin == '') {
				layer.msg("请选择起始时间");
				return;
			}

			if (end == null || end == '') {
				layer.msg("请选择结束时间时间");
				return;
			}

			if (begin > end) {
				layer.msg('结束时间应大于起始时间');
				return;
			}
			
			if (chartType == 'pie') {
				loading();
				$.ajax({
					url : '${ctx}/statistics/dataCleanByCondition/',
					type : "POST",
					data : {
						'start' : begin,
						'end' : end,
						"BMID" : deparment,
						"dateType" : dateType,
						"chartType" : chartType
					},
					dataType : "json"
				}).done(function(resultData, ss) {
					//alert(resultData);
					hideLoading();
					if(resultData==null||resultData==""){
						layer.msg("没有数据");
						return;
					}
					var successData =  
						resultData["successList"][0]==null?0:resultData["successList"][0]["TOTAL"];
					var failData = 
						resultData["failList"][0]==null?0:resultData["failList"][0]["TOTAL"];
					globalObject.PIECHART['normal'] = successData;
					globalObject.PIECHART['abnormal'] = failData;
					globalObject.PIECHART['sum'] = globalObject.PIECHART['normal']
							+ globalObject.PIECHART['abnormal'];
					//alert(globalObject.PIECHART['normal']);
					initPieCharts();

				}).fail(function(jqXHR, textStatus, errorThrown) {
					layer.msg('数据获取失败，请稍后重试');
				});
			
			} else {//折现图
				loading();
				$.ajax({
					url : '${ctx}/statistics/dataCleanByCondition/',
					type : "POST",
					data : {
						'start' : begin,
						'end' : end,
						"BMID" : deparment,
						"dateType" : dateType,
						"chartType" : chartType
					},
					dataType : "json"

				}).done(function(resultData, ss) {
					//alert(resultData);
						hideLoading();
						var successData = resultData["successList"];
						var failData = resultData["failList"];
						var successList = new Array();
						var failList = new Array();
						var xList = new Array();
						for ( var i = 0; i < successData.length; i++) {
							xList.push(successData[i]["date"]);
							successList.push(successData[i]["number"]);
						}
						for(var i=0;i<failData.length;i++){
							failList.push(failData[i]["number"]);
						}
						initLineCharts(xList, successList, failList);

				}).fail(function(jqXHR, textStatus, errorThrown) {
					layer.msg('数据获取失败，请稍后重试');
				});
			}
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
							$("#sel_dep").append(
									"<option id=" + data[i].ID + " value=" + data[i].ID + ">"
											+ data[i].BMMC + "</option>");
						}

					}).fail(function(jqXHR, textStatus, errorThrown) {
				layer.msg('数据获取失败，请稍后重试');
			});
		}

		function dateTypeChange(obj) {
			var dateType = $(obj).find("option:selected").val();
			$("#fbsj_start").val("");
			$("#fbsj_end").val("");
			if (dateType == "month") {
				$("#fbsj_start").unbind("focus");
				$("#fbsj_end").unbind("focus");
				
				$("#fbsj_start").focus(function() {
					WdatePicker({
						dateFmt : 'yyyy-MM'
					});
				});
				$("#fbsj_end").focus(function() {
					WdatePicker({
						dateFmt : 'yyyy-MM'
					});
				});
			} else if (dateType = "year") {
				$("#fbsj_start").unbind("focus");
				$("#fbsj_end").unbind("focus");
				
				$("#fbsj_start").focus(function() {
					WdatePicker({
						dateFmt : 'yyyy'
					});
				});
				$("#fbsj_end").focus(function() {
					WdatePicker({
						dateFmt : 'yyyy'
					});
				});
			}
		}
		$(document).ready(function() {
			$("#fbsj_start").focus(function() {
				WdatePicker({
					dateFmt : 'yyyy-MM'
				});
			});
			$("#fbsj_end").focus(function() {
				WdatePicker({
					dateFmt : 'yyyy-MM'
				});
			});
			getBMList();
			var xList = new Array();
			var yList = new Array();
			var yFailList = new Array();
			var myDate = new Date(); //获取今天日期
			myDate.setDate(myDate.getDate() - 14);
			var dateTemp;
			var flag = 1;
			var year = myDate.getFullYear();
			for ( var i = 0; i < 14; i++) {
				dateTemp = (myDate.getMonth() + 1) + "-" + myDate.getDate();
				xList.push(year + dateTemp);
				yList.push(parseInt(1000 + 3000 * Math.random()));
				yFailList.push(parseInt(500 + 500 * Math.random()));
				myDate.setDate(myDate.getDate() + flag);
			}

			initLineCharts(xList, yList, yFailList);
		});

		</script>

		</rapid:override>
	<%@ include file="../../template/base.jsp"%>