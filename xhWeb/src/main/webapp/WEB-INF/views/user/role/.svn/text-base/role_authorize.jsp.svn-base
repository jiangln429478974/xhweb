<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rs" value="${ctx}/resources" />
<rapid:override name="title">jqgrid</rapid:override>
<rapid:override name="content">
	<div class="portlet box blue">
               <div class="portlet-title ">
                    <div class="caption">
                       	角色功能授权
                    </div>
<!--                     <div class="tools"> -->
<!-- 								<a class="collapse" href="" data-original-title="" title=""> -->
<!-- 								</a> -->
<!--                     </div> -->
                </div>
                <div class="portlet-body form">
                	<br/>
				    <form class="form-horizontal" id="roleForm" method="post">
				     <ul id="tree" class="ztree"></ul>
				         <div class="form-group">
				            <div class="col-lg-offset-3 col-lg-8">
				            	<input type="hidden" id="menus"  name="menus">
				            	<input type="hidden" id="ids"  name="ids">
				            	<input type="hidden" id="JSID"  name="JSID" value="${map.JSID }">
				             </div>
				          </div>
				          
				          
				           <div class="form-actions"> 
									<div class="row">
										<div class="col-md-offset-3 col-md-9">
											<button class="btn blue" type="button" onclick="subData()"><i class="fa fa-check"></i> 提  交</button>
											<button class="btn blue" id="back" type="button" onclick="javascript:window.location.href='${ctx}/role/getInit?page=${page}'"><i class="fa fa-reply"></i> 返  回</button>
										</div>
									</div>
							</div>	
				     </form>
				  </div>
