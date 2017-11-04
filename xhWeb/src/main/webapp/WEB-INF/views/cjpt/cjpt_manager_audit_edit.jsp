<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rs" value="${ctx}/resources" />

<rapid:override name="title">首页</rapid:override>
<rapid:override name="page-nav">
	<div class="page-container">
		<!-- BEGIN PAGE HEAD -->
		<div class="page-head">
			<div class="container">
				<ul class="page-breadcrumb breadcrumb">
					<li><a href="${ctx}/sjgx/index">首页</a><i class="fa fa-circle"></i>
					</li>
					<li><a href="${ctx}/cjpt/datalist/auditlist/index">注册监控</a><i
						class="fa fa-circle"></i></li>
					<li><a>审核</a></li>
				</ul>
			</div>
		</div>
	</div>
</rapid:override>
<rapid:override name="css">
	<link rel="stylesheet"
		href="${rs}/global/plugins/zTree/css/metroStyle/metroStyle.css"
		type="text/css">
	<link href="${rs}/css/plugins/jQueryUI/jquery-ui-1.10.4.custom.min.css"
		rel="stylesheet">
	<!-- Data Tables -->
	<link href="${rs}/css/plugins/jqgrid/ui.jqgrid.css" rel="stylesheet">
	<link href="${rs}/js/plugins/layer/skin/layer.css" rel="stylesheet">
	<!-- BEGIN GLOBAL MANDATORY STYLES -->
	<link href="${rs}/global/plugins/bootstrap/css/bootstrap.min.css"
		rel="stylesheet" type="text/css">
	<!-- END GLOBAL MANDATORY STYLES -->
	<!-- BEGIN PAGE LEVEL STYLES -->
	<link rel="stylesheet" type="text/css"
		href="${rs}/global/plugins/jstree/dist/themes/default/style.min.css" />
	<!-- END PAGE LEVEL STYLES -->
	<!-- BEGIN PAGE LEVEL STYLES -->
	<link rel="stylesheet" type="text/css"
		href="${rs}/global/plugins/bootstrap-select/bootstrap-select.min.css" />
	<link rel="stylesheet" type="text/css"
		href="${rs}/global/plugins/select2/select2.css" />
	<link rel="stylesheet" type="text/css"
		href="${rs}/global/plugins/jquery-multi-select/css/multi-select.css" />
	<!-- BEGIN THEME STYLES -->
	<!-- BEGIN THEME STYLES -->
	<link href="${rs}/global/css/components-rounded.css"
		id="style_components" rel="stylesheet" type="text/css">
	<link href="${rs}/global/css/plugins.css" rel="stylesheet"
		type="text/css">
	<link href="${rs}/admin/layout3/css/layout.css" rel="stylesheet"
		type="text/css">
	<link href="${rs}/admin/layout3/css/themes/default.css"
		rel="stylesheet" type="text/css" id="style_color">
	<link href="${rs}/admin/layout3/css/custom.css" rel="stylesheet"
		type="text/css">

	<link rel="stylesheet" type="text/css"
		href="${rs}/css/bootstrap-tags.css" />

	<!-- END THEME STYLES -->
	<link rel="shortcut icon" href="favicon.ico" />
</rapid:override>
<rapid:override name="content">
	<!-- BEGIN PAGE CONTENT -->
	<div class="page-content">
		<div class="container">
			<!-- BEGIN PAGE CONTENT INNER -->
				<div class="row">
					<div class="col-md-4 col-md">
						<!-- BEGIN EXAMPLE TABLE PORTLET-->
						<div class="portlet light form-groupd">
						<div class="portlet-title">
                                        <div class="caption">
                                            <i class="fa fa-cogs font-green-sharp"></i>
                                            <span class="caption-subject font-green-sharp bold uppercase">共享申请内容</span>
                                        </div>
                                        
                       </div>
							<div id="tree_1" class="tree-demo">
								<ul id="content-tree" class="ztree"></ul>
							</div>
						</div>
						<!-- END EXAMPLE TABLE PORTLET-->
					</div>
					
					 <div class="col-md-8 col-mdr">
                           <div class="portlet light  form-groupd">   
                               <div class="form-body ">
                                     <table class="table_n">
                                     	<tr>
										  	<th>申请编号</th>
											<td colspan="3">${detail.id} </td>
										 </tr>
                                         <tr>
                                         <tr>
                                            <th>申请部门</th>
                                            <td>${detail.department_name}</td>
                                            <th>提交账户</th>
                                            <td>${detail.nick_name}</td>
                                        </tr>
                                         <tr>
                                            <th>资源描述</th>
                                            <td colspan="3">${detail.description}</td>   
                                        </tr>
                                        
                                         <tr>
                                            <th>资源标签</th>
                                            <td colspan="3">${tag}</td>   
                                        </tr>
                                        <tr>
                                            <th>数据提供方式</th>
                                            <td colspan="3"> ${detail.mode_name}</td>   
                                        </tr>
                                         <tr>
                                            <th>数据提供方式说明</th>
                                            <td colspan="3"></td>   
                                        </tr>
                                         <tr>
                                            <th>更新频率</th>
                                            <td colspan="3"> ${detail.frequency}</td>   
                                        </tr>
                                        
                                        
                                       
                                         <tr>
                                            <th>审核是否通过</th>
                                            <td colspan="3">
                                            	<div class="radio-list">
												<label class="radio-inline">
												<div class="radio" id="uniform-optionsRadios25">
												
												<input type="radio" name="cb" id="optionsRadios25" value="1" checked="checked" onchange="hideReason();">
												
												</div> 通过 
												</label>
												<label class="radio-inline">
												<div class="radio" id="uniform-optionsRadios26">
												
												<input type="radio" name="cb" id="optionsRadios26" value="2" onchange="showReason();">
												
												</div> 不通过 
												</label>
												
												</div>
                                            </td> 
                                         </tr>  
										<tr id="reasonDiv" style="display: none">
                                            <th>反对理由</th>
                                            <td colspan="3"><textarea id="reason" rows="5" cols="68"
												placeholder="在这里输入反映内容"></textarea></td>   
                                        </tr>
                                          
                                    </table>
                                         
                                </div>
                              </div>
                             </div>
				</div>
				<div class="portlet-body">
					<div class="clearfix clearfixb">
						<button class="btn btn-primary" type="button" onclick="commit();">提交</button>
						<button class="btn btn-primary" type="button" id="back"  onclick="cancel();">返回</button>
					</div>
				</div>
		</div>
	</div>
