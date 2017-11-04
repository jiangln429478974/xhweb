<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rs" value="${ctx}/resources" />
<rapid:override name="title">jqgrid</rapid:override>
<rapid:override name="content">

<div class="row">
	<div class="col-md-12">
		<div class="portlet box blue">
			<div class="portlet-title">
				<div class="caption">
					冲突基准
				</div>
			</div>
			<div class="portlet-body form">
				<!-- BEGIN FORM-->
				<form  id="userForm" class="form-horizontal" method="post" style="margin-left:80px;">
					<div class="form-body">
						<div class="form-group">
							<div class="portlet-body flip-scroll">
								<div id="apply_content">
								   <div class="form-group">
									<div style="min-height:50px;_height:50px;width:100%;  border-bottom: 1px solid #eee;">
									 <label class="control-label col-md-1 col-sm-1 col-xs-3" >部门名称:</label>
<!-- 	                                 <div class="col-md-2 col-sm-2 col-xs-4"> -->
 										 <div class="col-md-6">
	                                    <input type="text" class="form-control"  name="BMMC"  id="BMMC" >
	                     	         </div>
	                     	        
	                     	         <button type="button"  class="btn btn-primary" id="btn-search" style="margin-left:50px;">
	                     	             <i class="fa fa-search"></i> 搜 索 
	                     	         </button> 
	                     	         </div>
	                     	         
									 <ul class="list" style="margin-top:30px;">
										<c:forEach var="map" items="${list}"> 
											 <li>
											  <button type="button" id="${map.BMID}"   onclick="showSx('${map.BMID}')" class="btn blue btn-block"> <c:out value="${map.BMMC}" /></button> 
<%--                                          		<c:if test="${map.DYYCL!=0}">  --%>
<%-- 												   <button type="button" id="${map.BMID}"   onclick="showSx('${map.BMID}')" class="btn blue btn-block"> <c:out value="${map.BMMC}" /></button> --%>
<!-- 												   <span style="float:left;margin-top:-40px;margin-left:155px;" class="badge badge-round badge-danger">!</span>  -->
<%-- 												</c:if> --%>
<%-- 												<c:if test="${map.DYYCL==0}">  --%>
<%-- 												   <button type="button" id="${map.BMID}"   onclick="showSx('${map.BMID}')" class="btn blue btn-block"> <c:out value="${map.BMMC}" /></button>  --%>
<%-- 												</c:if>    --%>
											</li>
										</c:forEach>  
									 </ul> 
									  <ul class="list" style="margin-top:30px;">
										 <div id="sxlist">
									    </div>
								    </ul>
								    </div>
								    
						 	    </div>
							</div>
						</div>
				  		 	<input type="hidden" name="UUID"  value="${uuid}">
							<input type="hidden" name="ID"  value="${UUID}">
					</div>
				</form>
				<!-- END FORM-->
			</div>
		</div>
		<!-- END VALIDATION STATES-->
	</div>
</div>
</rapid:override>
<rapid:override name="css">
<link href="${rs}/css/plugins/jQueryUI/jquery-ui-1.10.4.custom.min.css"rel="stylesheet">
<!-- Data Tables -->
<link href="${rs}/css/plugins/jqgrid/ui.jqgrid.css" rel="stylesheet">
<link href="${rs}/js/plugins/layer/skin/layer.css" rel="stylesheet">
<style type="text/css"> 
table{
  border: 1px  solid #ccc;  
}
td{
  border: 1px  solid #ccc;  
  font-size:16px;
  color:#333;
  padding:5px;
}
th{
  border: 1px  solid #ccc;
  text-align:center;
}

.list{
  width: 900px;  
/* width:100%; */

}
.list li{float:left;width:180px;padding:5px;list-style: none;}
.content{
margin-left: 8px;
/*     width: 890px; */

}

