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
                       	部门列表
                    </div>
                    <div class="tools">
<!-- 								<a class="collapse" href="" data-original-title="" title=""> -->
<!-- 								</a> -->
                    </div>
                </div>
                <div class="portlet-body form">
                	<br/>
                        <form class="form-horizontal" id="userForm" method="post">
                        
                        <!-- 	<div class="form-group">
								<label class="control-label col-md-1" style="width: 10%;">部门名称:</label>
								<div class="col-md-3">
								</div>
							</div> -->
							
							<div class="form-inline">
	                        	<div class="form-group" style="margin-left:30px;" >
	                        	    <label class=" ">部门名称:</label>
		                            <select name="BMID" id="BMID" class="form-control input-sm"></select>
	                     	     </div>  
                                 <div class="form-group" style="margin-left:30px;" >
	                                <label class=" ">所属区域：</label>
	                                <select name="QYID"  id="QYID"  class="form-control input-sm">
	                                </select>
                          		  </div>
                            
  							<!-- 	<div class="form-group" >
                                	 <label class="control-label col-md-2" style="padding-left:16px;width:110px;">部门类型:</label>
	                               	 <select name="BMLX" class="form-control" id="BMLX">
	                               	 	<option value="请选择部门类型">请选择部门类型</option>
	                                	<option value="3">数据提供并使用</option>
	                             	  	<option value="1">数据提供</option>
	                             	  	<option value="2">数据使用</option>
	                               	 </select>
                                </div> -->
                               	<div class="form-group" style="margin-left:30px;" >
                                	 <label class="   " style=" ">部门类型:</label>
	                               	 <select name="ISXYB" class="form-control input-sm" id="ISXYB">
	                               	 	<option value="请选择部门类型">请选择部门类型</option>
	                                	<option value="1">市本级部门</option>
	                             	  	<option value="2">区县（市）信用办</option>
	                             	  	<option value="3">区县（市）部门</option>
	                               	 </select>
                                </div>
                           </div>
                           
										
	                          <div class="form-actions"  > 
									<div class="row">
										<div class="col-md-offset-0 col-md-5">
<!-- 											<span style="float: left;"><button class="btn btn-primary " type="button" id="btn-add" onclick="insertData();"><i class="fa fa-plus"></i>&nbsp;添加部门</button></span> -->
										</div>
										<div class="col-md-offset-0 col-md-5">
											<button type="button"  class="btn btn-primary" id="search"><i class="fa fa-search"></i> 搜 索 </button>
											<a href="${ctx}/dept/getInit"><button class="btn btn-warning" id="reset" type="button"><i class="fa fa-refresh"></i> 刷 新 </button></a>
										</div>
									</div>
							</div>	
                        </form>
                        
                    </div>
                </div>
