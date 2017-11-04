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
	
	<!-- Data Tables -->
<%-- 	<link href="${rs}/css/jqgrid_demo40/themes/redmond/jquery-ui-1.8.2.custom.css" rel="stylesheet"> --%>
<%-- 	<link href="${rs}/css/jqgrid_demo40/js/src/css/ui.jqgrid.css" rel="stylesheet" type="text/css" /> --%>
	<%-- <link href="${rs}/css/plugins/jQueryUI/jquery-ui-1.11.4.custom/jquery-ui.min.css" rel="stylesheet"> --%>
	    <link href="${rs}/css/plugins/jQueryUI/jquery-ui-1.10.4.custom.min.css" rel="stylesheet">
	 <link href="${rs}/css/plugins/jqgrid/ui.jqgrid.css" rel="stylesheet">
<%--     <link href="${rs}/js/plugins/layer/skin/layer.css" rel="stylesheet"> --%>
	
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
			<div class="portlet-body form" style="display:none;">
				<div class="form-horizontal">
					<div class="wrapper wrapper-content  animated fadeInRight">
						<br/>
						<div class="row" style="display:none">
							<div class="col-md-12" id="bumen">
								<a href="javascript:;" class="btn green" id="mine" style="margin-left:12px; margin-bottom:10px;" onClick="mineclick(this)">我的</a>
								<a href="javascript:;" class="btn blue" id="allbm" style="margin-left:12px; margin-bottom:10px;" onClick="bmclick(this)">部门</a>
							</div>
						</div>
						<br />
						<div  id="mychoiceArea">
										<div class="row">
							<div class="col-md-2"  >
							 <select id="mychoiceselectjob" class="input-control"style="margin-left: 12px; width: 50%" onchange="mychoicechangejob()">
									<option value="byreceive">我的接收</option>
									<option value="bysend">我的发送</option>
								</select>
							</div>
							<div class="col-md-4" style="display: none">
								<span style="margin-left: 6px" id="mychoicesp_introduce">发送部门 :</span> <select
									id="mychoicebm-select" class="input-control"
									style="margin-left: 12px; width: 50%">
								</select>
							</div>
							<div class="col-md-3">
								<span style="margin-left: 6px">消息内容：</span> <input type="text"
									placeholder="请输入关键字" style="width: 50%" id="input_xxbt" class="input-control" />
							</div>
							<div class="col-md-6">
									<span style="margin-left: 12px">发送时间:</span> <input
										style="width: 35%;" type="text" id="mychoicefbsj_start"
										name="fbsj_start" readonly class="input-control"
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" /> -- <input
										style="width: 35%" type="text" id="mychoicefbsj_end" name="fbsj_end"
										class="input-control" readonly
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
							</div>
						</div>
						<br />
						<div class="row">
							<!-- <div class="col-md-7">
									<span style="margin-left: 12px">发送时间:</span> <input
										style="width: 35%;" type="text" id="mychoicefbsj_start"
										name="fbsj_start" readonly class="input-control"
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" /> -- <input
										style="width: 35%" type="text" id="mychoicefbsj_end" name="fbsj_end"
										class="input-control" readonly
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
							</div> -->
						</div>
						<br/>		
						<div class="row">
						 	<div class="col-md-offset-4 col-md-1">
								<span>
									<button type="button" id="btn_search" class="btn blue"
										style="margin-left: 6px; height: 34px; text-align: center"
										onClick="minedoSearch()"><i class="fa fa-search"></i>&nbsp;检索</button>
								</span>
							</div>
							
