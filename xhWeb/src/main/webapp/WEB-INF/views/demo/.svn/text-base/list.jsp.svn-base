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
	height
	800px;
}

 	<c:out value="${map.CSS }"  escapeXml="false"/>
</style>
</rapid:override>
<rapid:override name="content">
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN VALIDATION STATES-->
			<div class="portlet box blue">
				<!-- begin title-->
				<div class="portlet-title">
					<div class="caption">
						<c:out value="${map.ZTMC }" />
					</div>
				</div>
				<!-- end title -->
				<div class="portlet-body">
					<!-- BEGIN FORM-->
					<form class="form-horizontal" id="myForm" method="post">
						<input type="hidden" name="BMC" value="${map.BMC }" /> <input
							type="hidden" name="ZTBM" value="${map.ZTBM }" />
						<div class="form-body">
							<div class="form-group">
								<div class="input-group col-lg-12">
									<c:out value="${map.BDDY }" escapeXml="false" />

								</div>
							</div>
						</div>

						<div class="form-actions">
							<div class="row">
								<div class="col-md-offset-5 col-md-5">
									<button type="button" class="btn btn-primary btn-sm" id="search"><i class="fa fa-search"></i>搜索</button>
									<button type="reset" class="btn btn-warning btn-sm" id="reset"><i class="fa fa-refresh"></i>刷新</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			
		</div>
	</div>
<div class="row">
			<div class="col-md-12">
				<c:if test="${map.LX==2||map.TYPE==2 }">
				<button class="btn btn-primary " type="button" id="btn-add"
					onclick="insertData();">
					<i class="fa fa-plus"></i>&nbsp;添加
				</button>
				<button class="btn blue " type="button" id="btn-get">
					<i class="fa fa-paste"></i>查看
				</button>
				
				<button class="btn green" type="button" id="btn-edit">
					<i class="fa fa-edit"></i>编辑
				</button>
				<button class="btn red " type="button" id="btn-delete">
					<i class="fa fa-remove"></i> <span class="bold">删除</span>
				</button>
				</c:if>
			</div>
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
        url:'${ctx}/demo/getList',
        datatype: "json",
        height: 'auto',
        autowidth: true,
        mtype:"POST",
        postData:{ZTBM:"${map.ZTBM }"},
//         shrinkToFit: true,
        //multiselect:true,//全选功能
        rownumbers:true,
        rowNum: 20,
        rowList: [10, 20, 30],
        <c:out value="${map.JGDY }"  escapeXml="false"/>
        pager: "#pager_list",
        viewrecords: true,
        caption: "<c:out value="${map.ZTMC }" />",
        //add: true,
        //edit: true,
        //addtext: 'Add',
        //edittext: 'Edit',
        hidegrid: false
    });
    //隐藏状态和异常状态原因两列
