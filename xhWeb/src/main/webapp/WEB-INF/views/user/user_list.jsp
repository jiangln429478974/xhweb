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
       .ui-jqgrid-btable tr.jqgrow td {
			text-overflow : ellipsis;
		}
    </style>
</rapid:override>
<rapid:override name="content">

	<div class="portlet box blue">
               <div class="portlet-title ">
                    <div class="caption">
                       	用户列表
                    </div>
                    <div class="tools"  >
<!-- 								<a class="collapse" href="" data-original-title="" title=""> -->
<!-- 								</a> -->
                    </div>
                </div>
                <div class="portlet-body"  style="display:none;">
	                <form id="userForm" method="post">
	               	 	<div class="form-inline">
		                	<div class="form-group">
								<label>用户名:</label>
								<input class="form-control input-sm" placeholder="请输入用户名" type="text" id="yhm">
						    </div>
						    <div class="form-group">
								<label>手机号:</label>
								<input class="form-control input-sm" placeholder="请输入手机号码" type="text" id="sjhm" onkeyup="value=value.replace(/[\W]/g,'')">								
						    </div>
						    <div class="form-group">
						        <label>姓&nbsp;&nbsp;名:</label>
						        <input type="text" class="form-control input-sm" placeholder="请输入查询的姓名" id="xm">
						    </div>
						    
						</div>
						<div class="form-inline">
						 	<div class="form-group">
						 		<label>部&nbsp;门:</label>
						 		<select name="BMID" id="BMID" class="form-control input-sm"> </select>
						 	</div>
						 	<div class="form-group">
						 		<label>角&nbsp;色:</label>
						 		<select name="JSID" id="JSID" class="form-control input-sm"></select>
						 	</div>
					 		<div class="form-group">
						 		<label>所属区域:</label>
						 		<select name="QYID" id="QYID" class="form-control input-sm"></select>
						 	</div>
						</div>  
                        
                        <div class="form-actions"> 
							<div class="row">
								<div class="col-md-offset-0 col-md-5">
								</div>
								<div class="col-md-offset-0 col-md-5">
									<button type="button"  class="btn btn-primary btn-sm" id="search"><i class="fa fa-search"></i> 搜 索 </button>
									<a href="${ctx}/users/getInit"><button class="btn btn-warning btn-sm" id="reset" type="button"><i class="fa fa-refresh"></i> 刷 新 </button></a>
								</div>
							</div>
						</div>	
                        
                   </form>
                </div>
       </div>
      <div style="width:auto;height:auto;margin-top:15px;margin-bottom: 10px;">
            <button class="btn btn-primary btn-sm" type="button" id="btn-add" onclick="insertData();"><i class="fa fa-plus"></i>&nbsp;添加用户</button>
      </div> 
                        <div class="jqGrid_wrapper">
                            <table id="userJqgrid"></table>
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
    $("#userJqgrid").jqGrid({
        url:'${ctx}/users/getUsersList',
        datatype: "json",
        height: 'auto',
        autowidth: true,
        mtype:"POST",
        page:$("#page").val(),
        //postData:{yy:12},
        //shrinkToFit: true,
        //multiselect:true,//全选功能
        rownumbers:true,
        rowNum: 20,
        rowList: [10, 20, 30],
        colNames: ['用户名','姓名' ,'部门','职务','角色','状态' ,'所属区域','操作'],
    /*     colNames: ['用户名','姓名','接收手机号码','部门','角色','状态','电子邮箱','区域名称','操作'], */
        colModel: [
            {name: 'YHM',index: 'YHM',align:'center',width:'15%'},
            {name: 'XM',index: 'XM',align:'center',width:'10%'},
          /*   {name: 'JSSJHM',index: 'JSSJHM',align:'center',width:'10%'}, */
            {name: 'BMMC',index: 'BMMC',align:'center',width:'15%'},
            {name: 'ZW',index: 'ZW',align:'center',width:'15%'},
            {name: 'JSM',index: 'JSM',align:'center',width:'20%',sortable:false},
            {name: 'ZT',index: 'ZT',align:'center',width:'5%',
            	formatter:function(val,opts,rowObj){
            		if(val==1)return '启用';
            		if(val==2)return '停用';
            	}	
            },
          /*   {name: 'DJYX',index: 'DJYX',align:'center',width:'15%'}, */
            {name: 'QYMC',index: 'QYMC',align:'center',width:'15%'},
            {
            	name:'ID',
            	width:'10%',
            	formatter:function(cellvalue, options, rowObject){
            		return	'<BUTTON class="btn btn-xs blue" onclick="updateData(\''+cellvalue+'\');">编辑</BUTTON>'+
            			'<BUTTON class="btn btn-xs blue"  onclick="deleteData(\''+cellvalue+'\');">删除</BUTTON>';
            	}
            }
        ],
        //sortname:'ZT',
        //sortorder:'desc',
        pager: "#pager_list",
        viewrecords: true,
        caption: "用户列表",
        //add: true,
        //edit: true,
        //addtext: 'Add',
        //edittext: 'Edit',
        hidegrid: false,
    });
   $(window).bind('resize', function () {
        var width = $('.jqGrid_wrapper').width();
        $('#userJqgrid').setGridWidth(width);
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
	   $("#userJqgrid").jqGrid('setGridParam',{ 
            url:'${ctx}/users/getUsersList',//你的搜索程序地址 
            mtype:"POST",
            postData:{xm:$("#xm").val(),sjhm:$("#sjhm").val(),yhm:$("#yhm").val(),jsid:$("#JSID").val(),bmid:$("#BMID").val(),qyid:$("#QYID").val()}, //发送搜索条件 
            page:1 
        }).trigger("reloadGrid"); //重新载入
   });
   
   /*清空*/
   $("#reset").click(function(){
	  $("#xm").val(''); 
	  window.location.reload();
   });
   
   
    $("#btn-delete").click(function () {
        var jqgrid = $('#userJqgrid');
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

    /*
    $('#btn-add').click(function () {
        BootstrapDialog.show({
            title:'添加任务',
            size:BootstrapDialog.SIZE_NORMAL,
            message: function(dialog) {
                var $message = $('<div></div>');
                var pageToLoad = dialog.getData('pageToLoad');
                $message.load(pageToLoad);
                return $message;
            },
            data: {
                'pageToLoad': '${ctx}/admin/user/insertPage'
            }
        });
    });
    */

    /**
    *修改用户信息
     */
    $('#btn-edit').click(function(){
        var jqgrid = $('#userJqgrid');
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
    
    //初始化角色
    $.ajax({
        url: '${ctx}/role/initRoleList',
        type: "POST",
        data: {},
        dataType: "json"
    }).done(function(data,ss) {
   		var list = "<option value=''>请选择角色</option>";
   		for(var i=0; i<data.length; i++){
   			list += "<option value='"+data[i].ID+"'>"+data[i].JSM+"</option>";
   		}
   		$("#JSID").html(list);
    }).fail(function(jqXHR, textStatus, errorThrown){
   	 	layer.msg('数据加载失败，请稍后重试');
    });
    
    
    //所属区域初始化
    $.ajax({
        url: '${ctx}/dept/initSSQYList',
        type: "POST",
        data: {},
        dataType: "json"
    }).done(function(data,ss) {
    	var list = "<option value=''>请选择区域</option>";
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
		         url: '${ctx}/users/deleteUser/'+id,
		         type: "POST",
		         data: {},
		         dataType: "json"
		     }).done(function(data,ss) {
		    	 layer.msg('数据删除成功');
		    	 $("#userJqgrid").trigger("reloadGrid");
		     }).fail(function(jqXHR, textStatus, errorThrown){
		    	 layer.msg('数据删除失败，请稍后重试');
		     }	 
		     );
		}, function(){
		    
		});
	}

	function updateData(id){
		var page = jQuery("#userJqgrid").getGridParam('page');//当前页
		window.location.href = "${ctx}/users/toUpdateUser?ID="+id+"&page="+page;
	}

	function insertData(){
		window.location.href = "${ctx}/users/toAddUser";
	}
	
	/*重置密码*/
	function resetPwd(id){
		window.location.href = "${ctx}/users/toResetPwd?ID="+id;		
	}
</script>
</rapid:override>
<%@ include file="../template/base.jsp"  %>