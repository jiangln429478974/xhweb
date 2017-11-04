<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rs" value="${ctx}/resources" />

<rapid:override name="title">申请资源</rapid:override>
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
					<a>申请资源</a>
				</li>
			</ul>
        </div>
    </div>
</div> 
</rapid:override>
<rapid:override name="css">
	<link rel="stylesheet" href="${rs}/global/plugins/zTree/css/metroStyle/metroStyle.css" type="text/css">
	<link href="${rs}/css/plugins/jQueryUI/jquery-ui-1.10.4.custom.min.css" rel="stylesheet">
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
<link href="${rs}/admin/layout3/css/themes/default.css" rel="stylesheet"
	type="text/css" id="style_color">
<link href="${rs}/admin/layout3/css/custom.css" rel="stylesheet"
	type="text/css">

<link rel="stylesheet" type="text/css"
		href="${rs}/css/bootstrap-tags.css" />
	
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="favicon.ico" />
</rapid:override>
<rapid:override name="content">
	<!-- BEGIN HEADER -->
	
    <!-- BEGIN PAGE CONTENT -->
        <div class="page-content">
        	<div class="container">
                <!-- BEGIN PAGE CONTENT INNER -->
                <div class="portlet light botm ">
                    <div class="row">
                     
                        <div class="col-md-4 col-md">
                            <!-- BEGIN EXAMPLE TABLE PORTLET-->
                            <div class="portlet light form-groupd">
                            		<div class="portlet-title">
	                                    <div class="caption">
	                                        <i class="fa fa-cogs "></i>
	                                        <span class="caption-subject   uppercase">资源名称：</span>
	                                    </div>
                                        <div class="zyr_name" id="res_name">资源名称</div>
                                        
                                	</div>
                                
	                             	
                                
                               <div class="portlet-body">
									<ul class="nav nav-tabs">
										<li class="active">
											<a href="#tab_1_1" data-toggle="tab">
											资源选择 </a>
										</li>
										<!-- <li>
											<a href="#tab_1_2" data-toggle="tab">
											共享设置 </a>
										</li> -->
										
									</ul>
									<div class="tab-content">
										<div class="tab-pane fade active in" id="tab_1_1">
											<div class="btn-group m-b5">
															
											<select id="ResIdSel" data-style="btn-default" class="selectpicker"  onchange="change_tableName(this)">
												<option value="">请选择资源</option> 
												<c:forEach var="resource" items="${resourceList}">
													<option value="${resource.ID}">${resource.TABLE_NAME}</option>
												</c:forEach>
											</select>
											</div>
											<div class="form-control height-auto">
												<div class="scroller" style="height:275px;" data-always-visible="1">
													<div id="tree_1" class="tree-demo">
												
														<ul id="content-tree" class="ztree"></ul>
													</div>
													</div>
											</div>	
										</div>
										<div class="tab-pane fade" id="tab_1_2">
											
												<div class="mb_5">
	                                        			<input type="text" placeholder="资源名称" class="form-control input-inline" style="width:160px;">
	                                        			<button class="btn btn-primary" type="button">搜索</button>

			                                	 </div>

			                                	 <!-- BEGIN FORM-->
												<form action="index.html" class="form-horizontal form-row-seperated">
													<div class="form-body">
														<div class="form-group">
									
												<div class="col-md-12">
													<select multiple="multiple" class="multi-select" id="my_multi_select1" name="my_multi_select1[]">
														<option>质监</option>
														<option>New York Giants</option>
														<option selected>Philadelphia Eagles</option>
														<option selected>Washington Redskins</option>
														<option>Chicago Bears</option>
														<option>Detroit Lions</option>
														<option>Green Bay Packers</option>
														<option>Minnesota Vikings</option>
														<option selected>Atlanta Falcons</option>
														<option>Carolina Panthers</option>
														<option>New Orleans Saints</option>
														<option>Tampa Bay Buccaneers</option>
														<option>Arizona Cardinals</option>
														<option>St. Louis Rams</option>
														<option>San Francisco 49ers</option>
														<option>Seattle Seahawks</option>
													</select>
												</div>
									</div>
													</div>
													
												</form>
												<!-- END FORM-->
			                            </div>	
                            		</div>
                            	</div>	
                            </div>		
                            <!-- END EXAMPLE TABLE PORTLET-->
                        
                        </div>
                        <div class="col-md-8 col-mdr">

                        	<div class="portlet-body form form-groupd">
										<!-- BEGIN FORM-->
										<form action="javascript:;" class="form-horizontal">
											
											<div class="form-body">
												<div class="form-group">
													<label class="col-md-3 control-label">数据提供方式：</label>
													<div class="col-md-8 control-label2">
													<div class="checkbox-list">
															
															<label class="checkbox-inline">
															<input type="checkbox" id="ccc" value="checked" checked="checked" disabled> 平台web接口</label>
															<label class="checkbox-inline">
															<input type="checkbox" id="inlineCheckbox2" value="option2" disabled> 交换平台  </label>
															<label class="checkbox-inline">
															<input type="checkbox" id="inlineCheckbox3" value="option3" disabled> 文件上传  </label>
													</div>
													
													<div class="checkbox-list m-b5">
														<label class="checkbox-inline">
														<input type="checkbox" id="inlineCheckbox3" value="option3" disabled> 提供方自有接口  </label>	
														<label class="checkbox-inline">
														<input type="checkbox" id="inlineCheckbox3" value="option3" disabled> 非结构化  </label>
													</div>
													
													<div class="form-control form-control2">平台web接口</div>
													
													</div>
													
												</div>
											
												
												<div class="form-group">
													<label class="col-md-3 control-label">更新频率：</label>
													<div class="col-md-8">
														<div class="btn-group">
														
														<select id="frequencySel" data-style="btn-default" class="selectpicker">
															<option value=''>请选择频率</option>
															<c:forEach var="frequency" items="${frequencyList}">
																<option value="${frequency.ID}">${frequency.FREQUENCY_NAME}</option>
															</c:forEach>
														</select>
														
													</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">资源描述：</label>
													<div class="col-md-8">
														

															<textarea id="message" class="form-control" placeholder="请填写资源描述" rows="7"></textarea>
														
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">资源标签：</label>
													<div class="col-md-8">
														<div id="tagDiv" ></div>
														<span class="help-block">
														输入标签后回车 </span>	
														
													</div>
												</div>
												
												
											</div>
										</form>
										<!-- END FORM-->
									</div>
					</div>



                        </div> 
                         <div class="portlet-body"><div class="clearfix clearfixb">
													 
													
													<button class="btn btn-primary" type="button" onclick="commit();">提交</button>
													<button class="btn btn-primary" type="button" onclick="cancel();">取消</button>
													
												</div></div>
                    </div>
                    
                    
                <!-- END PAGE CONTENT INNER -->
            </div>   
        </div>
        
    <!-- END PAGE CONTENT -->
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
	<script src="${rs}/global/plugins/zTree/js/jquery.ztree.core-3.5.min.js"></script>
	<script src="${rs}/global/plugins/zTree/js/jquery.ztree.excheck-3.5.min.js"></script>
