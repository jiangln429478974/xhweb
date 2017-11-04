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
					<a>任务监控</a><i class="fa fa-circle"></i>
				</li>
				
			</ul>
        </div>
    </div>
</div> 
</rapid:override>
<rapid:override name="css">
	<link rel="stylesheet" href="${rs}/global/plugins/zTree/css/metroStyle/metroStyle.css" type="text/css">
	<link href="${rs}/js/plugins/bootstrap-select/bootstrap-select.min.css" rel="stylesheet">
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
                                                    <!-- <button class="btn green" id="sample_editable_1_new" onclick="insertData();">
                                                  		  申请资源 <i class="fa fa-plus"></i>
                                                    </button> -->
                                          </div>
                                    </div>
							</div>
							<div class="row">
								<div class="col-md-12">
								
								</div>
							</div>
							<div id="gridWrapper" class="portlet-body">
								<form class="form-inline myform m-b5" role="form">
									<input type="text" placeholder="资源名称" class="form-control" id="search_res_name">
									<shiro:hasRole name="admin">
									<select id='department' class="selectpicker" data-style="btn-default">
	                                	<option value=''>请选择部门</option>
	                                	<c:forEach items="${departmentList}" var="opt">
	                                	  <option value='${opt.DEPARTMENT_ID}'>${opt.DEPARTMENT_NAME}</option>
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
		$("#res_grid_title").html("任务监控");
		$.jgrid.defaults.responsive = true;
		$.jgrid.defaults.styleUI = 'Bootstrap';

		var role = "${role}";
		if(role == "true"){
			
			$("#taskJqgrid").jqGrid({
		        url:'${ctx}/cjpt/datalist/getCollectionTaskList',
		        datatype: "json",
		        height: "auto",
		        autowidth: true,
		        //shrinkToFit: true,
		        //multiselect:true,//全选功能
		        rowNum: 20,
		        rowList: [10, 20, 30],
		        colNames: ['资源名称','申请部门','采集方式','操作' ],
		        colModel: [
		            {
		                name: 'RESNAME',
		                index: 'RESNAME'
		            },
		            {
		                name: 'DEPARTMENT',
		                index: 'DEPARTMENT'
		            },{
		                name: 'STATE',
		                index: 'STATE'
		            },{
		            	name: 'RESID',
		            	formatter:function(cellvalue, options, rowObject){
		            		return '<BUTTON class="btn btn-sm btn-info show-detail" onclick="detail(\''+rowObject.resid+'\');">详情</BUTTON>';
		            		
		            		
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
			$("#taskJqgrid").jqGrid({
		        url:'${ctx}/cjpt/datalist/getCollectionTaskList',
		        datatype: "json",
		        height: "auto",
		        autowidth: true,
		        //shrinkToFit: true,
		        //multiselect:true,//全选功能
		        rowNum: 20,
		        rowList: [10, 20, 30],
		        colNames: ['资源名称','采集方式','操作' ],
		        colModel: [
						{
						    name: 'RESNAME',
						    index: 'RESNAME'
						},{
						    name: 'STATE',
						    index: 'STATE'
						},{
							name: 'RESID',
			            	formatter:function(cellvalue, options, rowObject){
			            		return '<BUTTON class="btn btn-sm btn-info show-detail" onclick="detail(\''+rowObject.resid+'\');">详情</BUTTON>';
			            		
			            		
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
			var role = "${role}";
			var resname = $('#search_res_name').val();
			if(role == "true"){
				var department = document.getElementById('department').value;
				if(department == ''){
					department = '';
				}
				$('#taskJqgrid').jqGrid('setGridParam',{
					url:'${ctx}/cjpt/datalist/getCollectionTaskList',
			        datatype:'json',
			        postData:{'resname':resname,'department':department},
			        page:1
				}).trigger("reloadGrid");
			}else{
				$('#taskJqgrid').jqGrid('setGridParam',{
					url:'${ctx}/cjpt/datalist/getCollectionTaskList',
			        datatype:'json',
			        postData:{'resname':resname},
			        page:1
				}).trigger("reloadGrid");
			}
			
			
		});
	    
	 });
	    $(window).bind('resize', function () {
	        var width = $('.jqGrid_wrapper').width();
	        $('#taskJqgrid').setGridWidth(width);
	    });
	    
	     function deleteData(RES_ID,LAST_UPDATE_TIME){
	    	layer.confirm('是否删除？', {
	    	    btn: ['确定','取消'], 
	    	    shade: false 
	    	}, function(){
	    		//var strjson = 
	    		 $.ajax({
	    	         url: '${ctx}/cjpt/datalist/deletedata',
	    	         type: "POST",
	    	         data: {"RES_ID":RES_ID,"LAST_UPDATE_TIME":LAST_UPDATE_TIME},
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

	    function updateData(RES_ID,LAST_UPDATE_TIME){
	    	window.location.href = "${ctx}/cjpt/datalist/editdata/index?RES_ID="+RES_ID+"&LAST_UPDATE_TIME="+LAST_UPDATE_TIME;
	    	
	    }

	    function insertData(){
	    	window.location.href = "${ctx}/cjpt/datalist/adddata/index";
	    		
	   } 
	    function detail(resid){
	    	
	    }
	</script>
</rapid:override>
<%@ include file="../template/layout1.jsp"%>