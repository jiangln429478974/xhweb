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

.login-dialog {
	width: 800px;
	height: 800px;
}
</style>
</rapid:override>
<rapid:override name="content">
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN VALIDATION STATES-->
			<div class="portlet box blue">
				<!-- begin title-->
				<div class="portlet-title">
					<div class="caption">模板列表管理</div>
				</div>
				<!-- end title -->
				<div class="portlet-body form">
					<!-- BEGIN FORM-->
					<form class="form-horizontal" id="myForm" method="post">
						<div class="form-body">
							<div class="form-group">
								<div class="input-group col-lg-12">
									<div class="form-group">
										<label class="control-label col-md-4">表名</label>
										<div class="col-md-4">
											<input type="text" name="BMC" class="form-control">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-4">表中文名</label>
										<div class="col-md-4">
											<input type="text" name="ZTMC" class="form-control">
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="form-actions">
							<div class="row">
							<div class="col-md-offset-0 col-md-5">
											<span style="float: left;">
									<button class="btn btn-primary " type="button" id="btn-add"
										onclick="insertData();">
										<i class="fa fa-plus"></i>&nbsp;添加
									</button>
									</span>
									</div>
								<div class="col-md-offset-0 col-md-5"">
									<button type="button" class="btn btn-primary" id="search">
										<i class="fa fa-search"></i> 搜索
									</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>
	<div class="row">
		<!-- 			<div class="col-md-12"> -->
		<!-- 				<button class="btn btn-primary " type="button" id="btn-add" -->
		<!-- 					onclick="insertData();"> -->
		<!-- 					<i class="fa fa-plus"></i>&nbsp;添加 -->
		<!-- 				</button> -->
		<!-- 				<button class="btn btn-info " type="button" id="btn-get"> -->
		<!-- 					<i class="fa fa-file-o"></i>查看 -->
		<!-- 				</button> -->
		<!-- 				<button class="btn green" type="button" id="btn-update"> -->
		<!-- 					<i class="fa fa-edit"></i>编辑 -->
		<!-- 				</button> -->
		<!-- 				<button class="btn red" type="button" id="btn-delete"> -->
		<!-- 					<i class="fa fa-times-circle"></i> <span class="bold">删除</span> -->
		<!-- 				</button> -->
		<!-- 			</div> -->
	</div>
	<div class="jqGrid_wrapper">
		<table id="userJqgrid"></table>
		<div id="pager_list"></div>
	</div>
</rapid:override>
<rapid:override name="script">
	<script src="${rs}/js/plugins/jqgrid/i18n/grid.locale-cn.js"></script>
	<script src="${rs}/js/plugins/jqgrid/jquery.jqGrid.min.js"></script>
	<script src="${rs}/js/plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="${rs}/js/plugins/layer/layer.js"></script>
	<script>