</rapid:override>

<rapid:override name="plugins_script">
	<script
		src="${rs}/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js"
		type="text/javascript"></script>
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="${rs}/global/plugins/jstree/dist/jstree.min.js"></script>
	<script type="text/javascript"
		src="${rs}/global/plugins/bootstrap-select/bootstrap-select.min.js"></script>
	<script type="text/javascript"
		src="${rs}/global/plugins/select2/select2.min.js"></script>
	<script type="text/javascript"
		src="${rs}/global/plugins/jquery-multi-select/js/jquery.multi-select.js"></script>

	<!-- END PAGE LEVEL SCRIPTS -->
	<script src="${rs}/admin/pages/scripts/ui-tree.js"></script>
	<script src="${rs}/global/scripts/metronic.js" type="text/javascript"></script>
	<script src="${rs}/admin/layout3/scripts/layout.js"
		type="text/javascript"></script>
	<script src="${rs}/admin/layout3/scripts/demo.js"
		type="text/javascript"></script>
	<script src="${rs}/admin/pages/scripts/components-dropdowns.js"></script>
	<script src='${rs}/admin/pages/scripts/bootstrap-tags.js'></script>
	<script
		src="${rs}/global/plugins/zTree/js/jquery.ztree.core-3.5.min.js"></script>
	<script
		src="${rs}/global/plugins/zTree/js/jquery.ztree.excheck-3.5.min.js"></script>
</rapid:override>

<rapid:override name="page_script">
	<script>
		function commit() {
			var id = "${id}";
			layer.confirm('是否提交？', {
				btn : [ '确定', '取消' ],
				shade : false
			}, function() {
				var status = $('input[name="cb"]:checked').val();
				var reason = $("#reason").val();
				$.ajax({
					url : '${ctx}/cjpt/datalist/manager/audit/commit',
					type : "POST",
					data : {
						"id" : id,
						"status" : status,
						"reason" : reason,
						"res_id" : "${detail.res_id}",
						"collection_mode" : 1,
						"frequency" : "${detail.frequencyid}"
					},
					dataType : "json"
				}).done(function(data, ss) {
					layer.msg('提交成功');
					$("#taskJqgrid").trigger("reloadGrid");
					 window.location.href="${ctx}/cjpt/datalist/auditlist/index";
				}).fail(function(jqXHR, textStatus, errorThrown) {
					layer.msg('提交失败，请稍后重试');
				});
			}, function() {

			});
		}

		function cancel() {
			window.location.href = "${ctx}/cjpt/datalist/auditlist/index";
		}

		function showReason() {
			document.getElementById("reasonDiv").style.display = "";
		}

		function hideReason() {
			document.getElementById("reasonDiv").style.display = "none";
		}
		$(document).ready(
				function() {
					var resid = "${detail.res_id}";
					var setting = {
						async : {
							enable : true,
							url : "${ctx}/cjpt/" + resid
									+ "/datalist/fieldTree",
							autoParam : [ "id", "RES_SHOW_NAME" ],
							dataFilter : filter
						},
						check : {
							enable : true,
							chkStyle : "checkbox",
							chkboxType : {
								"Y" : "ps",
								"N" : "ps"
							}
						}
					};
					function filter(treeId, parentNode, childNodes) {
						if (!childNodes)
							return null;
						for (var i = 0, l = childNodes.length; i < l; i++) {
							childNodes[i].name = childNodes[i].name.replace(
									/\.n/g, '.');
						}
						return childNodes;
					}

					$.fn.zTree.init($("#content-tree"), setting);

				});
		/*  */
	</script>


</rapid:override>
<%@ include file="../template/layout1.jsp"%>
