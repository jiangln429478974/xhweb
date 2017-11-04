<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rs" value="${ctx}/resources" />
<rapid:override name="title">jqgrid</rapid:override>
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
<div id="wrapper">
<nav class="navbar-default navbar-static-side" role="navigation">
<div class="sidebar-collapse">
<ul class="nav" id="side-menu">
<li class="nav-header">

    <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-circle" src="img/profile_small.jpg" />
                             </span>
        <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                                <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">Beaut-zihan</strong>
                             </span>  <span class="text-muted text-xs block">超级管理员 <b class="caret"></b></span> </span>
        </a>
        <ul class="dropdown-menu animated fadeInRight m-t-xs">
            <li><a href="form_avatar.html">修改头像</a>
            </li>
            <li><a href="profile.html">个人资料</a>
            </li>
            <li><a href="contacts.html">联系我们</a>
            </li>
            <li><a href="mailbox.html">信箱</a>
            </li>
            <li class="divider"></li>
            <li><a href="login.html">安全退出</a>
            </li>
        </ul>
    </div>
    <div class="logo-element">
        cssnb
    </div>

</li>
<li>
    <a href="index.html"><i class="fa fa-th-large"></i> <span class="nav-label">主页</span> <span class="fa arrow"></span></a>
    <ul class="nav nav-second-level">
        <li><a href="index_1.html">主页示例一</a>
        </li>
        <li><a href="index_2.html">主页示例二</a>
        </li>
        <li><a href="index_3.html">主页示例三</a>
        </li>
    </ul>
</li>

<li>
    <a href="index.html#"><i class="fa fa-sitemap"></i> <span class="nav-label">菜单 </span><span class="fa arrow"></span></a>
    <ul class="nav nav-second-level">
        <li>
            <a href="index.html#">三级菜单 <span class="fa arrow"></span></a>
            <ul class="nav nav-third-level">
                <li>
                    <a href="index.html#">三级菜单 01</a>
                </li>
                <li>
                    <a href="index.html#">三级菜单 01</a>
                </li>
                <li>
                    <a href="index.html#">三级菜单 01</a>
                </li>

            </ul>
        </li>
        <li><a href="index.html#">二级菜单</a>
        </li>
        <li>
            <a href="index.html#">二级菜单</a>
        </li>
        <li>
            <a href="index.html#">二级菜单</a>
        </li>
    </ul>
</li>
</ul>

</div>
</nav>

<div id="page-wrapper" class="gray-bg dashbard-1">
    <div class="row border-bottom">
        <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
                <form role="search" class="navbar-form-custom" method="post" action="search_results.html">
                    <div class="form-group">
                        <input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search" id="top-search">
                    </div>
                </form>
            </div>
            <ul class="nav navbar-top-links navbar-right">
                <li>
                    <span class="m-r-sm text-muted welcome-message"><a href="index.html" title="返回首页"><i class="fa fa-home"></i></a>欢迎使用H+后台主题</span>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle count-info" data-toggle="dropdown" href="index.html#">
                        <i class="fa fa-envelope"></i>  <span class="label label-warning">16</span>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <div class="dropdown-messages-box">
                                <a href="profile.html" class="pull-left">
                                    <img alt="image" class="img-circle" src="img/a7.jpg">
                                </a>
                                <div class="media-body">
                                    <small class="pull-right">46小时前</small>
                                    <strong>小四</strong> 项目已处理完结
                                    <br>
                                    <small class="text-muted">3天前 2014.11.8</small>
                                </div>
                            </div>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="dropdown-messages-box">
                                <a href="profile.html" class="pull-left">
                                    <img alt="image" class="img-circle" src="img/a4.jpg">
                                </a>
                                <div class="media-body ">
                                    <small class="pull-right text-navy">25小时前</small>
                                    <strong>国民岳父</strong> 这是一条测试信息
                                    <br>
                                    <small class="text-muted">昨天</small>
                                </div>
                            </div>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="text-center link-block">
                                <a href="mailbox.html">
                                    <i class="fa fa-envelope"></i>  <strong> 查看所有消息</strong>
                                </a>
                            </div>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle count-info" data-toggle="dropdown" href="index.html#">
                        <i class="fa fa-bell"></i>  <span class="label label-primary">8</span>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="mailbox.html">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> 您有16条未读消息
                                    <span class="pull-right text-muted small">4分钟前</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="profile.html">
                                <div>
                                    <i class="fa fa-qq fa-fw"></i> 3条新回复
                                    <span class="pull-right text-muted small">12分钟钱</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="text-center link-block">
                                <a href="notifications.html">
                                    <strong>查看所有 </strong>
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </div>
                        </li>
                    </ul>
                </li>


                <li>
                    <a href="login.html">
                        <i class="fa fa-sign-out"></i> 退出
                    </a>
                </li>
            </ul>

        </nav>
    </div>

    <div class="wrapper wrapper-content  animated fadeInRight">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox ">
                    <div class="ibox-title">
                        <h5>用户查询</h5>
                    </div>
                    <div class="ibox-content">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="请输入查询的姓名">
                                <span class="input-group-btn"> <button type="button" class="btn btn-primary">搜索</button> </span>
                            </div>
                        <hr>
                        <p>
                            <button class="btn btn-primary " type="button"id="btn-add"><i class="fa fa-plus"></i>&nbsp;添加用户</button>
                            <button class="btn btn-info " type="button" id="btn-edit"><i class="fa fa-paste"></i>修改用户</button>
                            <button class="btn btn-warning " type="button" id="btn-delete"><i class="fa fa-remove"></i>  <span class="bold">删除用户	</span>
                            </button>
                            <button class="btn btn-warning " type="button" id="goUpload" ><i class="fa fa-remove"></i>  <span class="bold">上传测试</span>
                            </button>
                        </p>
                        <div class="jqGrid_wrapper">
                            <table id="userJqgrid"></table>
                            <div id="pager_list"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="pull-right">
            By：<a href="../../default.htm" target="_blank">zihan's blog</a>
        </div>
        <div>
            <strong>Copyright</strong> H+ &copy; 2014
        </div>
    </div>