.content ul{
    width: 890px;
    list-style-type:none;
}
.content ul li{float:left;width:890px;padding:5px;;border:1px solid #ccc} 
span{
font-weight:bold;
font-size:14px;
}
</style>
</rapid:override>
<rapid:override name="script">
<script src="${rs}/js/plugins/jqgrid/i18n/grid.locale-cn.js"></script>
<script src="${rs}/js/plugins/jqgrid/jquery.jqGrid.min.js"></script>
<script src="${rs}/js/plugins/jquery-ui/jquery-ui.min.js"></script>
<link href="${rs}/js/plugins/layer/skin/layer.css" rel="stylesheet">
<script src="${rs}/js/plugins/layer/layer.js"></script>
<!-- Page-Level Scripts -->
<script type="text/javascript">
$(document).ready(function(){
	 
	var bmid=window.location.search;
    bmid=bmid.substring (bmid.indexOf('=')+1,bmid.length);
//     alert(bmid);
    if(bmid!=''&&bmid!=null&&bmid!='undefined'){
    	 showSx(bmid);
    }
   
});
	 /*搜索*/
 $("#btn-search").click(function(){
	var bmmc = $("#BMMC").val();//搜索内容
	var num=0;
	var numOfBM=0;
    $("button.btn").each(function() {
    	numOfBM=numOfBM+1;
	    var id =$(this).attr("id");
		var mc=$("#"+id).html();
 
		if(mc.indexOf(bmmc)>-1){//忽略大小写>-1或者>=0
			showSx(id);
		    return false;//相当于break
		}else{
			num=num+1;
// 			return true;//相当于continue
		}
      });
	if(num==numOfBM){
		layer.msg('无查询结果');
	}
 });
  
//绑定回车事件
$("body").keydown(function(event) {
  var e = event||window.event;
  if (e.keyCode == "13") {//keyCode=13是回车键
      $('#btn-search').trigger("click");
      e.preventDefault();
  }
});

//进入事项页面
function getSx(tname){
 	window.location.href = "${ctx}/dsjz/ctjzlistForZX?TNAME="+tname;
}


var selectid = "";
function showSx(id){ 
	layer.closeAll('loading');
	layer.load(2,2);
	$("#"+selectid).css("background","#3598dc"); 
	$("#"+id).css("background","#eb7a1e");
	selectid = id;
// 	layer.load(4, {  shade: [0.8,'#ccc'] });//0.1透明度的白色背景
	 $.ajax({
         url: '${ctx}/dsjz/toGetCtjzsxForZX', //url  action是方法的名称
         data: { BMID: id},//部门ID
         type: 'POST',
         dataType: "json", //可以是text，如果用text，返回的结果为字符串；如果需要json格式的，可是设置为json
         ContentType: "application/json; charset=utf-8",
         async: false,//同步加载数据
         success: function (data) {
             
        	 layer.closeAll('loading');
//         	 layer.msg(data[0].BMID);
         	 var htm = '';
		 	 var contenthtm  ='';
// 		 	for(var k=0; k<data.length;k++){//遍历每个事项 
//         	   if(data[k].GXMLMC=='总量'){
//         		   contenthtm+='<div style="padding:5px;"><span>异常总量(</span><span style="font-weight:bold;color:red;">'+data[k].YCZL+'</span>'+
//         				   	   '<span>)当月待核实量(</span><span style="font-weight:bold;color:red;">'+data[k].DYYCZL+'</span>'+
//         				   	   '<span>)当月已核实量(</span><span style="font-weight:bold;color:red;">'+data[k].DYYHS+'</span><span>)</span></div>';
//         	   }
// 		 	}
		 	contenthtm+='<div class="content" id="'+id+'"  style=" width:98%;">';
		 	contenthtm+= '<table style="width:100%;float:left;">';
		 	contenthtm+= '<th  style="height:40px;width:40px;" >序号</th>'+
		 				'<th  style="width:680px;" >事项名称</th>'+
        		 		'<th  style="width:70px;" >异常总量</th>'+
//         		 		'<th  style="width:100px;">当月异常总量</th>'+
// 						'<th  style="width:140px;" >当月待核实异常量</th>'+
//         		 		'<th  style="width:150px;">当月已核实异常量</th>'+
        		 		'<th  style="width:100px;" >操作</th>';
        	 
        	for(var k=0; k<data.length;k++){//遍历每个事项 
        	   if(data[k].GXMLMC!='总量'){
	        		if(data[k].SXID!='2d8b83c111c34507a91bf483724eeff7'){
	        			contenthtm+= '<tr>'+
	        						 '<td style="text-align:center;">'+k+1+'</td>' +
								   	 '<td>'+data[k].GXMLMC+'</td>' +
								   	  '<td style="text-align:center;">'+data[k].CTJZSL+'</td>'
// +
// 					             	  '<td style="text-align:center;">'+data[k].DYYCZL+'</td>'+
// 	        			              '<td style="text-align:center;">'+data[k].DYYHS+'</td> '
										;
		              
						contenthtm+='<td style="text-align:left"><button type="button" class="btn blue" style=" "  onclick="getSx(\''+data[k].GXMLYWMC+'\')" >进入事项</button></td></tr>';
// 	           			if(data[k].DYYCZL==0){
// 	  	            	  contenthtm+='<td style="text-align:left"><button type="button" class="btn blue" style=" "  onclick="getSx(\''+data[k].GXMLYWMC+'\')" >进入事项</button></td></tr>';
// 		  	              }else{
// 		  	            	  contenthtm+='<td style="text-align:left"><span><button type="button" class="btn blue"  style="float:left;"  onclick="getSx(\''+data[k].GXMLYWMC+'\')" >进入事项</button></span>'+
// 		  	            	  						'<span style="float:left;margin-top:-40px;margin-left:75px;" class="badge badge-round badge-danger">!</span></td></tr>';
// 		  	              }   
				    }
        	  } 
	         }
        	contenthtm+='</table></div>';	
         htm+='<div style="clear:both;"></div>';
         htm+=contenthtm;
         $("#sxlist").html(htm);
     },
    error: function (msg) {
        layer.msg("失败");
    }
 });
}

</script>
</rapid:override>
<%@ include file="../template/base.jsp"  %>