<!-- 								<div class="col-md-1" style="margin-left: 6px"> -->
<!-- 									<span> -->
<!-- 										<button type="button" class="btn btn-primary" id="btn_add"> -->
<!-- 											<i class="fa fa-plus"></i>&nbsp;新增 -->
<!-- 										</button> -->
<!-- 									</span> -->
<!-- 								</div> -->
							</div>	
						</div>
						
						<div  id="bmchoiceArea" style="display:none">
									<div class="row">
									<div class="col-md-2" style="margin-left:12px">
										<select class="input-control" id="bmchoiceselectjob" onchange="bmchoicechangejob()">
											<option  value="bysend">按发送部门搜索</option>
											<option value="byreceive">按接收部门搜索</option>
										</select>
									</div>
									<div class="col-md-4" style="display: block">
										<span style="margin-left: 6px;"   id="bmchoicesp_introduce">发送部门 :</span> 
										<select
											id="bmchoicebm-select" class="input-control"
											style="margin-left: 2px; width: 50%">
										</select>
									</div>
									
									<div class="col-md-5">
										<span>发送时间:</span> <input
											style="width: 34%;" type="text" id="bmchoicefbsj_start"
											name="fbsj_start" readonly class="input-control"
											onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" /> -- <input
											style="width: 34%" type="text" id="bmchoicefbsj_end" name="fbsj_end"
											class="input-control" readonly
											onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
									</div>
								</div>
								<br />
								
								<div class="row">
								 	<div class="col-md-offset-4 col-md-1">
										<span>
											<button type="button" id="btn_search" class="btn blue"
												style="margin-left: 6px; height: 34px; text-align: center"
												onClick="centerdoSearch()"><i class="fa fa-search"></i>检索</button>
										</span>
									</div>
<!-- 									<div class="col-md-1" style="margin-left: 6px"> -->
<!-- 										<span> -->
<!-- 											<button type="button" class="btn btn-primary" id="bmchoicebtn_add"> -->
<!-- 												<i class="fa fa-plus"></i>&nbsp;新增 -->
<!-- 											</button> -->
<!-- 										</span> -->
<!-- 									</div> -->
								</div>
						</div>
						<br/>	
					</div>
				</div>
				<!-- 
			     <button class="btn btn-primary btn-small" style="margin-top:12px" data-toggle="modal" data-target="#myModal">
					开始演示模态框
				</button>
				-->
			</div>
		</div>
	</div>

	<div id="div_all" style="margin-top: 12px"></div>
	
		<div style="width:auto;height:auto;margin-top:15px;margin-bottom: 10px;" id="qx">
           
             <button type="button" class="btn btn-primary" id="btn_add"> 
											<i class="fa fa-plus"></i>&nbsp;发送站内消息
										</button>
      </div>   
   
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
								<button type="button" class="close" onclick="closeRefresh()" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h4 class="modal-title" id="myModalLabel" style="color:#FFFFFF">站内通知详情</h4>
							</div>
							<div class="modal-body">
								<table class="table table-bordered">
   
											   <thead>
											      <!-- <tr id="tr_1">
											         <th style="width:20%" colspan="4"><div style="width: 100px; height: 45px; ">消息标题：<span  id="detail_bt"></span><br></div></th>												 
											      </tr>-->
											      <tr id="tr_2">
											         <th style="width:20%" colspan="4"><div style="width: 550px; height: 30px; ">消息标题：<span  id="detail_bt"></span><br></div></th>												 
											      </tr> 
											   </thead>
											   <tbody>
											      <tr>
											         <td style="width:20%"><div style="width: 100px; height: 30px;"><b>发送部门：</div></b></td>
											             <td style="width:30%"><div style="width: 100px; height: 30px;"><span id="detail_fsbm"></span><br></div></td>
											         <td style="width:20%"><b><div style="width: 100px; height: 30px;">发送人：</div></b></td>
													    <td style="width:30%"><span  id="detail_fsr"></span></td>
											      </tr>
											      <tr>
											         <td><b><div style="width: 100px; height: 30px;">接收部门：</div></b></td>
											        	 <td><div><span  id="detail_jsbm"></span></div></td>
											         <td><b><div style="width: 100px; height: 30px;">接收人：</div></b></td>
													  	 <td><span  id="detail_jsr"></span></td>
											      </tr>
											      <tr>
											         <td><b><div style="width: 100px; height: 30px">消息类型：</div></b></td>
											         <td><span  id="detail_xxlx"></span></td>													  
													  <td><div style="width: 100px; height: 30px"><b>发送时间：</b></div></td> 
											         <td><div><span  id="detail_fssj"></span></div></td>
											      </tr>
												    <tr>
													 <td  colspan="4" style="height: 110px;"><b>内容：</b><span id="detail_content" class="spanstyle"></td> 
													 
											      </tr>
												    <!-- <tr>
											         <td colspan="4" style="height: 110px;">内容：<span id="detail_content" class="spanstyle"></td> 
											        
													 
											      </tr> -->
												   
											   </tbody>
											</table>
						</div>
					</div>
				</div>
			</div>
