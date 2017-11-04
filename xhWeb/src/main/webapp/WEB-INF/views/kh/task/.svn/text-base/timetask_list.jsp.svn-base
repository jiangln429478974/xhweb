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


</style>
</rapid:override>
<rapid:override name="content">
	<div class="wrapper">
		<div class="portlet box blue">
			<div class="portlet-title ">
				<div class="caption">定时任务列表</div>
<!-- 				<div class="tools"> -->
<!-- 					<a class="collapse" href="" data-original-title="" title=""> </a> -->
<!-- 				</div> -->
			</div>
			<div class="portlet-body form">
				<div class="form-horizontal">
					<div class="wrapper wrapper-content  animated fadeInRight">
						<br />
						<div class="row">
							<div class="col-lg-12">
								<div class="ibox ">
									<div class="ibox-content">
										<div class="input-group">
											<span>
												<button type="button" class="btn blue" id="btn_add"
													style="margin-left:6px"><i class="fa fa-plus"></i>新增</button>
											</span>
										</div>
										<br />
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="jqGrid_wrapper" style="margin-left:6px;margin-right:6px">
		<table id="taskJqgrid"></table>
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
$(document).ready(function () {
   $('#btn_add').click(function(){
	   //alert('跳转页面');
	 	window.location="${ctx}/task/addTask"; 
   });
   
   $("#taskJqgrid").jqGrid({
       url:'${ctx}/task/getTaskList',
       datatype: "json",
       height: 'auto',
       autowidth: true,
       //shrinkToFit: true,
       //multiselect:true,//全选功能
       rowNum: 10,
       rowList: [10, 20, 50],
       colNames: ['添加时间','执行时间', '执行周期','启停状态','操作'],
       colModel: [
           {
               name: 'RKRQ',
               index: 'RKRQ',
               align:'center'
           },
           {
               name: 'ZXSJ',
               index: 'ZXSJ',
               align:'center'
           },
           {
               name: 'ZXZQ',
               index: 'ZXZQ',
               align:'center'
           },
           {
               name: 'ZT',
               index: 'ZT',
               align:'center',
           	formatter:function(cellvalue, options, rowObject){
           		if(cellvalue=='0')
           			return '<div  name="div_status"  id='+rowObject.ID+'><span style="color:red">停用</span></div>';
           		else
           			return '<div name="div_status"  id='+rowObject.ID+'><span style="color:green">启用</span></div>';
           	}
          
           },
          
           {
           	name:'ID', align:'center',
           	formatter:function(cellvalue, options, rowObject){
           		return '<button  class="btn btn-xs yellow" onclick="updateData(\''+cellvalue+'\');">修改</button>'+
       			'<button class="btn btn-xs red" style="margin-left:4px" onclick="deleteData(\''+cellvalue+'\');">删除</button>';
           	}
           }
       ],
       pager: "#pager_list",
       //viewrecords: true,
       caption: "定时任务列表",
       //add: true,
       //edit: true,
       //addtext: 'Add',
       //edittext: 'Edit',
       hidegrid: false
   });
   
   $(window).bind('resize', function () {
       var width = $('.jqGrid_wrapper').width();
       $('#taskJqgrid').setGridWidth(width);6
   });
   
});

function deleteData(ID){
	   
	  // alert(id);
		layer.confirm('是否删除？', {
		    btn: ['确定','取消'], 
		    shade: false 
		}, function(){
			 $.ajax({
		         url: '${ctx}/task/deleteTask/'+ID,
		         type: "POST",
		         data: {},
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
	
	function updateData(ID){
		
		layer.confirm('是否修改？', {
		    btn: ['确定','取消'], 
		    shade: false 
		}, function(){
			var   divs = document.getElementsByName("div_status");
			for(var i=0;i<divs.length;i++){
				if(divs[i].id==ID){
					var  childSpan = divs[i].children[0];
					if(childSpan.innerHTML=="启用"){
						divs[i].innerHTML='<span style="color:red">停用</span>';
					}else{
						divs[i].innerHTML='<span style="color:green">启用</span>';
					}
					break;
				}
			}
			 layer.msg('修改成功');
		//	window.location.href = "${ctx}/task/toUpdateTask?ID="+ID;
		}, function(){
		    
		});
	}
</script>

</rapid:override>
<%@ include file="../../template/base.jsp"%>