<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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
					<a>注册审核</a><i class="fa fa-circle"></i>
				</li>
				
			</ul>
        </div>
    </div>
</div> 
</rapid:override>
<rapid:override name="css">
	<link rel="stylesheet" href="${rs}/global/plugins/zTree/css/metroStyle/metroStyle.css" type="text/css">
	<link href="${rs}/js/plugins/bootstrap-select/bootstrap-select.min.css" rel="stylesheet">
	<style>
		.myform {
			padding-bottom:10px;
		}
	</style>
</rapid:override>

<rapid:override name="content">
	<!-- BEGIN PAGE CONTENT -->
	<div class="page-content">
		<div class="container">
			<!-- BEGIN PAGE CONTENT INNER -->
			<div class="portlet light">
				<div class="row">
					
					<div class="col-md-12">
						<!-- BEGIN EXAMPLE TABLE PORTLET-->
						<div id="right_panel" class="portlet light invisible">
							<div class="portlet-title">
								<div class="caption">
									<i class="fa fa-cogs font-green-sharp"></i> <span
										id="res_grid_title"
										class="caption-subject font-green-sharp bold uppercase"></span>
								</div>
								<div class="tools">
                                      	<div class="btn-group">
                                      		<shiro:lacksRole name ="admin">
                                      			<button class="btn green" id="sample_editable_1_new" onclick="insertData();">
                                                  		  申请资源 <i class="fa fa-plus"></i>
                                                   </button>
                                             </shiro:lacksRole>
                                          </div>
                                    </div>
							</div>
							<div class="row">
								<div class="col-md-12">
								
								</div>
								
									
							</div>
							<div id="gridWrapper" class="portlet-body">
							<form class="form-inline myform" role="form">
									<input type="text" placeholder="资源名称" class="form-control" id="search_res_name">
									 <select id='status' class="selectpicker" data-style="btn-default">
									 <option value=''>请选择审核状态</option>
									 <c:forEach items="${regStatusList}" var="opt">
									 	<option value="${opt.ID}">${opt.STATUS_NAME}</option>
									 </c:forEach>
									</select> 
									<shiro:hasRole name ="admin">
									 <select id='department' class="selectpicker" data-style="btn-default">
	                                	<option value=''>请选择部门</option>
	                                	<c:forEach items="${departmentList}" var="opt">
	                                	  <option value="${opt.DEPARTMENT_ID}">${opt.DEPARTMENT_NAME}</option>
	                               		</c:forEach>
									</select> 
									</shiro:hasRole>
									<button type="button" class="btn btn-warning" id="btn-search">搜索</button>
								</form>
								<table id="taskJqgrid" class="ui-jqgrid-font"></table>
								<div id="pager_list"></div>
							</div>
						</div>
						<!-- END EXAMPLE TABLE PORTLET-->
					</div>
				</div>
			</div>
			<!-- END PAGE CONTENT INNER -->
		</div>
	</div>
</rapid:override>

<rapid:override name="plugins_script">
	<script src="${rs}/js/plugins/bootstrap-select/bootstrap-select.min.js"></script>
	<script src="${rs}/global/plugins/jqgrid/js/i18n/grid.locale-cn.js"></script>
	<script src="${rs}/global/plugins/jqgrid/js/jquery.jqGrid.js"></script>
</rapid:override>