<div style="width:auto;height:auto;margin-top:15px;margin-bottom: 10px;">
            <button class="btn btn-primary btn-sm" type="button" id="btn-add" onclick="insertData();"><i class="fa fa-plus"></i>&nbsp;添加部门</button>
      </div> 
                        <div class="jqGrid_wrapper">
                            <table id="deptJqgrid"></table>
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
	
	
    $("#deptJqgrid").jqGrid({
        url:'${ctx}/dept/getDeptList',
        datatype: "json",
        height: 'auto',
        autowidth: true,
        mtype:"POST",
        page:$("#page").val(),
        //shrinkToFit: true,
        //multiselect:true,//全选功能
        rownumbers:true,
        rowNum: 20,
        rowList: [10, 20, 30],
      /*   colNames: ['部门名称','所属区域','排序','部门类型','部门属性','创建时间','操作'], */
        colNames: ['部门名称','所属区域' ,'部门属性','创建时间','操作'],
        colModel: [
            {name: 'BMMC',index: 'BMMC',align:'center',width:'20%'},
          /*   {name: 'BMMS',index: 'BMMS',align:'center',width:'35%'}, */
            {name: 'QYMC',index: 'QYMC',align:'center',width:'10%'},
            /* {name: 'PX',index: 'PX',align:'center',width:'10%'}, */
         /*    {name: 'BMLX',index: 'BMLX',align:'center',width:'10%',
            	formatter:function(val,options,row){
            		if(val==1)return "数据提供";
            		if(val==2)return "数据使用";
            		if(val==3)return "数据提供并使用";
            	}	
            }, */
            {name: 'ISXYB',index: 'ISXYB',align:'center',width:'10%',
            	formatter:function(val,options,row){
            		if(val==1)return "市本级部门";
            		if(val==2)return "区县（市）信用办";
            		if(val==3)return "区县（市）部门";
            	}	
            },
            {name: 'RKRQ',index: 'RKRQ',align:'center',width:'15%',
            	sorttype:"date",formatter:'date',formatoptions:{srcformat: 'Y-m-d H:i:s', newformat: 'Y-m-d H:i:s'}
            },
            {
            	name:'ID',
            	width:'10%',
            	align:'center',
            	formatter:function(cellvalue, options, rowObject){
            		if(cellvalue=='55636fa1ea164673ad41b23535e4daca'){
            			return	'<BUTTON class="btn btn-xs blue" onclick="updateData(\''+cellvalue+'\');">编辑</BUTTON>';
            		}else{
            			return	'<BUTTON class="btn btn-xs blue"  onclick="updateData(\''+cellvalue+'\');">编辑</BUTTON>   '+
            				'<BUTTON class="btn btn-xs blue" onclick="deleteData(\''+cellvalue+'\');">删除</BUTTON>';
            		} 
            	}
            }
        ],
        pager: "#pager_list",
        //viewrecords: true,
        caption: "部门信息",
        //add: true,
        //edit: true,
        //addtext: 'Add',
        //edittext: 'Edit',
        hidegrid: false
    });
   $(window).bind('resize', function () {
        var width = $('.jqGrid_wrapper').width();
        $('#deptJqgrid').setGridWidth(width);
    });

   
   //绑定回车事件
	$("body").keydown(function(event) {
	  var e = event||window.event;
     if (e.keyCode == "13") {//keyCode=13是回车键
         $('#search').trigger("click");
         e.preventDefault();
     }
 	});
   
	 //初始化部门
    $.ajax({
        url: '${ctx}/dept/initDeptList',
        type: "POST",
        data: {},
        dataType: "json"
    }).done(function(data,ss) {
   		var list = "<option value=''>请选择部门</option>";
   		for(var i=0; i<data.length; i++){
   			list += "<option value='"+data[i].ID+"'>"+data[i].BMMC+"</option>";
   			//st += "<input type='checkbox' name='rr' value='"+data[i].ID+"' onclick='checkItem(this,"+'bb'+")' style='margin-left:10px;' />"+data[i].BMMC;
   		}
   		$("#BMID").html(list);
    }).fail(function(jqXHR, textStatus, errorThrown){
   	 	layer.msg('数据加载失败，请稍后重试');
    });
   
   /*搜索*/
   $("#search").click(function(){
	   
	   var BMMC = $("#BMID").find("option:selected").text();
	   var QYMC = $("#QYID").find("option:selected").text();
	   var ISXYB = $("#ISXYB").find("option:selected").val();
	  
	   if(BMMC=='请选择部门') BMMC ='';
	   if(QYMC=='请选择区域') QYMC ='';
	   if(ISXYB=='请选择部门类型') ISXYB ='';
	   
	   
	    $("#deptJqgrid").jqGrid('setGridParam',{ 
            url:'${ctx}/dept/getDeptList',//你的搜索程序地址 
            mtype:"POST",
            postData:{BMMC:BMMC,QYMC:QYMC,ISXYB:ISXYB}, //发送搜索条件 
            page:1 
        }).trigger("reloadGrid"); //重新载入  
   });
   
    $("#btn-delete").click(function () {
        var jqgrid = $('#deptJqgrid');
        var rowid = jqgrid.jqGrid('getGridParam','selrow');
        if(!rowid){
            BootstrapDialog.show({
                title: '系统提示',
                message: '请选中要删除的用户',
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
        BootstrapDialog.confirm('确定要删除选中用户吗?', function(result){
            if(result) {
                var rowData = jqgrid.jqGrid('getRowData',rowid);
                ajax_post('${ctx}/users/deleteUser',{ID:rowData.ID},function(data){
                    if(data.code == 0){
                        toastr.info('用户删除成功');
                        jqgrid.jqGrid('delRowData',rowid);
                    }else{
                        toastr.error('用户删除失败');
                    }
                });
            }
        }).setTitle('系统提示');
    });
 

    /**
    *修改信息
     */
    $('#btn-edit').click(function(){
        var jqgrid = $('#deptJqgrid');
        var rowid = jqgrid.jqGrid('getGridParam','selrow');
        if(!rowid){
            BootstrapDialog.show({
                title: '系统提示',
                message: '请选中要修改的用户',
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
            title:'修改用户信息',
            size:BootstrapDialog.SIZE_NORMAL,
            message: function(dialog) {
                var $message = $('<div></div>');
                var pageToLoad = dialog.getData('pageToLoad');
                $message.load(pageToLoad);
                return $message;
            },
            data: {
                'pageToLoad': '${ctx}/admin/user/user_edit?userId='+rowData.USER_ID
            }
        });
    });
    
    
  //所属区域初始化
    $.ajax({
        url: '${ctx}/dept/initSSQYList',
        type: "POST",
        data: {},
        dataType: "json"
    }).done(function(data,ss) {
    	var list = "<option value=' '>请选择区域</option>";
   		for(var i=0; i<data.length; i++){
   			list += "<option value='"+data[i].UNID+"'>"+data[i].QYMC+"</option>";
   		}
   		$("#QYID").html(list);
    }).fail(function(jqXHR, textStatus, errorThrown){
   	 	layer.msg('数据加载失败，请稍后重试');
    });
  
  //end ready
  
});

	function deleteData(id){
		layer.confirm('是否删除？', {
		    btn: ['确定','取消'], 
		    shade: false 
		}, function(){
			 $.ajax({
		         url: '${ctx}/dept/deleteDept/'+id,
		         type: "POST",
		         data: {},
		         dataType: "json"
		     }).done(function(data,ss) {
		    	 
		    	 
		    	 if(data.code == 1){
		    		  layer.msg("该部门已分配用户，删除失败");
		    	  }else{
		    		  layer.msg('数据删除成功');
				    	 $("#deptJqgrid").trigger("reloadGrid");
		    	  }
		    	 
		     }).fail(function(jqXHR, textStatus, errorThrown){
		    	 layer.msg('数据删除失败，请稍后重试');
		     }	 
		     );
		}, function(){
		    
		});
	}

	function updateData(id){
		var page = jQuery("#deptJqgrid").getGridParam('page');//当前页
			window.location.href = "${ctx}/dept/toUpdateDept?ID="+id+"&page="+page;
	}

	function insertData(){
			window.location.href = "${ctx}/dept/toAddDept";
	}
	
</script>
</rapid:override>
<%@ include file="../../template/base.jsp"  %>