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

	<div class="portlet box blue">
               <div class="portlet-title ">
                    <div class="caption">
                       	角色列表
                    </div>
                    <div class="tools">
<!-- 								<a class="collapse" href="" data-original-title="" title=""> -->
<!-- 								</a> -->
                    </div>
                </div>
                <div class="portlet-body form">
                        <form class="form-horizontal" id="roleForm" method="post">
                        	<span>&nbsp;</span>
                        	<div class="form-group">
								<label class="control-label col-md-1">角色名:</label>
								<div class="col-md-2">
									<input class="form-control" placeholder="请输入角色名" type="text" id="JSM" name="JSM">
								</div>
										
								<label class="control-label col-md-2">角色描述:</label>
								<div class="col-md-2">
									<input class="form-control" placeholder="请输入角色描述" type="text" id="JSMS" name="JSMS">
								</div>
								
                                <label class="control-label col-md-2">角色状态:</label>
                                <div class="col-md-2">
                                   <select id="ZT" class="form-control" name="ZT">
                                   		<option value="">请选择</option>
                                   		<option value="1">启用</option>
                                   		<option value="2">停用</option>
                                   </select>
                                </div>
                            </div>
                            
                            
	                          <div class="form-actions"> 
									<div class="row">
										<div class="col-md-offset-0 col-md-5">
<!-- 											<span style="float: left;"> <button class="btn btn-primary " type="button" id="btn-add" onclick="insertData();"><i class="fa fa-plus"></i>&nbsp;添加角色</button></span> -->
										</div>
										<div class="col-md-offset-0 col-md-5">
											<button type="button"  class="btn btn-primary" id="search"><i class="fa fa-search"></i> 搜 索 </button>
											<a href="${ctx}/role/getInit"><button class="btn btn-warning" id="reset" type="button"><i class="fa fa-refresh"></i> 刷 新 </button></a>
										</div>
									</div>
							</div>	
                        </form>
                        
                    </div>
                </div>
<div style="width:auto;height:auto;margin-top:15px;margin-bottom: 10px;">
            <button class="btn btn-primary btn-sm" type="button" id="btn-add" onclick="insertData();"><i class="fa fa-plus"></i>&nbsp;添加角色</button>
      </div> 
                        <div class="jqGrid_wrapper">
                            <table id="roleJqgrid"></table>
                            <div id="pager_list"></div>
                            <input type="hidden" id="page" value="${page == null ? 1 : page}">
                        </div>
</rapid:override>
<rapid:override name="script">
<script src="${rs}/js/plugins/jqgrid/i18n/grid.locale-cn.js"></script>
<script src="${rs}/js/plugins/jqgrid/jquery.jqGrid.min.js"></script>
<script src="${rs}/js/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="${rs}/js/plugins/layer/layer.js"></script>
<script>
$(document).ready(function () {
    $("#roleJqgrid").jqGrid({
        url:'${ctx}/role/getRoleList',
        datatype: "json",
        height: 'auto',
        autowidth: true,
        mtype:"POST",
        page:$("#page").val(),
        //shrinkToFit: true,
        //multiselect:true,//全选功能
        rownumbers:true,
        rowNum: 10,
        rowList: [10, 20, 30],
        colNames: ['角色名','角色描述','状态','创建时间','操作'],
        colModel: [
            {name: 'JSM',index: 'JSM',align:'center',width:'10%'},
            {name: 'JSMS',index: 'JSMS',align:'center',width:'30%'},
            {name: 'ZT',index: 'ZT',align:'center',width:'10%',
            	formatter:function(val,options,rowObject){
            		if(val==1)return '启用';
            		if(val==2)return '停用';
            	}	
            },
            
           // {name: 'AQJB',index: 'AQJB',align:'center',width:'10%',
           // 	formatter:function(val,options,rowObject){
           // 		if(val==1)return '低';
           // 		if(val==2)return '中';
           // 		if(val==3)return '高';
           // 	}	
           //},
            {name: 'RKRQ',index: 'RKRQ',align:'center',width:'15%',
            	sorttype:"date",formatter:'date',formatoptions:{srcformat: 'Y-m-d H:i:s', newformat: 'Y-m-d H:i:s'}
            },
            {
            	name:'ID',
            	width:'25%',
            	index:'ID',
            	formatter:function(cellvalue, options, rowObject){
            		return	'<BUTTON onclick="toRoleAuthorize(\''+cellvalue+'\');">功能授权</BUTTON>'+
            			'<BUTTON onclick="updateData(\''+cellvalue+'\');">编辑</BUTTON>'+
            			'<BUTTON onclick="deleteData(\''+cellvalue+'\');">删除</BUTTON>';
            	}
            }
        ],
        pager: "#pager_list",
        //viewrecords: true,
        caption: "角色信息",
        //add: true,
        //edit: true,
        //addtext: 'Add',
        //edittext: 'Edit',
        hidegrid: false
    });
   $(window).bind('resize', function () {
        var width = $('.jqGrid_wrapper').width();
        $('#roleJqgrid').setGridWidth(width);
    });
   
   
   //绑定回车事件
	$("body").keydown(function(event) {
	  var e = event||window.event;
     if (e.keyCode == "13") {//keyCode=13是回车键
         $('#search').trigger("click");
         e.preventDefault();
     }
 	});
   /*搜索*/
   $("#search").click(function(){
	   $("#roleJqgrid").jqGrid('setGridParam',{ 
            url:'${ctx}/role/getRoleList',//你的搜索程序地址 
            mtype:"POST",
            postData:{JSM:$("#JSM").val(),JSMS:$("#JSMS").val(),ZT:$("#ZT").val()}, //发送搜索条件 
            page:1 
        }).trigger("reloadGrid"); //重新载入
   });

});

	function deleteData(id){
		layer.confirm('是否删除？', {
		    btn: ['确定','取消'], 
		    shade: false 
		}, function(){
			 $.ajax({
		         url: '${ctx}/role/deleteRole/'+id,
		         type: "POST",
		         data: {},
		         dataType: "json"
		     }).done(function(data,ss) {
		    	  if(data.code == 1){
		    		  layer.msg("该角色已分配用户，删除失败");
		    	  }else{
		    		  layer.msg('数据删除成功');
				    	 $("#roleJqgrid").trigger("reloadGrid");
		    	  }
		    	 
		     }).fail(function(jqXHR, textStatus, errorThrown){
		    	 layer.msg('数据删除失败，请稍后重试');
		     }	 
		     );
		}, function(){
		    
		});
	}
	
	//更新数据
	function updateData(id){
		var page = jQuery("#roleJqgrid").getGridParam('page');//当前页
		window.location.href = "${ctx}/role/toUpdateRole?ID="+id+"&page="+page;
	}
	//插入数据
	function insertData(){
		window.location.href = "${ctx}/role/toAddRole";
	}
	//功能菜单授权
	function toRoleAuthorize(obj){
		var page = jQuery("#roleJqgrid").getGridParam('page');//当前页
		window.location.href = "${ctx}/role/toRoleAuthorize?JSID="+obj+"&page="+page;
	}
	//数据项授权
	function toRoleDataItem(obj){
		var page = jQuery("#roleJqgrid").getGridParam('page');//当前页
		window.location.href = "${ctx}/role/toRoleDataItem?JSID="+obj+"&page="+page;
	}
	
</script>
</rapid:override>
<%@ include file="../../template/base.jsp"  %>