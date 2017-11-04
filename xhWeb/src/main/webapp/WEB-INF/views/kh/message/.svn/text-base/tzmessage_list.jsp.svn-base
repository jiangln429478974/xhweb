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

.spanstyle {
	word-break: normal;
	width: auto;
	display: block;
	white-space: pre-wrap;
	word-wrap: break-word;
	overflow: hidden
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
				<div class="caption">短信消息列表</div>
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
								<span style="margin-left: 12px">接收部门:</span> <select
									id="select_dept" class="input-control" style="width: 60%">
								</select>
							</div>
							<div class="col-md-8">
								<span style="margin-left: 6px">发送时间:</span> <input
									style="width: 30%" type="text" id="fbsj_start"
									class="input-control" name="fbsj_start" readonly
									onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" /> -- <input
									style="width: 30%" type="text" id="fbsj_end"
									class="input-control" name="fbsj_end" readonly
									onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
							</div>
						</div>
						<br />
						<div class="row">
							<div class="col-md-offset-4 col-md-1">
							<span>
								<button id="btn_search" class="btn blue" type="button"
									onClick="findByCondition()">
									<i class="fa fa-search"></i>检索
								</button>
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

					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header" style="background-color:#428BCA">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true" style="color:#FFFFFF">×</button>
									<h4 class="modal-title" id="myModalLabel" style="color:#FFFFFF">消息通知详情</h4>
								</div>
								<div class="modal-body">
									<div class="container">
										<div>
											<span class="col-md-1">消息标题：</span> <span class="col-md-11"
												id="detail_bt"></span>
										</div>
										<br /> <br />
										<div>
										<span class="col-md-1">发送部门：</span> <span class="col-md-11"
											id="detail_fsbm"></span>
										</div>
										<br /> <br />
										<div>
											<span class="col-md-1">发送人：</span> <span class="col-md-11"
												id="detail_fsr"></span>
										</div>
										<br /> <br />
										<div>
											<span class="col-md-1">状态：</span> <span class="col-md-11"
												id="detail_status">已发送</span>
										</div>
										<br /> <br />
										<div>
										<span class="col-md-1">发送时间：</span> <span class="col-md-11"
											id="detail_fssj"></span>
										</div>
										<br /> <br />
										<div>
											<span class="col-md-1">接收部门：</span> <span class="col-md-11"
												id="detail_jsbm"></span>
										</div>
										<br /> <br />
										<div>
											<span class="col-md-1">接收人：</span> <span class="col-md-11"
												id="detail_jsr"></span>
										</div>
										<br /> <br />
										<div>
											<span class="col-md-1">手机号：</span> <span class="col-md-11"
												id="detail_mobile">18967783421</span>
										</div>
										<br/> <br/>
									</div>
									<div style="margin-left: 28px">
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
				</div>
			</div>
		</div>
	</div>
	<div style="width:auto;height:auto;margin-top:15px;margin-bottom: 10px;">
            <button type="button" class="btn btn-primary btn-sm"  id="btn_add"><i class="fa fa-plus"></i>&nbsp;新增</button>
      </div>
      
	<div class="jqGrid_wrapper"
		style="margin-left: 6px; margin-right: 6px; margin-bottom: 6px">
		<table id="tzMessageJqgrid"></table>
		<div id="pager_list"></div>
	</div>

</rapid:override>
<rapid:override name="script">
	<script src="${rs}/js/plugins/jqgrid/i18n/grid.locale-cn.js"></script>
	<script src="${rs}/js/plugins/jqgrid/jquery.jqGrid.min.js"></script>
	<script src="${rs}/js/plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="${rs}/js/plugins/layer/layer.js"></script>
	<!-- <script src="${rs}/js/jquery-2.1.1.min.js"></script>  -->
	<script>
		function findByCondition() {
			var bmid = $("#select_dept").find("option:selected").val();
			var start = $("#fbsj_start").val();
			var end = $("#fbsj_end").val();
			if (bmid == null || bmid == "") {
				layer.msg("请选择部门");
				return;
			}

			if (start == null || start == "") {
				layer.msg("请选择开始时间");
				return;
			}

			if (end == null || end == "") {
				layer.msg("请选择结束时间");
				return;
			}
			if (start >= end) {
				layer.msg("结束时间应大于开始时间");
				return;
			}

			$("#tzMessageJqgrid").GridUnload();
			$("#tzMessageJqgrid").jqGrid(
							{
								url : '${ctx}/message/getTzMessageListByCondition?BMID='+ bmid + "&start="
										+ start
										+ "&end="
										+ end,
								datatype : "json",
								height : 'auto',
								autowidth : true,
								//shrinkToFit: true,
								//multiselect:true,//全选功能
								rowNum : 10,
								rowList : [ 10, 20, 50 ],
								colNames : [ '接收人', "所在部门", '短信内容', '发送时间',
										'操作' ],
								colModel : [
										{
											name : 'JSR',
											index : 'JSR',
											align : 'center'
										},
										{
											name : 'BMMC',
											index : 'BMMC',
											align : 'center'
										},
										{
											name : 'MBNR',
											index : 'MBNR',
											align : 'center'
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
												return '<div><button class="btn btn-xs yellow" class="btn-xs green" value='
														+ rowObject['ID']
														+ ' onclick="updateData(this);" data-toggle="modal" data-target="#myModal">查看</button>'
														+ '<input  type="hidden"  value='+rowObject.FSSJ+'>'
														+ '</div>';
												//'<BUTTON onclick="deleteData(\''+cellvalue+'\');">删除</BUTTON>';
												//'<BUTTON onclick="insertData(\''+cellvalue+'\');">新增</BUTTON>'+
											}
										} ],
								pager : "#pager_list",
								viewrecords : true,
								caption : "短息消息",
								//add: true,
								//edit: true,
								//addtext: 'Add',
								//edittext: 'Edit',
								hidegrid : false
							});

			$(window).bind('resize', function() {
				var width = $('.jqGrid_wrapper').width();
				$('#tzMessageJqgrid').setGridWidth(width);
			});

		}
		function getGrid(bm, startTime, endTime) {
			$("#tzMessageJqgrid")
					.jqGrid(
							{
								url : '${ctx}/message/getTzMessageList',
								datatype : "json",
								height : 'auto',
								autowidth : true,
								//shrinkToFit: true,
								//multiselect:true,//全选功能
								rowNum : 10,
								rowList : [ 10, 20, 50 ],
								colNames : [ '接收人', "所在部门", '短信内容', '发送时间',
										'操作' ],
								colModel : [
										{
											name : 'JSR',
											index : 'JSR',
											align : 'center'
										},
										{
											name : 'BMMC',
											index : 'BMMC',
											align : 'center'
										},
										{
											name : 'MBNR',
											index : 'MBNR',
											align : 'center'
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
												return '<div><button class="btn btn-xs yellow"  value='
														+ rowObject['ID']
														+ ' onclick="updateData(this);" data-toggle="modal" data-target="#myModal">查看</button>'
														+ '<input  type="hidden"  value='+rowObject.FSSJ+'>'
														+ '</div>';
												//'<BUTTON onclick="deleteData(\''+cellvalue+'\');">删除</BUTTON>';
												//'<BUTTON onclick="insertData(\''+cellvalue+'\');">新增</BUTTON>'+
											}
										} ],
								pager : "#pager_list",
								viewrecords : true,
								caption : "短息消息",
								//add: true,
								//edit: true,
								//addtext: 'Add',
								//edittext: 'Edit',
								hidegrid : false
							});

			$(window).bind('resize', function() {
				var width = $('.jqGrid_wrapper').width();
				$('#tzMessageJqgrid').setGridWidth(width);
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
						for ( var i = 0; i < data.length; i++) {
							$("#select_dept").append(
									"<option id='"+data[i].ID+"' value='"+data[i].ID+"'>"
											+ data[i].BMMC + "</option>");
						}
					}).fail(function(jqXHR, textStatus, errorThrown) {
				layer.msg('数据获取失败，请稍后重试');
			});
		}

		$(document).ready(function() {

			$('#btn_add').click(function() {
				//alert('跳转页面');
				window.location = "${ctx}/message/toAddTzmessage";
			});
			getBMList();
			getGrid();

			$("body").keydown(function(event) {
				if (event.keyCode == "13") {//keyCode=13是回车键
					findByCondition();
				}
			});

		});

		function deleteData(ID) {

			layer.confirm('是否删除？', {
				btn : [ '确定', '取消' ],
				shade : false
			}, function() {
				$.ajax({
					url : '${ctx}/message/deleteTzMessage/' + ID,
					type : "POST",
					data : {},
					dataType : "json"
				}).done(function(data, ss) {
					layer.msg('数据删除成功');
					$("#tzMessageJqgrid").trigger("reloadGrid");
				}).fail(function(jqXHR, textStatus, errorThrown) {
					layer.msg('获取数据失败，请稍后重试');
				});
			}, function(){
				
			});
		}

		function updateData(obj) {
			/**获取行级元素
			var selectTr = $(obj).parent().parent().parent().find("td").eq(1).html();
			alert(selectTr);
			 **/
			var ID = obj.value;
			$.ajax({
				url : '${ctx}/message/getOneTzMessage/',
				type : "POST",
				data : {
					"ID" : ID
				},
				dataType : "json"
			}).done(function(data, ss) {
				var obj = data[0];
				
				$("#detail_bt").text(obj.XXBT);
				$("#detail_fssj").text(obj.FSSJ);
				$("#detail_fsbm").text(obj.FSBMMC);
				$("#detail_fsr").text(obj.FSR);
				
				$("#detail_jsbm").text(obj.JSBMMC);
				$("#detail_jsr").text(obj.JSR);
				
				$("#div_text").text(obj.MBNR);		
				$("#detail_content").text(obj.MBNR);
				var mobile = obj['JSSJHM'];
				var status = obj['ZT'];
				if (status == "1") {
					$("#detail_status").text('待发送');
				} else if (status == "2") {
					$("#detail_status").text('发送成功');

				} else if (status == "3") {
					$("#detail_status").text('发送失败');
				}
				$("#detail_mobile").text(mobile);
				
			}).fail(function(jqXHR, textStatus, errorThrown) {
				layer.msg('获取数据失败，请稍后重试');
			});

			/**
			layer.confirm('是否修改？', {
			    btn: ['确定','取消'], 
			    shade: false 
			}, function(){
				window.location.href = "${ctx}/message/toUpdateTzMessage?ID="+ID;
			}, function(){
			    
			});
			 **/
		}
	</script>

</rapid:override>

<c:if test='${sessionScope.loginname!="hzh_fgw" }'>
<%@ include file="../../template/base.jsp"  %>
</c:if>
<c:if test='${sessionScope.loginname=="hzh_fgw" }'>
<%@ include file="../../template/basenomenu.jsp"  %>
</c:if> 