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
				<div class="caption">统计分析图表</div>
				<div class="tools">
<!-- 					<a class="collapse" href="" data-original-title="" title=""> </a> -->
				</div>
			</div>
			<div class="portlet-body form">
				<div class="form-horizontal">
					<div class="wrapper wrapper-content  animated fadeInRight">
						<div class="row" style="margin-left: 12px">
						<br/>
							<div class="wrapper-content">
								<div class="row">
									<div class="col-md-3">
										<span>时间维度：</span>
										 <select id="sel_timeFrame" class="input-control" onchange="dateTypeChange(this)">
											<!--  <option value="day">日报</option>-->
											<option value="month">月报</option>
											<!--<option value="quarter">季报</option>-->
											<option value="year">年报</option>
										</select>
									</div>
									
									<div class="col-md-6">
										<span>统计时间段：</span> <input style="width: 36%" type="text"
											id="fbsj_start" name="fbsj_start" readonly class="input-control"/> --
										<input style="width: 36%" type="text" id="fbsj_end"
											name="fbsj_end" readonly class="input-control"/>
									</div>
									<div class="col-md-3"></div>
								</div>
								<br/>
								<div class="row">
									<div class="col-md-offset-5 col-md-7">
										<button class="btn blue" onclick="commitCondition()"
											type="button"><i class="fa fa-search"></i>检索</button>
									</div>
								</div>	
								<br/>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<br></br>
	<br></br>
	<div id="main" style="height: 400px; width: 80%"></div>
</rapid:override>
<rapid:override name="script">
	<!--<script src="${rs}/js/jquery-2.1.1.min.js"></script>   -->
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
			'dataVolume' : 15,
			'queryVolume' : 4,
			'directVolume' : 25
		};

		function initPieCharts() {
			var myChart = echarts.init(document.getElementById('main'));
			option = {
				title : {
					text : '统计分析图表',
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
					data : [ '数据量', '查询量', '目录量' ]
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
					name : '',
					type : 'pie',
					radius : '55%',
					center : [ '50%', '60%' ],
					data : [ {
						value : globalObject.PIECHART['dataVolume'],
						name : '数据量'
					}, {
						value : globalObject.PIECHART['queryVolume'],
						name : '查询量'
					}, {
						value : globalObject.PIECHART['directVolume'],
						name : '目录量'
					} ]
				} ]
			};
			myChart.setOption(option);
		}
		
		//统计分析图标 之折线图  ： 数据量  查询量  目录量
		function initLineCharts(xList,dataList, queryList, directoryList) {
			var myChart = echarts.init(document.getElementById('main'));
			option = {
				title : {
					text : '数据统计分析图表',
					subtext : ''
				},
				tooltip : {
					trigger : 'axis'
				},
				legend : {
					data : [ '数据量', '查询量', '目录量' ]
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
						formatter : '{value} '
					}
				} ],
				series : [ {
					name : '数据量',
					type : 'line',
					data : dataList,
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
				}, {
					name : '查询量',
					type : 'line',
					data : queryList,
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
				}, {
					name : '目录量',
					type : 'line',
					data : directoryList,
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

		
		function dateTypeChange(obj) {
			var dateType = $(obj).find("option:selected").val();
			$("#fbsj_start").val("");
			$("#fbsj_end").val("");
			if(dateType == "day"){
				$("#fbsj_start").unbind("focus");
				$("#fbsj_end").unbind("focus");
				
				$("#fbsj_start").focus(function() {
					WdatePicker({
						dateFmt : 'yyyy-MM-dd'
					});
				});
				$("#fbsj_end").focus(function() {
					WdatePicker({
						dateFmt : 'yyyy-MM-dd'
					});
				});
				
			}else  if (dateType == "month") {
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
			}else if (dateType = "quarter") {
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
			else if (dateType = "year") {
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
		
		function commitCondition() {
			var dateType = $("#sel_timeFrame").find("option:selected")
					.val();
			var start = $("#fbsj_start").val();
			var end = $("#fbsj_end").val();
			
			if (start == null || start == '') {
				layer.msg("请选择起始时间");
				return;
			}
			
			if (end == null || end == '') {
				layer.msg("请选择结束时间时间");
				return;
			}
			
			if (start>end) {
				layer.msg('结束时间应大于起始时间');
				return;
			}
			
			loading();
			$.ajax({
				url : '${ctx}/statistics/dataAnalyseByCondition/',
				type : "POST",
				data : {
					'start' : start,
					'end' : end,
					"dateType" : dateType
				},
				dataType : "json"

			}).done(function(resultData, ss) {
				//alert(resultData);
					hideLoading();
					if(resultData==null||resultData==""){
						layer.msg("没有数据");
						return;
					}
					var xList = new Array();
					var  dataList = new Array();
					var  directoryList = new Array();
					var  queryList = new Array();
				//	alert(resultData["resultTjDataList"].length);
					var  resultTjDataList = resultData["resultTjDataList"];//数据量
					var  resultTjDirectoryList = resultData["resultTjDirectoryList"];//目录量
					var  resultTjQueryList = resultData["resultTjQueryList"];//查询量
				
					for(var i=0;i<resultTjDataList.length;i++){
						xList.push(resultTjDataList[i]["date"]);
						dataList.push(resultTjDataList[i]["number"]);
						directoryList.push(resultTjDirectoryList[i]["number"]);
						queryList.push(resultTjQueryList[i]["number"]);
					}
					initLineCharts(xList,dataList, queryList, directoryList);

			}).fail(function(jqXHR, textStatus, errorThrown) {
				hideLoading();
				layer.msg('数据获取失败，请稍后重试');
			});
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
			
			//initPieCharts();
			var xList = new Array();
			var  dataList = new Array();
			var  directoryList = new Array();
			var  queryList = new Array();
			
			
			var myDate = new Date(); //获取今天日期
			myDate.setDate(myDate.getDate() - 14);
			//var dateArray = []; 
			var dateTemp; 
			var flag = 1;
			var  year = myDate.getFullYear();
			for (var i = 0; i < 14; i++) {
				dateTemp = (myDate.getMonth()+1)+"-"+myDate.getDate();
				
			//	dateArray.push(year+dateTemp);
				xList.push(year+dateTemp);
				dataList.push(parseInt(2000+2000*Math.random()));
				queryList.push(parseInt(1000+1000*Math.random()));
				directoryList.push(parseInt(500+500*Math.random()));
				myDate.setDate(myDate.getDate() + flag);
			}
			
			initLineCharts(xList,dataList, queryList, directoryList);
			
		});
	</script>

</rapid:override>
<%@ include file="../../template/base.jsp"%>