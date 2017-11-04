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
                       	角色数据项授权
                    </div>
<!--                     <div class="tools"> -->
<!--                     </div> -->
                </div>
                <div class="portlet-body form">
				    <form class="form-horizontal" id="roleForm" method="post">
				  		 <input type="hidden" id="JSID"  name="JSID" value="${map.JSID }">
				  		 <input type="hidden" id="XXSXID"  name="XXSXID" value="">
				  		 <input type="hidden" id="PNODEID"  value="">
				  		 <input type="hidden" id="INDEX"  value="">
				         <ul id="tree" class="ztree" style="width:48%;float:left;overflow: hidden;"></ul>
				         <div style="float:right;width:2%"></div>
				         <div class="ztree" style="width:50%;float:left;border:1px solid gray;border-radius:5px;padding: 10px;margin-top:10px;">
				         	<div style="width:100%;float:left;" id="gxml">
				         		<span>无数据显示</span>
				         	</div>
				         	<div  style="width:100%;float:left;height:40px;"></div>
				         	<div style="width:100%;float:left;">
									<div  style="width:100%;float:left;height:10px;"></div>
										<div class="row">
											<div style="text-align: center;">
												<span style="float: left;" id="checkSpan"></span>
												<button class="btn blue" type="button" onclick="subData()" style="padding-top:6px;padding-bottom:6px;padding-left:12px;padding-right:12px;">提  交</button>
												<a href="${ctx}/role/getInit?page=${page}"><button class="btn blue" id="back" type="button" style="padding-top:6px;padding-bottom:6px;padding-left:12px;padding-right:12px;">返  回</button></a>
											</div>
										</div>
				         	</div>
				         	
				         
				         </div>
				         
				           <div class="form-actions"> 
									<div class="row">
										<div class="col-md-offset-5 col-md-9">
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
            enable: true
        },
        data: {  
        	key: {
        		title: "t"//这里的t表示节点内的title属性
        	},
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
        	onClick: zTreeOnClick,//用于捕获节点被点击的事件回调函数
        	beforeCheck: zTreeBeforeCheck,//用于捕获 勾选 或 取消勾选 之前的事件回调函数
        	beforeExpand: zTreeBeforeExpand,//父节点打开之前调用
        	onAsyncSuccess: zTreeOnAsyncSuccess,//异步加载返回成功调用
        	onExpand: zTreeRegisterTarget,//用于捕获节点被展开的事件回调函数
        	onCheck: zTreeOnCheck//用于捕获 checkbox / radio 被勾选 或 取消勾选的事件回调函数
        }  
    };  
    
    
	function zTreeOnClick(event, treeId, treeNode) {
		var id = treeNode.itemId;
		//alert(treeNode.getParentNode().tId);
		//alert(treeObj.getNodeIndex(treeNode));
		$("#checkSpan").empty();
		$("#checkSpan").append("<input type='checkbox' onclick='checkAll()' id='checkall'>&nbsp;全选");//添加全选复选框
		$("#XXSXID").val(id);//点击给表单赋值信息事项id
		$("#PNODEID").val(treeNode.getParentNode().tId);//记录当前节点父节点id
		$("#INDEX").val(treeObj.getNodeIndex(treeNode));//当面节点序号
		if(id.length==32){//判断是否是信息事项 如果是  单击事件有效
	        $.ajax({
	            url: '${ctx}/role/getXxnr', //url  action是方法的名称
	            data: { ID: id,JSID:$("#JSID").val() },//传入信息事项id,角色id
	            type: 'POST',
	            dataType: "json", //可以是text，如果用text，返回的结果为字符串；如果需要json格式的，可是设置为json
	            ContentType: "application/json; charset=utf-8",
	            async: false,//同步加载数据
	            success: function (data) {
	            	 $("#gxml span").remove();//移除数据
	            	 var num = 0;
	            	 for(var i=0; i<data.length; i++){//动态添加checkbox
	            		 var input = "";
	            		 if(data[i].check=='true'){
	            			   num+=1;
	                    	   input="<span><input onclick='checkData()' value='"+data[i].ID+"' id='option1' type='checkbox' name='SJXID' checked='checked'>&nbsp;"+data[i].SJXZWMC+"</span><span style='margin-left:15px;'>&nbsp;</span>"; 
	            		 }else input="<span><input onclick='checkData()' value='"+data[i].ID+"' id='option1' type='checkbox' name='SJXID' >&nbsp;"+data[i].SJXZWMC+"</span><span style='margin-left:15px;'>&nbsp;</span>"; 
	                     $("#gxml").append(input);
	                 } 
	            	 //如果后台传来的数据项全选  则默认选中全选框
	                     if(num==$("input[name='SJXID']").length)$("#checkall").attr('checked',true);
	            },
	            error: function (msg) {
	                layer.msg("无数据");
	            }
	        });
		}else{
			$("#gxml span").remove();//移除数据
            var span = "<span>无数据显示</span>";
            $("#gxml").append(span);
		}
	    return true;
	}
    function zTreeBeforeCheck(treeId, treeNode) {
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
    	return true;
    }  
    function zTreeOnCheck(event, treeId, treeNode) {
        //alert(treeNode.tId + ", " + treeNode.name + "," + treeNode.checked);
        var zTree = $.fn.zTree.getZTreeObj("tree"),  //获取树对象
        nodes = zTree.getCheckedNodes(true),  //获取选中的节点
        v = "";  
        var ids="";  
        for (var i=0, l=nodes.length; i<l; i++) {  
            v += nodes[i].name + ",";  
            ids+=nodes[i].id+",";  
        }
        $("#menus").val(v);//赋值选中的节点
    }
       
    function createTree(){
        var zNode = [];
        $.ajax({
            url: '${ctx}/role/initRoleDataItem', //url  action是方法的名称
            data: { JSID: $("#JSID").val() },//传入角色id
            type: 'POST',
            dataType: "json", //可以是text，如果用text，返回的结果为字符串；如果需要json格式的，可是设置为json
            ContentType: "application/json; charset=utf-8",
            async: false,//同步加载数据
            success: function (data) {
            	layer.closeAll('loading');
                treeObj = $.fn.zTree.init($("#tree"), setting, data);  //获取树对象
            },
            error: function (msg) {
                layer.msg("失败");
            }
        });
    }
    

    
    //角色数据项授权表单提交
    function subData(){
    	if($("input[name='SJXID']").length>0){
	    	layer.confirm('是否授权？', {
			    btn: ['确定','取消'], 
			    shade: false 
			}, function(){
				 $.ajax({
			         url: "${ctx}/role/authorizeSJX",
			         type: "POST",
			         data: $('#roleForm').serialize(),
			         dataType: "json"
			     }).done(function(data,ss) {
			    	 var code = data.code;
	                 if(code == 0){
	                     layer.msg('授权成功');
	                 }else{
	                 	layer.msg(data.msg);
	                 }
			     }).fail(function(jqXHR, textStatus, errorThrown){
			    	 layer.msg('授权失败，请稍后重试');
			     });
				}, function(){
				    
				});
    	}else{
    		 layer.msg('请选择数据项后提交!');
    	}
    }
    
    
    //判断复选框是否选中
    function checkData(){
    	var treeObj = $.fn.zTree.getZTreeObj("tree");
    	var pnodeId = $("#PNODEID").val();
    	var index = $("#INDEX").val();
    	var node = treeObj.getNodeByTId(pnodeId);
    	//alert(node.children[0].checked);
    	var len = $("input:checkbox:checked").length;//已选中的复选框
    	if(len==0){
    		treeObj.checkNode(node.children[index], false, true);
    	}else{
    		treeObj.checkNode(node.children[index], true, true);
    		treeObj.checkNode(node.children[index].getParentNode(), true, false);
    	}
    	//判断是否全选全不选
    	if($("input[name='SJXID']:checked").length==$("input[name='SJXID']").length)$("#checkall").attr("checked",true);
    	else $("#checkall").attr("checked",false);
    }
    
  //全选全不选
    function checkAll(){
    	var $subBox = $("input[name='SJXID']");
    	$subBox.attr("checked",$subBox.length == $("input[name='SJXID']:checked").length ? false : true);
    	checkData(); //判断复选框是否选中
    }
    
    
    $(document).ready(function(){  
    	layer.load(3, {
		    shade: [0.8,'#ccc'] //0.1透明度的白色背景
		});
    	createTree();//加载父类节点
    }); 

</script>
</rapid:override>
<%@ include file="../../template/base.jsp"  %>