<rapid:override name="page_script">

	<script>
	$(document).ready(function () {
		$("#right_panel").removeClass("invisible");
		$("#res_grid_title").html("资源注册");
		$.jgrid.defaults.responsive = true;
		$.jgrid.defaults.styleUI = 'Bootstrap';

		var role = "${role}";
		if(role == "true"){
		//	document.getElementById("departmentDiv").style.display="";
		//	document.getElementById("sample_editable_1_new").style.display="none";
			$("#taskJqgrid").jqGrid({
		        url:'${ctx}/cjpt/datalist/auditlist',
		        datatype: "json",
		        height: "auto",
		        autowidth: true,
		        //shrinkshiroToFit: true,
		        //multiselect:true,//全选功能
		        rowNum: 20,
		        rowList: [10, 20, 30],
		        colNames: ['资源名称','提供方式','提供频率','申请时间','审批状态','操作' ],
		        colModel: [
		            {
		                name: 'resname',
		                index: 'resname'
		            },{
		            	name: 'mode',
		            	formatter:function(cellvalue, options, rowObject){
		            		return '平台web接口';
		            	}
		            },{
		                name: 'frequency',
		                index: 'frequency'
		            },{
		                name: 'last_update_time',
		                index: 'last_update_time'
		               
		            },{
		                name: 'status',
		                index: 'status'
		            },{
		            
		            	name:'id',
		            	formatter:function(cellvalue, options, rowObject){
		            		if(rowObject.statusid == '0'){
		            			return '<BUTTON class="btn btn-sm btn-info show-detail" onclick="detail(\''+rowObject.id+'\');">详情</BUTTON>' +
			            		'<BUTTON class="btn btn-sm btn-warning" onclick="audit(\''+rowObject.id+'\');">审核</BUTTON>';
		            		}else{
		            			return '<BUTTON class="btn btn-sm btn-info show-detail" onclick="detail(\''+rowObject.id+'\');">详情</BUTTON>' +
			            		'<BUTTON class="btn btn-sm btn-warning disabled" onclick="audit(\''+rowObject.id+'\');">审核</BUTTON>';
		            		}
		            		
		            	}
		            	} 
		            
		        ],
		        pager: "#pager_list",
		        //viewrecords: true,
		        caption: "用户信息",
		        //add: true,
		        //edit: true,
		        //addtext: 'Add',
		        //edittext: 'Edit',
		        hidegrid: false
		    });
		}else{
			//document.getElementById("departmentDiv").style.display="none";
		//	document.getElementById("sample_editable_1_new").style.display="";
			$("#taskJqgrid").jqGrid({
		        url:'${ctx}/cjpt/datalist/auditlist',
		        datatype: "json",
		        height: "auto",
		        autowidth: true,
		        //shrinkToFit: true,
		        //multiselect:true,//全选功能
		        rowNum: 20,
		        rowList: [10, 20, 30],
		        colNames: ['资源名称','提供方式','提供频率','申请时间','审批状态','操作' ],
		        colModel: [
		            {
		                name: 'resname',
		                index: 'resname'
		            },{
		            	name: 'mode',
		            	formatter:function(cellvalue, options, rowObject){
		            		return '平台web接口';
		            	}
		            },{
		                name: 'frequency',
		                index: 'frequency'
		            },{
		                name: 'last_update_time',
		                index: 'last_update_time'
		               
		            },{
		                name: 'status',
		                index: 'status'
		            },{
		            
		            	name:'id',
		            	width:180,
		            	formatter:function(cellvalue, options, rowObject){
		            		if(rowObject.statusid == '0'){
		            			return  '<BUTTON class="btn btn-sm btn-info show-detail" onclick="updateData(\''+rowObject.id+'\');">修改</BUTTON>' +
			            		'<BUTTON class="btn btn-sm btn-warning" onclick="deleteData(\''+rowObject.id+'\');">删除</BUTTON>' +
			            		'<BUTTON class="btn btn-sm btn-info show-detail" onclick="detail(\''+rowObject.id+'\');">详情</BUTTON>';
			            	
		            		}else{
		            			return  '<BUTTON class="btn btn-sm btn-info show-detail disabled" onclick="updateData(\''+rowObject.id+'\');">修改</BUTTON>' +
			            		'<BUTTON class="btn btn-sm btn-warning disabled" onclick="deleteData(\''+rowObject.id+'\');">删除</BUTTON>' +
			            		'<BUTTON class="btn btn-sm btn-info show-detail" onclick="detail(\''+rowObject.id+'\');">详情</BUTTON>';
			            	
		            			}
		            		}
		            	} 
		            
		        ],
		        pager: "#pager_list",
		        //viewrecords: true,
		        caption: "用户信息",
		        //add: true,
		        //edit: true,
		        //addtext: 'Add',
		        //edittext: 'Edit',
		        hidegrid: false
		    });
		}
		
		$("#btn-search").click(function (){
			var resname = $('#search_res_name').val();
			var departmentid = $('#department').val();
			var status = $('#status').val();
			/* if(departmentid == '999'){
				departmentid = '';
			}
			if(status == ''){
				status = '';
			} */
			$('#taskJqgrid').jqGrid('setGridParam',{
				url:'${ctx}/cjpt/datalist/auditlist',
		        datatype:'json',
		        postData:{'resname':resname,'departmentid':departmentid, 'regstatus':status},
		        page:1
			}).trigger("reloadGrid");
		});
	    
	 });
	    $(window).bind('resize', function () {
	        var width = $('.jqGrid_wrapper').width();
	        $('#taskJqgrid').setGridWidth(width);
	    });
	    
	     function deleteData(ID){
	    	layer.confirm('是否删除？', {
	    	    btn: ['确定','取消'], 
	    	    shade: false 
	    	}, function(){
	    		//var strjson = 
	    		 $.ajax({
	    	         url: '${ctx}/cjpt/datalist/audit/deletedata',
	    	         type: "POST",
	    	         data: {"id":ID},
	    	         dataType: "json"
	    	     }).done(function(data,ss) {
	    	    	 layer.msg('数据删除成功');
	    	    	 $("#taskJqgrid").trigger("reloadGrid");
	    	     }).fail(function(jqXHR, textStatus, errorThrown){
	    	    	 layer.msg('数据删除失败，请稍后重试');
	    	     }	 
	    	     );
	    	}, function(){
	    	    
	    	});
	    }

	    function updateData(id){
	    	window.location.href = "${ctx}/cjpt/datalist/editdata/index?ID="+id;
	    	
	    }

	   	function insertData(){
	    		window.location.href = "${ctx}/cjpt/datalist/adddata/index";
	    		
	    	}
	   	
	   	function audit(id){
	   		window.location.href = "${ctx}/cjpt/datalist/"+id+"/manager/audit/index";
	   	}
	   	
	   	function detail(id){
	   		window.location.href = "${ctx}/cjpt/datalist/"+id+"/auditdetail/index";
	   	}
	</script>
</rapid:override>
<%@ include file="../template/layout1.jsp"%>