$(document).ready(function () {

    $("#userJqgrid").jqGrid({
        url:'${ctx}/demo/getDemoList',
        datatype: "json",
        height: 'auto',
        autowidth: true,
        mtype:"POST",
        postData:{},
        //shrinkToFit: true,
        //multiselect:true,//全选功能
        rownumbers:true,
        rowNum: 20,
        rowList: [10, 20, 30],
        colNames: ['ZTBM','表名','表中文名','隐藏','操作'],
        colModel: [
        {name:'ZTBM',index:'ZTBM'},
        {name:'BMC',index:'BMC'},
        {name:'ZTMC',index:'ZTMC'},
        {name: 'UUID_H',hidden:true,formatter:function(cellvalue, options, rowObject){return rowObject.ZTBM;}},
        {name:'UUID',width:200,formatter:function(cellvalue, options, rowObject){return    '<BUTTON onclick="getData(\''+rowObject.ZTBM+'\');">查看</BUTTON>'+'<BUTTON onclick="updateData(\''+rowObject.ZTBM+'\');">修改</BUTTON>'+ '<BUTTON onclick="deleteData(\''+rowObject.ZTBM+'\');">删除</BUTTON>';}}],
        pager: "#pager_list",
        //viewrecords: true,
        caption: "模板管理",
        //add: true,
        //edit: true,
        //addtext: 'Add',
        //edittext: 'Edit',
        hidegrid: false
    });
    
   $(window).bind('resize', function () {
        var width = $('.jqGrid_wrapper').width();
        $('#userJqgrid').setGridWidth(width);
    });

  /*搜索*/
     $("#search").click(function(){
    	
    	   // 将查询参数融入postData选项对象  
    	   
    	// var fields = $("#myForm").serializeArray();
    	var postData = $("#userJqgrid").jqGrid("getGridParam", "postData"); 
    	var rules="";
		$("#myForm :input").each(function(i){
 			　if ($(this).val()) {
					var myname=$(this).attr("name");
					var myvalue=$(this).val();
					//alert($("#myForm :input").size());
						rules+="\""+myname+"\":\""+myvalue+"\",";
 				//$.extend(postData, {myname:myvalue});
　　　　　　　　}
		});
		ParamJson = '{' + rules.substr(0,rules.lastIndexOf(",")) + '}';
		//alert(ParamJson);
		
    	$.extend(postData, { Param: ParamJson });

  	   $("#userJqgrid").jqGrid('setGridParam',{ 
  		    search: true,
  	   }).trigger("reloadGrid", [{page:1}]); //重新载入
     });
   /*清空*/
   $("#reset").click(function(){

	  window.location.reload();
   });
   
   
    $("#btn-delete").click(function () {
        var jqgrid = $('#userJqgrid');
        var rowid = jqgrid.jqGrid('getGridParam','selrow');
        if(!rowid){
            BootstrapDialog.show({
                title: '系统提示',
                message: '请选中要删除的数据',
                type: BootstrapDialog.TYPE_WARNING,
                buttons: [{
                    label: '关闭',
                    action: function(dialogRef){
                        dialogRef.close();
                    }
                }]
            });
            return;
        }
        BootstrapDialog.confirm('确定要删除选中数据吗?', function(result){
            if(result) {
                var rowData = jqgrid.jqGrid('getRowData',rowid);
               
                $.ajax({
      		         url: '${ctx}/demo/deleteDemo',
      		         type: "POST",
      		         data:{UUID:rowData.UUID_H},
      		         dataType: "json",
      		         error: function(json){
      					       layer.msg('数据删除失败，请稍后重试');
      					}, 
      				success: function(json){
      						//alert(json);
      						var msg=json.code;
      						if(msg=="1"){
      							layer.msg('数据删除成功');
      		    				 $("#userJqgrid").trigger("reloadGrid");
      						}else{
      							 layer.msg('数据删除失败，请稍后重试');
      							}
      						}
      			 });
                
            }
        }).setTitle('系统提示');
    });
    
    
    
    /**
     *修改信息
      */
     $('#btn-edit').click(function(){
         var jqgrid = $('#userJqgrid');
         var rowid = jqgrid.jqGrid('getGridParam','selrow');
         if(!rowid){
             BootstrapDialog.show({
                 title: '系统提示',
                 message: '请选中要修改的数据',
                 type: BootstrapDialog.TYPE_WARNING,
                 buttons: [{
                     label: '关闭',
                     action: function(dialogRef){
                         dialogRef.close();
                     }
                 }]
             });
             return;
         }
         var rowData = jqgrid.jqGrid('getRowData',rowid);
        BootstrapDialog.show({
             title:'修改信息',
             size:BootstrapDialog.SIZE_NORMAL,
             message: function(dialog) {
                 var $message = $('<div></div>');
                 var pageToLoad = dialog.getData('pageToLoad');
                 $message.load(pageToLoad);
                 return $message;
             },
             data: {
                 'pageToLoad': '${ctx}/demo/toUpdateDemo?UUID='+rowData.UUID_H
             },
             buttons: [{
                 label: '关闭',
                 action: function(dialogRef){
                     dialogRef.close();
                     $("#userJqgrid").trigger("reloadGrid");
                 }
             }]
         });
     });

     /**
     *查询信息
      */
     $('#btn-get').click(function(){
         var jqgrid = $('#userJqgrid');
         var rowid = jqgrid.jqGrid('getGridParam','selrow');
         if(!rowid){
             BootstrapDialog.show({
                 title: '系统提示',
                 message: '请选中要查看的数据',
                 type: BootstrapDialog.TYPE_WARNING,
                 buttons: [{
                     label: '关闭',
                     action: function(dialogRef){
                         dialogRef.close();
                     }
                 }]
             });
             return;
         }
         var rowData = jqgrid.jqGrid('getRowData',rowid);
         //alert(rowData.KEYJSON_H);
        BootstrapDialog.show({
             title:'查看信息',
             size:BootstrapDialog.SIZE_NORMAL,
             message: function(dialog) {
                 var $message = $('<div></div>');
                 var pageToLoad = dialog.getData('pageToLoad');
                 $message.load(pageToLoad);
                 return $message;
             },
             data: {
                 'pageToLoad': '${ctx}/demo/getDemoMap?UUID='+rowData.UUID_H
             },
             buttons: [{
                 label: '关闭',
                 action: function(dialogRef){
                     dialogRef.close();
                 }
             }]
         });
     });

});

	function deleteData(id){
		layer.confirm('是否删除？', {
		    btn: ['确定','取消'], 
		    shade: false 
		}, function(){
			 $.ajax({
		         url: '${ctx}/demo/deleteDemo',
		         type: "POST",
		         data:{"ZTBM":id},
		         dataType: "json",
		         error: function(json){
					       layer.msg('数据删除失败，请稍后重试');
					}, 
				success: function(json){
						//alert(json);
						var msg=json.code;
						if(msg=="1"){
							layer.msg('数据删除成功');
		    				 $("#userJqgrid").trigger("reloadGrid");
						}else{
							 layer.msg('数据删除失败，请稍后重试');
							}
						}
			 });
		}, function(){
		    
		});
	}
	
	function getData(id){
		window.location.href ='${ctx}/demo/getDemoMap?ZTBM='+id
	}


	function updateData(id){
		window.location.href ='${ctx}/demo/toUpdateDemo?UUID='+id
             
	}

	function insertData(){
		window.location.href = "${ctx}/demo/init";
	}

</script>
</rapid:override>
<%@ include file="../template/base.jsp"%>