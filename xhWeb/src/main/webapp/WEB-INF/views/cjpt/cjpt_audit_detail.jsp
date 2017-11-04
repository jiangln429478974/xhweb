<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<li>
					<a href="${ctx}/sjgx/index">首页</a><i class="fa fa-circle"></i>
				</li>
				<li>
					<a href="${ctx}/cjpt/datalist/auditlist/index">资源注册</a><i class="fa fa-circle"></i>
				</li>
				<li>
					<a>详情</a>
				</li>
			</ul>
        </div>
    </div>
</div> 
</rapid:override>
<rapid:override name="css">
	<link rel="stylesheet" href="${rs}/global/plugins/zTree/css/metroStyle/metroStyle.css" type="text/css">
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
                                            <th>状态</th>
                                            <td colspan="3">${detail.status}</td>   
	
                                        </tr>
                                        <c:if test="${detail.status != '待审核'}">
                                         <tr>
                                            <th>审核时间</th>
                                            <td colspan="3"> ${detail.last_update_time}</td>   
                                        </tr> 
                                       </c:if>
                                        <c:if test="${detail.status == '审核不通过'}">
                                        	<tr>
	                                            <th>不通过原因</th>
	                                            <td colspan="3"> ${detail.reason}</td>   
                                        	</tr>
                                        </c:if>
                                    </table>
                                         
                                </div>
                              </div>
                             </div>
				</div>
				<div class="portlet-body">
					<div class="clearfix clearfixb">
						<button class="btn btn-primary" type="button" id="back"  onclick="cancel();">返回</button>
					</div>
				</div>
		</div>
	</div>
</rapid:override>

<rapid:override name="plugins_script">
	<script src="${rs}/global/plugins/zTree/js/jquery.ztree.core-3.5.min.js"></script>
</rapid:override>

<rapid:override name="page_script">
	<script>
	function cancel() {
		window.location.href = "${ctx}/cjpt/datalist/auditlist/index";
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
				
				/* var status = "${detail.status}";
				if(status == "2"){
					document.getElementById("reasonDiv").style.display="";
				}else{
					document.getElementById("reasonDiv").style.display="none";
				} */

			});
	</script>
	
	
</rapid:override>
<%@ include file="../template/layout1.jsp"%>