</div>
</div>
</rapid:override>
<rapid:override name="script">
<!-- jqGrid -->
<script src="${rs}/js/plugins/jqgrid/i18n/grid.locale-cn.js"></script>
<script src="${rs}/js/plugins/jqgrid/jquery.jqGrid.min.js"></script>
<script src="${rs}/js/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="${rs}/js/plugins/layer/layer.js"></script>
<!--  <script src="${rs}/js/plugins/layer/layer.min.js"></script>
-->
<!-- Page-Level Scripts -->
<script>
$(document).ready(function () {
    $("#userJqgrid").jqGrid({
        url:'${ctx}/admin/user/findUserList',
        datatype: "json",
        height: 450,
        autowidth: true,
        //shrinkToFit: true,
        //multiselect:true,//全选功能
        rowNum: 20,
        rowList: [10, 20, 30],
        colNames: ['ID', 'RES_ID','COLLECTION_MODE','DREQUENCY','STATUS','COUNT','EXCEPTION_COUNT','操作'],
        colModel: [
            {
                name: 'ID',
                index: 'ID'
            },
            {
                name: 'RES_ID',
                index: 'RES_ID'
            },{
                name: 'COLLECTION_MODE',
                index: 'COLLECTION_MODE'
            },{
                name: 'FREQUENCY',
                index: 'FREQUENCY'
                /* formatter:function(cellvalue, options, rowObject){
                    if(cellvalue == '0')return '男';
                    else if(cellvalue == '1')return '女';
                    else return '';	
                } */
            },{
                name: 'STATUS',
                index: 'STATUS'
            },{
                name: 'COUNT',
                index: 'COUNT'
            },{
                name: 'EXCEPTION_COUNT',
                index: 'EXCEPTION_COUNT'
            },{
            	name:'ID',
            	formatter:function(cellvalue, options, rowObject){
            		return '<BUTTON onclick="insertData(\''+cellvalue+'\');">新增</BUTTON>'+
            			'<BUTTON onclick="updateData(\''+cellvalue+'\');">修改</BUTTON>'+
            			'<BUTTON onclick="deleteData(\''+cellvalue+'\');">删除</BUTTON>';
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
   $(window).bind('resize', function () {
        var width = $('.jqGrid_wrapper').width();
        $('#userJqgrid').setGridWidth(width);
    });

   /* 上传文件测试 */
   $("#goUpload").click(function(){
	   window.location.href = '${ctx}/admin/uploadtest';
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
                ajax_post('${ctx}/admin/user/deletedata',{ID:rowData.ID},function(data){
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
});

function deleteData(id){
	layer.confirm('是否删除？', {
	    btn: ['确定','取消'], 
	    shade: false 
	}, function(){
		 $.ajax({
	         url: '${ctx}/admin/user/deletedata/'+id,
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
	layer.confirm('是否修改？', {
	    btn: ['确定','取消'], 
	    shade: false 
	}, function(){
		window.location.href = "${ctx}/admin/user/editPage?ID="+id;
	}, function(){
	    
	});
}

	function insertData(){
		layer.confirm('是否新增？', {
		    btn: ['确定','取消'], 
		    shade: false 
		}, function(){
			window.location.href = "${ctx}/admin/user/insertPage";
		}, function(){
		    
		});
	}
</script>
</rapid:override>
<%@ include file="../template/base.jsp"  %>