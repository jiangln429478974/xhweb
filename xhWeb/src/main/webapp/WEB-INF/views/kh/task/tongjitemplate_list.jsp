<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
 
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rs" value="${ctx}/resources" />
 
<rapid:override name="title">宁波市公共信用信息服务平台</rapid:override>
<rapid:override name="css">
    <link href="${rs}/css/plugins/jQueryUI/jquery-ui-1.10.4.custom.min.css" rel="stylesheet">
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

<div class="wrapper wrapper-content  animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox ">
                                  <div class="form-group">
	                                 <div  class="col-md-2">
	                                 	<span class="input-group-btn"> <button type="button" class="btn btn-primary" id="btn_add" style="background-color:#F36A5A">新增</button> </span>
	                               	</div>
	                               	 <div   class="col-md-4"  style="margin-top:4px">
	                               	 	    <span>统计模板名称:</span>
			                               	<input  type="text"/>
	                               	 </div> 
	                               
	                               	<div   class="col-md-4"  style="margin-top:4px">
	                               		<span>启停状态:</span>
	                               		<select style="margin-left:16px">
	                               			<option>所有状态</option>
	                               			<option>启用状态</option>
	                               			<option>停用状态</option>
	                               		</select>
	                               	</div>
                               	  
                               	  <div  class="col-md-2">
                               	     <span class="input-group-btn"> <button type="button" id="btn_search" class="btn btn-primary">检索</button> </span>
                           		  </div>	
                            </div>
                        <br/>
                        <div class="jqGrid_wrapper" style="margin-top:30px">
                            <table id="tzMessageJqgrid"></table>
                            <div id="pager_list"></div>
                    </div>
            </div>
        </div>
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
	 	window.location="${ctx}/task/addtongjiTemplate"; 
   });
   
   $("#tzMessageJqgrid").jqGrid({
       url:'${ctx}/message/getTzMessageList',
       datatype: "json",
       height: 'auto',
       autowidth: true,
       //shrinkToFit: true,
       //multiselect:true,//全选功能
       rowNum: 5,
       rowList: [5, 10, 15],
       colNames: ['部门ID', '模板内容','发送时间','操作'],
       colModel: [
           {
               name: 'BMID',
               index: 'BMID',
               align:'center'
           },
           {
               name: 'MBNR',
               index: 'MBNR',
               align:'center'
           },
           {
               name: 'FSSJ',
               index: 'FSSJ',
               align:'center'
           },
          
           {
           	name:'ID', align:'center',
           	formatter:function(cellvalue, options, rowObject){
           		return '<BUTTON onclick="updateData(\''+cellvalue+'\');">修改</BUTTON>'+
       			'<BUTTON onclick="deleteData(\''+cellvalue+'\');">删除</BUTTON>';
           		//'<BUTTON onclick="insertData(\''+cellvalue+'\');">新增</BUTTON>'+
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
       $('#tzMessageJqgrid').setGridWidth(width);
   });
   
});

function deleteData(ID){
	   
	  // alert(id);
		layer.confirm('是否删除？', {
		    btn: ['确定','取消'], 
		    shade: false 
		}, function(){
			 $.ajax({
		         url: '${ctx}/message/deleteTzMessage/'+ID,
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
			
		}, function(){
		    
		});
	}
	
	function updateData(ID){
		layer.confirm('是否修改？', {
		    btn: ['确定','取消'], 
		    shade: false 
		}, function(){
			
			window.location.href = "${ctx}/message/toUpdateTzMessage?ID="+ID;
		}, function(){
		    
		});
	}
</script>

</rapid:override>
<%@ include file="../../template/base.jsp"  %>