</rapid:override>

<rapid:override name="page_script">
	<script>
		
	  
	    
	    
	    var resid;
	    function change_tableName(id){
	    	var opt = id.options[id.selectedIndex];
	    	document.getElementById("res_name").innerHTML = opt.text;
	    	resid = opt.value;
	    	if(resid == ""){
	    		var zTreeObj= $.fn.zTree.getZTreeObj("content-tree");
	    		zTreeObj.destroy();
	    	}else{
	    		var setting = {
		 	    		async : {
		 	    			enable : true,
		 	    			url : "${ctx}/cjpt/" + resid + "/datalist/fieldTree",
		 	    			autoParam : [ "id", "RES_SHOW_NAME" ],
		 	    			dataFilter : filter
		 	    		},
		 	    		check: {
		 	    			enable: true,
		 	    			chkStyle: "checkbox",
		 	    			chkboxType: { "Y": "ps", "N": "ps" }
		 	    		}
		 	    	};
		    	
		    	
		    	
		    	$.fn.zTree.init($("#content-tree"), setting);
	    	}
	   }
	    
	  function filter(treeId, parentNode, childNodes) {
	    	if (!childNodes)
				return null;
			for (var i = 0, l = childNodes.length; i < l; i++) {
				childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
			}
			return childNodes;
		}
		
		  function commit(){
			 var resid = document.getElementById("ResIdSel").value;
				var COLLECTION_MODE = 1;
				var FREQUENCY = document.getElementById("frequencySel").value;
				
				var res_name = document.getElementById("res_name").innerHTML ;
				var res_description = $("#message").val();
				var res_tag;
				if($("#tagDiv").tags().tagData == 0){
					res_tag="";
				}else{
					res_tag = $("#tagDiv").tags().tagData.toString();
				}
				
				
				//var res_tag = $("#tagDiv").tags().tagData.toString().replace(",", " ");
				 layer.confirm('是否提交？', {
		    	    btn: ['确定','取消'], 
		    	    shade: false 
		    	}, function(){
		    		$.ajax({
		    	         url: '${ctx}/cjpt/datalist/adddata/add',    
		    	         type: "POST",
		    	         data: {"RES_ID":resid,"COLLECTION_MODE":COLLECTION_MODE,"FREQUENCY":FREQUENCY,"RESOURCE_NAME_CN":res_name,"RESOURCE_DESCRIPTION":res_description,"TAG":res_tag},
		    	         dataType: "json"
		    	     }).done(function(data,ss) {
		    	    	 if(res_name == '请选择'){
		    	    		 layer.msg('请选择资源');
		    	    	 }else if(FREQUENCY == ''){
		    	    		 layer.msg('请选择更新频率');
		    	    	 }else if(data.code==999){
		    	    		 layer.msg('该资源已申请');
		    	    	 }else{
		    	    		 layer.msg('提交成功');
			    	    	 $("#userJqgrid").trigger("reloadGrid");
			    	    	 window.location.href="${ctx}/cjpt/datalist/auditlist/index";
		    	    	 }
		    	    	 
		    	     }).fail(function(jqXHR, textStatus, errorThrown){
		    	    	 layer.msg('数据提交失败，请稍后重试');
		    	     }	 
		    	     );
		    	}, function(){
		    	    
		    	});   
		    }
		  function cancel(){
			  window.location.href="${ctx}/cjpt/datalist/auditlist/index";
		  }
		  
		  $(document).ready(function() {
			 
				
			});
	</script>
	<script>
	$(function(){
		$("#tagDiv").tags({
			tagSize: "lg",
			suggestions: ["alpha", "bravo", "charlie", "delta", "echo", "foxtrot", "golf", "hotel", "india"],
			tagData: []
		}); 
	 });
	</script>
	
</rapid:override>
<%@ include file="../template/layout1.jsp"%>
