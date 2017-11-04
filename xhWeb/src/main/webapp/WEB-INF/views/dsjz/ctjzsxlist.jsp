<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rs" value="${ctx}/resources" />

<rapid:override name="title">jqgrid</rapid:override>
<rapid:override name="content">
<div id="wrapper">
<div class="row">
	<div class="col-md-12">
		<!-- BEGIN VALIDATION STATES-->
		<div class="portlet box blue">
			<div class="portlet-title">
				<div class="caption"> 
 
                           冲突基准
				</div>
 
			</div>
			<div class="portlet-body form">
				<!-- BEGIN FORM-->
				<form action="${ctx}/shares/updateShareApply2" id="userForm" class="form-horizontal" method="post">
					<div class="form-body">
									 
									 <div class="form-group" >
<!-- 								        <div class="col-md-11"> -->
						 		<div style="padding-top:20px;padding-left:20px;width:95%;">
									<div id="apply_content_zrr">
									</div>
						        </div>
						     
						 </div>
					</div>
							
					 
				</form>
				<!-- END FORM-->
			</div>
		</div>
		<!-- END VALIDATION STATES-->
	</div>
</div>

</div>
<!-- 页面结束 -->                        
                   
</rapid:override>
<rapid:override name="css">
<style type="text/css"> 
/* .list{ */
/* width: 950px; */
/* } */
/* text-align:center;border:1px 1px solid #ccc; */
table{
  border: 1px  solid #ccc; 
}
td{
  border: 1px  solid #ccc; 
  text-size:16px;
  color:#333;
}
th{
  border: 1px  solid #ccc; 
  text-align:center;
}
li{
 font-size:18px;
}

/* .list li{float:left;width:295px;padding:5px;background-color:#2386ca;border:1px solid #ccc}  */
/* .list li{float:left;width:295px;padding:5px;border:0px;list-style: none;}  */
.content{
margin-left: 40px;
    width: 886px;

}
</style>
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
    $().ready(function () {
		createTreeZrr();
    });
 
        function createTreeZrr(){
           $.ajax({
        	   url: '${ctx}/dsjz/toCtjzSxlist/', //url  action是方法的名称
                data: {},//传入角色id
                type: 'POST',
                dataType: "json", //可以是text，如果用text，返回的结果为字符串；如果需要json格式的，可是设置为json
                ContentType: "application/json; charset=utf-8",
                async: false,//同步加载数据
                success: function (data) {
                    //    treeObj = $.fn.zTree.init($("#tree"), setting, data);  //获取树对象
                     
                	var htm = '';//所有内容
                	var headhtm='';//头部
                	var linenum=1;//
                	var contenthtm='';//部门的列表
                	headhtm+='<div><table    cellpadding="0" cellspacing="0" style="border:1px solid #ccc;width:80%;">';
                	headhtm+='<tr style="height:40px;"><th  width="50">序号</th><th  width="700">自然人信息事项名称</th><th  width="100">操作</th></tr>';
 
                    for(var i=0; i<data.length;i++){  
                    	var n=i+1;
                      	headhtm+='<tr ><td style="text-align:center;height:40px;">'+n+'</td><td style="padding-left:5px;">'+data[i].GXMLMC+'</td><td align="center" ><button type="button" class="btn blue"   onclick="showSx(\''+data[i].GXMLYWMC+'\')"  id="search2">查看</button></td></tr>';
                          } 
                    headhtm+'</table>';
                    htm+=headhtm;
                    htm+='<div style="clear:both;"></div>';
                    htm+=contenthtm;
                    if(data.length!=0){
                    	 $("#apply_content_zrr").html(htm);
                    }
                   
                },
                error: function (msg) {
                    layer.msg("失败");
                }
            });
        } 
      
        function showSx(tname){
        	window.location.href = "${ctx}/dsjz/ctjzlist?TNAME="+tname;
        }
     
</script>

</rapid:override>

<%@ include file="../template/base.jsp"  %>