</rapid:override>
<rapid:override name="script">
<%-- 	<script src="${rs}/js/jquery-2.1.1.min.js"></script> --%>
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
		
		function  mineclick(obj){
			 $("#bumen a").removeClass();
			$("#bumen a").addClass("btn blue");
			$(obj).removeClass();
			$(obj).addClass("btn green");
			$("#bmchoiceArea").hide("slow",function(){
				$("#mychoiceArea").show("slow");
			});
		} 
		
		function  bmclick(obj){
			 $("#bumen a").removeClass();
			$("#bumen a").addClass("btn blue");
			$(obj).removeClass();
			$(obj).addClass("btn green");
			$("#mychoiceArea").hide("slow",function(){
				$("#bmchoiceArea").show("slow");
			});
		} 
		
		
		function  mychoicechangejob(){
			var  jobValue = $("#mychoiceselectjob").find("option:selected").val();
			//alert(jobValue);
			if(jobValue=="bysend"){
				$("#mychoicesp_introduce").text("接收部门");
			}else if(jobValue=="byreceive"){
				$("#mychoicesp_introduce").text("发送部门");
				
			}
		}
		
		function  bmchoicechangejob(){
			var  jobValue = $("#bmchoiceselectjob").find("option:selected").val();
			//alert(jobValue);
			if(jobValue=="bysend"){
				$("#bmchoicesp_introduce").text("发送部门");
			}else if(jobValue=="byreceive"){
				$("#bmchoicesp_introduce").text("接收部门");
				
			}
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
				 var obj = $("#znMessageJqgrid").jqGrid("getRowData");
				 $(obj).each(function(){
					 var  messageID = this.ID.split('\"')[1];
					 globalObj["willDeleteMessage"].push(messageID);
				   });
					    	
			}else{
				globalObj["willDeleteMessage"]=[];
			}
		}
		
		function minedoSearch() {
			var start = $("#mychoicefbsj_start").val();
			var end = $("#mychoicefbsj_end").val();
			var XXBT = $("#input_xxbt").val()+"";
			var action = null;
			var pageSize = 10;
			var JSBMID=null;
			var FSBMID=null;
			var  jobValue = $("#mychoiceselectjob").find("option:selected").val();
			
			if(jobValue=="bysend"){
				FSBMID = ""+$("#mychoicebm-select").find("option:selected").val();
				action = "send";
			}else if(jobValue=="byreceive"){
				JSBMID = ""+$("#mychoicebm-select").find("option:selected").val();
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
				mtype:"POST",
				datatype : "json",
				height : 'auto',
				autowidth : true,
				//shrinkToFit: true,
				//multiselect:true,//全选功能
				rowNum : pageSize,
				rowList : [ 10, 20, 50 ],
				colNames : ['发送人','消息内容','消息类型','查看状态','时间', '操作'],
				//'发送人','消息内容','消息类型','查看状态','时间', '操作' 
				//'接收人','发送人','消息内容','消息类型','时间', '操作' 
				colModel : [
				        	/* {
							name : 'JSR',
							index : 'JSR',
							align : 'center'
						}, */
						   {
								name : 'FSR',
								index : 'FSR',
								align : 'center',width:'15%',
							},
							{
								name : 'MBNR',
								index : 'MBNR',
								align : 'center',width:'85%',
							},
							
							{
								name : 'XXLX',
								index : 'XXLX',
								align : 'center',width:'15%',
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
							{name: 'CKZT',index: 'CKZT',align:'center',width:'15%',formatter:function(cellvalue, options, rowObject){
				            	if(cellvalue=='1'){
				            		return '已查看';
				            	  }
				            		return '<span style="color:red;">未查看</span>';
				            	}
				            },
							{
								name : 'FSSJ',
								index : 'FSSJ',
								align : 'center',width:'35%',
							},

							{
								name : 'ID',
								align : 'center',width:'20%',
								formatter : function(cellvalue,
										options, rowObject) {
									return '<button id='+cellvalue+' class="btn btn-xs blue" data-toggle="modal" data-target="#myModal" onclick="viewData(this);">查看</button>';
									
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
		function centerdoSearch() {
			var start = $("#bmchoicefbsj_start").val();
			var end = $("#bmchoicefbsj_end").val();
			var pageSize = 10;
			var JSBMID=null;
			var FSBMID=null;
			var  jobValue = $("#bmchoiceselectjob").find("option:selected").val();
			//alert(jobValue);
			if(jobValue=="bysend"){
				FSBMID = ""+$("#bmchoicebm-select").find("option:selected").val();
			}else if(jobValue=="byreceive"){
				JSBMID = ""+$("#bmchoicebm-select").find("option:selected").val();
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
				url : '${ctx}/message/getZnMessageByCondition/',
				postData:{
					"JSBMID":JSBMID,
					"FSBMID":FSBMID,
					"start":start,
					"end":end
				},
				datatype : "json",
				height : 'auto',
				autowidth : true,
				//shrinkToFit: true,
				//multiselect:true,//全选功能
				rowNum : pageSize,
				rowList : [ 10, 20, 50 ],
				colNames : ['接收人','发送人','消息内容','消息类型','时间', '操作' ],
				//'发送人','消息内容','消息类型','查看状态','时间', '操作' 
				colModel : [
						{
							name : 'JSR',
							index : 'JSR',
							align : 'center',
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
								return '<button id='+cellvalue+' class="btn btn-xs blue" data-toggle="modal" data-target="#myModal" onclick="viewData(this);">查看</button>';
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
		
		function getBMList() {
			$.ajax({
				url : '${ctx}/message/findAllBMs/',
				type : "POST",
				data : {},
				dataType : "json"
			}).done(
					function(resultData, ss) {
						var data = resultData["BMList"];
						$("#mychoicebm-select").append("<option id='all' value='all'>所有部门</option>");
						
						for ( var i = 0; i < data.length; i++) {
							$("#bmchoicebm-select").append(
									"<option id='"+data[i].ID+"' value='"+data[i].ID+"'>"
											+ data[i].BMMC + "</option>");
							
							$("#mychoicebm-select").append(
									"<option id='"+data[i].ID+"' value='"+data[i].ID+"'>"
											+ data[i].BMMC + "</option>");
						}

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
					 $("#znMessageJqgrid").GridUnload();
					 $("#checkbox_all").prop("checked", false);
					 initJqgrid(10);
					 
				 }).fail(function(jqXHR, textStatus, errorThrown){
					 layer.msg('数据删除失败，请稍后重试');
				 }	 
				 );
				 
			}, function() {

			});
		}

		function initJqgrid(pageSize) { 
				var start = "2015-12-01 01:00:00"; 			 
				var myDate = new Date(); //获取今天日期
				var  year = myDate.getFullYear();
				var month = myDate.getMonth()+1;
				var day = myDate.getDate();
				month = month/10<1?"0"+month:month;
				day =  day/10<1?"0"+day:day;
				end = year+"-"+month+"-"+day+" "+"23:00:00"; 
			$("#znMessageJqgrid").jqGrid({
				
				
				//	url : '${ctx}/message/getZnMessageListFornotcenter',
					url : '${ctx}/message/getZnMessageByConditionFornotcenter',
					postData:{
						"JSBMID":"all",
						"FSBMID":"all",
						"start":start,
						"end":end,
						"action":"receive"
					},
					datatype : "json",
					height : 'auto',
					autowidth : true,
					//shrinkToFit: true,
					//multiselect:true,//全选功能
					rowNum : pageSize,
					rowList : [ 10, 20, 50 ],
					colNames : ['发送人','消息内容','消息类型','查看状态','时间', '操作' ],
					colModel : [
				
							 {
								name : 'FSR',
								index : 'FSR',
								align : 'center',width:'15%',
							},
							{
								name : 'MBNR',
								index : 'MBNR',
								align : 'center',width:'85%',
							},
							
							{
								name : 'XXLX',
								index : 'XXLX',
								align : 'center',width:'15%',
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
							{name: 'CKZT',index: 'CKZT',align:'center',width:'15%',formatter:function(cellvalue, options, rowObject){
				            	if(cellvalue=='1'){
				            		return '已查看';
				            	  }
				            		return '<span style="color:red;">未查看</span>';
				            	}
				            },
							{
								name : 'FSSJ',
								index : 'FSSJ',
								align : 'center',width:'35%',
							},

							{
								name : 'ID',
								align : 'center',width:'20%',
								formatter : function(cellvalue,
										options, rowObject) {
									return '<button id='+cellvalue+' class="btn btn-xs blue" data-toggle="modal" data-target="#myModal" onclick="viewData(this);">查看</button>';
									
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
					if(data[0].XXBT==null){
						 $("#tr_"+2).hide(); 	
					}
					$("#detail_bt").text(data[0].XXBT);
					$("#detail_fssj").text(data[0].FSSJ);
					$("#detail_fsbm").text(data[0].FSBMMC);
					$("#detail_fsr").text(data[0].FSR);
					
					$("#detail_jsbm").text(data[0].JSBMMC);
					$("#detail_jsr").text(data[0].JSR);
					
					$("#detail_content").html(data[0].MBNR);
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
					if(data[0].XXBT!=null){
						 $("#tr_"+2).show(); 	
					}
					
				
			}).fail(function(jqXHR, textStatus, errorThrown) {
				layer.msg('数据获取失败，请稍后重试');
			});
		}
		
		
		
		
		/* function closeRefresh(obj) {
			opener.location.reload();
			
		} */
		
		
		$('#znMessageJqgrid').getGridParam('page');
		
		function closeRefresh(url) {
			var page = $('#znMessageJqgrid').getGridParam('page'); 
			var rows = $('#znMessageJqgrid').getGridParam('rows'); 
			var sidx = $('#znMessageJqgrid').getGridParam('sidx'); 
			var sord = $('#znMessageJqgrid').getGridParam('sord'); 
			jQuery("#znMessageJqgrid").jqGrid('setGridParam', {
				url : url,
				page:page,
				rows:rows,
				sidx:sidx,
				sord:sord
			}).trigger("reloadGrid");
		}
		
		
		

		function deleteData(obj) {
			layer.confirm('是否删除？', {
				btn : [ '确定', '取消' ],
				shade : false
			}, function() {
			
				$.ajax({
				     url: '${ctx}/message/deleteZnMessage?deleteIDS'+ID,
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
				 
			}, function() {

			});
		}

		$(document).ready(function(){

			$('#btn_add').click(function() {
				//alert('跳转页面');
				window.location = "${ctx}/message/toAddTzmessage";
			});
			
			$('#bmchoicebtn_add').click(function() {
				//alert('跳转页面');
				window.location = "${ctx}/message/toAddTzmessage";
			});
			
			//$("#div_all").html("<input type='checkbox' id='checkbox_all' onclick='checkAll(this)'  style='margin-left:30px;margin-right:10px'>"
			//								+ "<button  type='button' class='btn red'  onclick='deleteAll()'><i class='fa fa-times-circle'></i>&nbsp;删除</button>");
				initJqgrid(10);
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