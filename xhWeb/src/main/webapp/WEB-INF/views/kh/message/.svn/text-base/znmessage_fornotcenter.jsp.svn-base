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
	<!-- <link href="${rs}/css/bootstrap.min.css" rel="stylesheet"> -->
	<style>
/* Additional style to fix warning dialog position */
#alertmod_table_list_2 {
	top: 900px !important;
}

.bodyclass {
	background: #555;
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
				<div class="caption">站内消息</div>
				<div class="tools">
<!-- 					<a class="collapse" href="" data-original-title="" title=""> </a> -->
				</div>
			</div>
			<div class="portlet-body form">
				<div class="form-horizontal">
					<div class="wrapper wrapper-content  animated fadeInRight">
						<br/>
						<div class="row">
							<div class="col-md-3" style="display: block">
							 <select id="selectjob" class="input-control"style="margin-left: 30px; width: 50%" onchange="changejob()">
									<option value="byreceive">我的接收</option>
									<option value="bysend">我的发送</option>
								
								</select>
							</div>
							<div class="col-md-4" style="display: block">
								<span style="margin-left: 6px" id="sp_introduce">发送部门 :</span> <select
									id="bm-select" class="input-control"
									style="margin-left: 12px; width: 50%">
								</select>
							</div>
								<div class="col-md-4">
								<span style="margin-left: 6px">消息标题：</span> <input type="text"
									placeholder="请输入关键字" style="width: 50%" id="input_xxbt" class="input-control" />
							</div>
							
						</div>
						<br />
						<div class="row">
							<div class="col-md-7">
									<span style="margin-left: 24px">发送时间:</span> <input
										style="width: 35%;" type="text" id="fbsj_start"
										name="fbsj_start" readonly class="input-control"
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" /> -- <input
										style="width: 35%" type="text" id="fbsj_end" name="fbsj_end"
										class="input-control" readonly
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
							</div>
						</div>
						<br/>		
						<div class="row">
						 	<div class="col-md-offset-4 col-md-1">
								<span>
									<button type="button" id="btn_search" class="btn blue"
										style="margin-left: 6px; height: 34px; text-align: center"
										onClick="doSearch()"><i class="fa fa-search"></i>&nbsp;检索</button>
								</span>
							</div>
							
<!-- 							<div class="col-md-1" style="margin-left: 6px"> -->
<!-- 								<span> -->
<!-- 									<button type="button" class="btn btn-primary" id="btn_add"> -->
<!-- 										<i class="fa fa-plus"></i>&nbsp;新增 -->
<!-- 									</button> -->
<!-- 								</span> -->
<!-- 							</div> -->
						</div>	
						<br/>	
					</div>
				</div>
			
			</div>
		</div>
	</div>
	
	<div style="width:auto;height:auto;margin-top:15px;margin-bottom: 10px;">
            <button class="btn btn-primary btn-sm " type="button" id="btn-add"><i class="fa fa-plus"></i>&nbsp;新增</button>
      </div>   

	<div id="div_all" style="margin-top: 12px"></div>
	<div class="jqGrid_wrapper"
		style="margin-top: 6px; margin-left: 6px; margin-right: 6px;">
		<table id="znMessageJqgrid"></table>
		<div id="pager_list"></div>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header" style="background-color:#428BCA">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h4 class="modal-title" id="myModalLabel" style="color:#FFFFFF">消息通知详情</h4>
							</div>
							<div class="modal-body">
								<div class="container">
									<div class="row">
										<span class="col-md-1">消息标题：</span> <span class="col-md-11"
											id="detail_bt"></span>
									</div>
									<br />
									
									<div class="row">
										<span class="col-md-1">发送部门：</span> <span class="col-md-2"
											id="detail_fsbm"></span>
										<span class="col-md-1">发送人：</span> <span class="col-md-3"
											id="detail_fsr"></span>
									</div>
									<br />
									<div class="row">
									<span class="col-md-1">接收部门：</span> <span class="col-md-2"
										id="detail_jsbm"></span>
										
									<span class="col-md-1">接收人：</span> <span class="col-md-3"
										id="detail_jsr"></span>
								</div>
								 <br />
								<div class="row">
									<span class="col-md-1">消息类型：</span> <span class="col-md-11"
										id="detail_xxlx"></span>
								</div>
								<br />
								<div class="row" id="div_dxzt" style="display:none">
									<div>
										<span class="col-md-1">短信状态：</span> <span class="col-md-11"
											id="detail_dxzt"></span>
									</div>
									<br/>
								</div>
								<div class="row">
									<span class="col-md-1">发送时间：</span> <span class="col-md-11"
										id="detail_fssj"></span>
								</div>
								<br />
								
							</div>
							<div style="margin-left: 12px">
								<span>内容：</span>
								<div
									style="width: 90%; height: 250px; overflow: auto; background-color: #E6E6E6">
									<span id="detail_content" class="spanstyle"></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
</rapid:override>
<rapid:override name="script">
<%--     <script src="${rs}/js/jquery-2.1.1.min.js"></script> --%>
	<script src="${rs}/js/plugins/jqgrid/i18n/grid.locale-cn.js"></script>
	<script src="${rs}/js/plugins/jqgrid/jquery.jqGrid.min.js"></script>
	<script src="${rs}/js/plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="${rs}/js/plugins/layer/layer.js"></script>
<%-- 	<script src="${rs}/js/bootstrap.min.js"></script> --%>

	<script>
		
		var  globalObj = new Object();
		globalObj = {
				"willDeleteMessage":[]
		};
		
		//控制弹出页面
		function setModal() {
			$('#myModal').modal({
				backdrop : 'static',
				keyboard : false
			});
		}
		
		function checkItem(obj) {
			var itemList = document.getElementsByName("checkItem");
			var index = 0;
			var messageId = $(obj).val();
			if ($(obj).is(":checked")) {
				globalObj["willDeleteMessage"].push(messageId);
				for ( var i = 0; i < itemList.length; i++) {
					if (itemList[i].checked == true) {
						index++;
					} else {
						break;
					}
				}
				if (index == itemList.length) {
					$("#checkbox_all").prop("checked", true);
				}
			} else {
				$("#checkbox_all").prop("checked", false);
				for(var i=0;i<globalObj["willDeleteMessage"].length;i++){
					if(globalObj["willDeleteMessage"][i]==messageId){
						globalObj["willDeleteMessage"].splice(i,1);						
						break;
					}
				}
			}
		}
		//全选按钮
		function checkAll(obj) {
			var itemList = document.getElementsByName("checkItem");
			for ( var i = 0; i < itemList.length; i++) {
				itemList[i].checked = obj.checked;
			}
			if ($(obj).is(':checked')) {
				
			}
		}
		
		function  changejob(){
			var  jobValue = $("#selectjob").find("option:selected").val();
			if(jobValue=="bysend"){
				$("#sp_introduce").text("接收部门");
			}else if(jobValue=="byreceive"){
				$("#sp_introduce").text("发送部门");
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
						$("#bm-select").append("<option id='all' value='all'>所有部门</option>");
						for ( var i = 0; i < data.length; i++) {
							$("#bm-select").append(
									"<option id='"+data[i].ID+"' value='"+data[i].ID+"'>"
											+ data[i].BMMC + "</option>");
						}
						//$("#bm-select").attr("disabled","disabled");
						var myDate = new Date(); //获取今天日期
						var  year = myDate.getFullYear();
						var month = myDate.getMonth()+1;
						var day = myDate.getDate();
						month = month/10<1?"0"+month:month;
						day =  day/10<1?"0"+day:day;
						var start = "2015-12-01 01:00:00";
						var  end = year+"-"+month+"-"+day+" "+"23:00:00";
					
						initJqgrid(data[0].BMID,start,end);
					}).fail(function(jqXHR, textStatus, errorThrown) {
				layer.msg('数据获取失败，请稍后重试');
			});
		}
		
		function  deleteAll(){
			if(globalObj["willDeleteMessage"].length==0){
				layer.msg("请选择删除项");
				return;
			}
			layer.confirm('是否删除选中项？', {
				btn : [ '确定', '取消' ],
				shade : false
			}, function() {
				layer.msg("正在执行");
				
				$.ajax({
				     url: '${ctx}/message/deleteZnMessage/',
				     type: "POST",
				     data: {
				    	 "deleteIDS":globalObj["willDeleteMessage"].toString()+",0"
				     },
				     dataType: "json"
				 }).done(function(data,ss) {
					 layer.msg('数据删除成功');
					 $("#tzMessageJqgrid").trigger("reloadGrid");
				 }).fail(function(jqXHR, textStatus, errorThrown){
					 layer.msg('数据删除失败，请稍后重试');
				 }	 
				 );
				 
			}, function() {

			});
		}

		function doSearch() {
			var start = $("#fbsj_start").val();
			var end = $("#fbsj_end").val();
			var XXBT = $("#input_xxbt").val()+"";
			var action = null;
			var pageSize = 10;
			var JSBMID=null;
			var FSBMID=null;
			var  jobValue = $("#selectjob").find("option:selected").val();
			
			if(jobValue=="bysend"){
				JSBMID = ""+$("#bm-select").find("option:selected").val();
				action = "send";
			}else if(jobValue=="byreceive"){
				FSBMID = ""+$("#bm-select").find("option:selected").val();
				action = "receive";
			}
			if (start == null || start == "") {
				start = "2015-12-01 01:00:00";
			}
			
			if (end == null || end == "") {
				var myDate = new Date(); //获取今天日期
				var  year = myDate.getFullYear();
				var month = myDate.getMonth()+1;
				var day = myDate.getDate();
				month = month/10<1?"0"+month:month;
				day =  day/10<1?"0"+day:day;
				end = year+"-"+month+"-"+day+" "+"23:00:00";
			}

			$("#znMessageJqgrid").GridUnload();
			$("#znMessageJqgrid").jqGrid({
				url : '${ctx}/message/getZnMessageByConditionFornotcenter/',
				postData:{
					"JSBMID":JSBMID,
					"FSBMID":FSBMID,
					"start":start,
					"end":end,
					"XXBT":XXBT,
					"action":action
				},
				
				datatype : "json",
				height : 'auto',
				autowidth : true,
				//shrinkToFit: true,
				//multiselect:true,//全选功能
				rowNum : pageSize,
				rowList : [ 10, 20, 50 ],
				colNames : ['接收人','发送人','消息内容','消息类型','时间', '操作' ],
				colModel : [
							{
								name : 'JSR',
								index : 'JSR',
								align : 'center'
							},
							{
								name : 'FSR',
								index : 'FSR',
								align : 'center'
							},
					
						{
							name : 'MBNR',
							index : 'MBNR',
							align : 'center'
						},
						{
							name : 'XXLX',
							index : 'XXLX',
							align : 'center',
							formatter : function(cellvalue,
									options, rowObject) {
								if(cellvalue=="1"){
									return "短信";
								}
								else if(cellvalue=="2"){
									return "站内消息";
								}else if(cellvalue=="3"){
									return "短信 | 站内消息";
								}
							}
						},
						{
							name : 'FSSJ',
							index : 'FSSJ',
							align : 'center'
						},
						{
							name : 'ID',
							align : 'center',
							formatter : function(cellvalue,
									options, rowObject) {
								return '<button id='+cellvalue+' class="btn btn-xs yellow" data-toggle="modal" data-target="#myModal" onclick="viewData(this);">查看</button>';
										//+ '<button class="btn btn-xs red" style="margin-left:4px" onclick="deleteData(this);">删除</button>'
								//'<BUTTON onclick="insertData(\''+cellvalue+'\');">新增</BUTTON>';
							}
						} ],
				pager : "#pager_list",
				//viewrecords: true,
				caption : "站内信息列表",
				//add: true,
				//edit: true,
				//addtext: 'Add',
				//edittext: 'Edit',
				hidegrid : false
			}).trigger("reloadGrid");
			
		$(window).bind('resize', function() {
			var width = $('.jqGrid_wrapper').width();
			$('#znMessageJqgrid').setGridWidth(width);
		});
		}
		
		function initJqgrid(BMID,start,end) {
			
			$("#znMessageJqgrid").jqGrid({
				url : '${ctx}/message/getZnMessageListFornotcenter',
				datatype : "json",
				height : 'auto',
				postData:{
					"BMID":BMID,
					"start":start,
					"end":end
				},
				autowidth : true,
				//shrinkToFit: true,
				//multiselect:true,//全选功能
				rowNum : 10,
				rowList : [ 10, 20, 50 ],
				colNames : ['发送人', '消息内容','消息类型','时间', '操作' ],
				colModel : [
						{
							name : 'FSR',
							index : 'FSR',
							align : 'center'
						},
						
						{
							name : 'MBNR',
							index : 'MBNR',
							align : 'center'
						},
						{
							name : 'XXLX',
							index : 'XXLX',
							align : 'center',
							formatter : function(cellvalue,
									options, rowObject) {
								if(cellvalue=="1"){
									return "短信";
								}
								else if(cellvalue=="2"){
									return "站内消息";
								}else if(cellvalue=="3"){
									return "短信 | 站内消息";
								}
							}
						},
						
						{
							name : 'FSSJ',
							index : 'FSSJ',
							align : 'center'
						},

						{
							name : 'ID',
							align : 'center',
							formatter : function(cellvalue,
									options, rowObject) {
								return '<button id='+cellvalue+' class="btn btn-xs yellow" data-toggle="modal" data-target="#myModal" onclick="viewData(this);">查看</button>';
										//+ '<button class="btn btn-xs red" style="margin-left:4px" onclick="deleteData(this);">删除</button>'
								//'<BUTTON onclick="insertData(\''+cellvalue+'\');">新增</BUTTON>';
							}
						} ],
				pager : "#pager_list",
				//viewrecords: true,
				caption : "站内信息列表",
				//add: true,
				//edit: true,
				//addtext: 'Add',
				//edittext: 'Edit',
				hidegrid : false
			}).trigger("reloadGrid");
			
		$(window).bind('resize', function() {
			var width = $('.jqGrid_wrapper').width();
			$('#znMessageJqgrid').setGridWidth(width);
		});
		}

		function viewData(obj) {
			var  id = $(obj).attr("id");
			$.ajax({
				url : '${ctx}/message/getOneZnMessage/',
				type : "POST",
				data : {
					"ID":id
				},
				dataType : "json"
			}).done(function(data, ss) {
				setModal();
				
				$("#detail_bt").text(data[0].XXBT);
				$("#detail_fssj").text(data[0].FSSJ);
				$("#detail_fsbm").text(data[0].FSBMMC);
				$("#detail_fsr").text(data[0].FSR);
					
				$("#detail_jsbm").text(data[0].JSBMMC);
				$("#detail_jsr").text(data[0].JSR);
				
				$("#detail_content").text(data[0].MBNR);
				var  xxlx = data[0].XXLX;
				if(xxlx=="1"){
					$("#detail_xxlx").text("短信");
					$("#div_dxzt").show();
					var  zt = data[0].ZT;
					if(zt=="1"){
						$("#detail_dxzt").text("待发送");
					}else if(zt=="2"){
						$("#detail_dxzt").text("发送成功");
					}else if(zt=="3"){
						$("#detail_dxzt").text("发送失败");
					}
				}else if(xxlx=="2"){
					$("#detail_xxlx").text("站内消息");
					$("#div_dxzt").hide();
				}else if(xxlx=="3"){
					$("#detail_xxlx").text("短信 | 站内消息");
					$("#div_dxzt").show();
					var  zt = data[0].ZT;
					if(zt=="1"){
						$("#detail_dxzt").text("待发送");
					}else if(zt=="2"){
						$("#detail_dxzt").text("发送成功");
					}else if(zt=="3"){
						$("#detail_dxzt").text("发送失败");
					}
				}
				
			}).fail(function(jqXHR, textStatus, errorThrown) {
				layer.msg('数据获取失败，请稍后重试');
			});
		}

		function deleteData(obj) {
			layer.confirm('是否删除？', {
				btn : [ '确定', '取消' ],
				shade : false
			}, function() {
				/**
				$.ajax({
				     url: '${ctx}/message/deleteTzMessage/'+ID,
				     type: "POST",
				     data: {},
				     dataType: "json"
				 }).done(function(data,ss) {
					 layer.msg('数据删除成功');
					 $("#tzMessageJqgrid").trigger("reloadGrid");
				 }).fail(function(jqXHR, textStatus, errorThrown){
					 layer.msg('数据删除失败，请稍后重试');
				 }	 
				 );
				 **/
			}, function() {

			});
		}

		$(document).ready(function(){
		//	$("#div_all").html("<input type='checkbox' id='checkbox_all' onclick='checkAll(this)'  style='margin-left:30px'>"
		//									+ "<button  type='button' class='btn btn-primary' onclick='deleteAll()' style='background-color:#F36A5A;width:60px;margin-left:12px'>删除</button>");
				$('#btn_add').click(function() {
				//alert('跳转页面');
				window.location = "${ctx}/message/toAddTzmessageFornotcenter";
			});
				getBMList();
				$("#pager_list").click(function() {
					//alert('change');
					$('#checkbox_all').prop('checked', false);
				});
				$("#bm-select").change(function() {
					//alert($("#bm-select").find("option:selected").text());
				});
			});
	</script>


</rapid:override>
<c:if test='${sessionScope.loginname!="hzh_fgw" }'>
<%@ include file="../../template/base.jsp"  %>
</c:if>
<c:if test='${sessionScope.loginname=="hzh_fgw" }'>
<%@ include file="../../template/basenomenu.jsp"  %>
</c:if> 