//     $("#userJqgrid").setGridParam().hideCol("CLZT").trigger("reloadGrid");
// 	$("#userJqgrid").setGridParam().hideCol("YCYY").trigger("reloadGrid");
    $("#userJqgrid").setGridParam().hideCol("CLZT");
	$("#userJqgrid").setGridParam().hideCol("YCYY");
    $("#userJqgrid").setGridWidth($('.jqGrid_wrapper').width());
});
//结束
   $(window).bind('resize', function () {
        var width = $('.jqGrid_wrapper').width();
        $('#userJqgrid').setGridWidth(width);
// 	   jQuery("#userJqgrid").setGridWidth($('.jqGrid_wrapper').width());
    });
   
      //查看按钮
	  function updateBZ(id){
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
	                'pageToLoad': '${ctx}/demo/get?KEYJSON='+id
	            },
	            buttons: [{
	                label: '关闭',
	                action: function(dialogRef){
	                    dialogRef.close(function(){
	                    });
	                   
	                    if("<%=request.getSession().getAttribute("S_CABZF")%>"=="N" ) 
	                    { 
	   		    		 location.replace(location) ;
	   		    	 }
	                     closeRefresh();
	                }
	            }]
	        });
      }  
      
  /*搜索*/
     $("#search").click(function(){
    	
    	 // 将查询参数融入postData选项对象  
    	   
    	// var fields = $("#myForm").serializeArray();
    	var postData = $("#userJqgrid").jqGrid("getGridParam", "postData"); 
    	var rules="";
    	$("#myForm :input").each(function(i){
			　if($(this).val()) {
					var myname=$(this).attr("name");
// 					郑凯增加，用于根据时间查询，页面开始时间id必须为cxsj_start，结束时间id必须为cxsj_end
					if(myname=="cxsj_start"){
						var CXSJ = $("#cxsj_start").val();
						rules+="\""+"START"+"\":\""+CXSJ+"\",";
					}else if(myname=="cxsj_end"){
						var CXSJ = $("#cxsj_end").val();
						rules+="\""+"END"+"\":\""+CXSJ+"\",";
					}
					//增加截止
					else{
					var myvalue=$(this).val();
					//alert($("#myForm :input").size());
					rules+="\""+myname+"\":\""+myvalue+"\",";
	 				//$.extend(postData, {myname:myvalue});
						}
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
   		         url: '${ctx}/demo/delete',
   		         type: "POST",
   		         data:{"KEYJSON":rowData.KEYJSON_H},
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
         //alert(rowData.KEYJSON_H);
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
                 'pageToLoad': '${ctx}/demo/toUpdate?KEYJSON='+rowData.KEYJSON_H
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
                 'pageToLoad': '${ctx}/demo/get?KEYJSON='+rowData.KEYJSON_H
             },
             buttons: [{
                 label: '关闭',
                 action: function(dialogRef){
                     dialogRef.close();
                 }
             }]
         });
     });

     
 	<c:out value="${map.JSJB }"  escapeXml="false"/>


	function deleteData(id){
		layer.confirm('是否删除？', {
		    btn: ['确定','取消'], 
		    shade: false 
		}, function(){
			 $.ajax({
		         url: '${ctx}/demo/delete',
		         type: "POST",
		         data:{"KEYJSON":id},
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
	
// 	 $('#downZrrxybg').click(function () {
//  	    window.location.href = "${ctx}/ftp/downloadxybg?id=zrrxyb_"+xyjlbgbh;
//  	});
	 
	 function download(val){
		 window.location.href = "${ctx}/ftp/downloadxybg?id=zrrxybg_"+val+".doc";
	 }
	 
	 //点击下载法人信用记录报告
  //function download_fr(val){
	//	 window.location.href = "${ctx}/ftp/downloadxybg?id=frxybg_"+val+".doc";
	// } 
	 
	//查看按钮
	function getData(id){
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
                 'pageToLoad': '${ctx}/demo/get?KEYJSON='+id
             },
             buttons: [{
                 label: '关闭',
                 action: function(dialogRef){
                     dialogRef.close();
                 }
             }]
         });
	}
	//详细内容按钮
	function getDataList(id){
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
                 'pageToLoad': '${ctx}/demo/get2?KEYJSON='+id
             },
             buttons: [{
                 label: '关闭',
                 action: function(dialogRef){
                     dialogRef.close();
                 }
             }]
         });
	}
    //查看详情 jianglina  2016/05/04 增加查看详情
    function getDataAll(id){
    	   
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
                   'pageToLoad': '${ctx}/demo/getAll?KEYJSON='+id
               },
               buttons: [{
                   label: '关闭',
                   action: function(dialogRef){
                       dialogRef.close();
                   }
               }]
           });
    }
    
    
    
	function updateData(id){
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
                 'pageToLoad': '${ctx}/demo/toUpdate?KEYJSON='+id
             },
             buttons: [{
                 label: '关闭',
                 action: function(dialogRef){
                     dialogRef.close();
                     $("#userJqgrid").trigger("reloadGrid");
                 }
             }]
         });
	}

	function insertData(){
		window.location.href = "${ctx}/demo/toAdd?ZTBM=${map.ZTBM }";
	}
	
	/* 操作按钮 */
	function getSjjh(/* filename, */uuid){
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
                 'pageToLoad': '${ctx}/ftp/getErrorMap?UUID='+uuid/* +'&FILENAME='+filename */
             },
             buttons: [{
                 label: '关闭',
                 action: function(dialogRef){
                     dialogRef.close();
                 }
             }]
         });
	}
	
	

</script>
</rapid:override>
<%@ include file="../template/base.jsp"%>