</div>
</rapid:override>
<rapid:override name="script">
<script src="${rs}/js/jquery.form.js"></script>
<script src="${rs}/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${rs}/js/plugins/validate/messages_zh.min.js"></script>
<link href="${rs}/js/plugins/layer/skin/layer.css" rel="stylesheet">
<script src="${rs}/js/plugins/layer/layer.js"></script>
<script src="${rs}/js/zTree/jquery.ztree.core-3.5.js"></script>
<script src="${rs}/js/zTree/jquery.ztree.excheck-3.5.js"></script>
<link href="${rs}/css/zTree/zTreeStyle/zTreeStyle.css" rel="stylesheet">
<!-- Page-Level Scripts -->
<script type="text/javascript">
var treeObj;
var setting = {
        check: {
            enable: true//显示check框
        },
        data: {  
            simpleData: {  
                enable: true ,
                idKey: "id",
    			pIdKey: "pId",
    			rootPId: 0
            }  
        },  
        async: { //动态加载  
            enable: false,//false（ 不动态加载）
            url:"${ctx}/role/initLowerToolMenuList", //加载ztree      
            autoParam:["id","pId","name"],
            type:"post"
			//dataFilter: filter  
		},    
        callback: {  
        	beforeCheck: zTreeBeforeCheck,//用于捕获 勾选 或 取消勾选 之前的事件回调函数
        	beforeExpand: zTreeBeforeExpand,//父节点打开之前调用
        	onAsyncSuccess: zTreeOnAsyncSuccess,//异步加载返回成功调用
        	onExpand: zTreeRegisterTarget,//用于捕获节点被展开的事件回调函数
        	onCheck: zTreeOnCheck//用于捕获 checkbox / radio 被勾选 或 取消勾选的事件回调函数
        }  
    };  
    
    function zTreeBeforeCheck(treeId, treeNode) {
    	/*
    	var sign = false;
    	if(treeNode.level==0){//判断是否一级节点
    		if(treeNode.open==true){//判断节点是否打开
    			sign = true;
    		}else if(treeNode.children!=null && treeNode.children.length>0){//判断是否有子节点
    			sign = true;
    		}
    	}
    	if(sign==false)layer.msg("请先打开父节点浏览内容在全选");
    	*/
        return true;
    }
    function zTreeOnAsyncSuccess(event, treeId, treeNode, msg) {
    	//打开该父节点下所有子节点
    	var nodes = treeNode.children;
        for(var i=0;i<nodes.length;i++){
            treeObj.expandNode(nodes[i],true,false,true,true);
        }
    }
    
    function zTreeBeforeExpand(treeId, treeNode) {
       	//alert(treeNode.pId);
       	return true;
    }
    function zTreeRegisterTarget(event, treeId, treeNode) {  
    	// alert(treeNode.tId + ", " + treeNode.name);
    }  
    function zTreeOnCheck(event, treeId, treeNode) {
        //alert(treeNode.tId + ", " + treeNode.name + "," + treeNode.checked);
        var zTree = $.fn.zTree.getZTreeObj("tree"),  //获取树对象
        nodes = zTree.getCheckedNodes(true),  //获取选中的节点
        v = "";  
        var ids="";  
        for (var i=0, l=nodes.length; i<l; i++) {  
            v += nodes[i].name + ",";  
            ids+=nodes[i].gncdid+",";  
        }
        $("#menus").val(v);//赋值选中的节点名称
        $("#ids").val(ids);//赋值选中的节点id
    }
       
    function createTree(){
        var zNode = [];
        $.ajax({
            url: '${ctx}/role/initToolMenuList', //url  action是方法的名称
            data: { JSID: $("#JSID").val() },//传入角色id
            type: 'POST',
            dataType: "json", //可以是text，如果用text，返回的结果为字符串；如果需要json格式的，可是设置为json
            ContentType: "application/json; charset=utf-8",
            async: false,//同步加载数据
            success: function (data) {
            	layer.closeAll('loading');
               var zNode = jQuery.parseJSON(data);  
                treeObj = $.fn.zTree.init($("#tree"), setting, zNode);  //获取树对象
                nodes = treeObj.getCheckedNodes(true),  //获取选中的节点
                v = "";  
                var ids="";  
                for (var i=0, l=nodes.length; i<l; i++) {  
                    v += nodes[i].name + ",";  
                    ids+=nodes[i].gncdid+",";  
                }
                $("#menus").val(v);//赋值选中的节点名称
                $("#ids").val(ids);//赋值选中的节点id
               // treeObj.expandAll(true); //默认打开节点
				//var nodes = treeObj.transformToArray(treeObj.getNodes());  //获取每一个节点
				//for (var i = 0; i < nodes.length; i++) {
					//treeObj.checkNode(nodes[i], true, true);//选择该节点
				//} 
            },
            error: function (msg) {
                layer.msg("失败");
            }
        });
    }
    

    
    //角色功能授权表单提交
    function subData(){
    	var menus = $("#menus").val();
    	var ids = $("#ids").val();
		//if(menus==''){
		//	layer.msg('请选择功能菜单!');
		//}else{
	    	layer.confirm('是否授权？', {
			    btn: ['确定','取消'], 
			    shade: false 
			}, function(){
				 $.ajax({
			         url: "${ctx}/role/roleAuthorize",
			         type: "POST",
			         data: {menus:menus,JSID:$("#JSID").val(),ids:ids},
			         dataType: "json"
			     }).done(function(data,ss) {
			    	 var code = data.code;
	                 if(code == 0){
	                     layer.msg('授权成功');
	                     form.reset();
	                 }else{
	                 	layer.msg(data.msg);
	                 }
			     }).fail(function(jqXHR, textStatus, errorThrown){
			    	 layer.msg('授权失败，请稍后重试');
			     });
			}, function(){
			    
			});
		//}
    }
    
    $(document).ready(function(){  
    	layer.load(4, {
		    shade: [0.8,'#ccc'] //0.1透明度的白色背景
		});
    	createTree();//加载父类节点
    }); 

</script>
</rapid:override>
<%@ include file="../../template/base.jsp"  %>
