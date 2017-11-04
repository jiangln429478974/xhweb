<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rs" value="${ctx}/resources" />
<rapid:override name="title">宁波市公共信用信息工作平台</rapid:override>
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

    
/*全局s*/ 
*{ margin:0;}
body{ background-color:#f3f3f3; font-family:"微软雅黑","Hiragino Sans GB"; font-size:12px;}
a{ text-decoration:none; }
ul{ margin:0; border:0; padding:0;}
ul li{ list-style:none;}
/*全局j*/ 
.dbsx{  -moz-border-radius: 5px;      /* Gecko browsers */
    -webkit-border-radius: 5px;   /* Webkit browsers */
    border-radius:5px;            /* W3C syntax */ border:1px solid #0cacc4; height:40px; position:relative;background-color:#fff; }

.dbsx_bt{ width:125px; background-color:#0cacc4;  line-height:40px; float:left; color:#fff; padding:0 0 0 30px; font-size:16px;position:relative;}
.dbsx_bt:after{
	 content: " ";
	display:block;
	width:0px;
    height: 0px;
	
    border-top: 8px solid transparent;
    border-left: 6px solid #0cacc4;
    border-bottom: 8px solid transparent;
	position:absolute;
	left:125px;
	top:12px;
}
.dbsx_nr{ padding:0 20px;}
.dbsx_nr ul{ padding:0 20px 0 140px;}
.dbsx_nr ul li{ float:left; padding:0 40px; line-height:40px; font-size:14px; color:#00a5e9;}
.dbsx_nr ul li span{ color:red;}
.dbsx_nr ul li .fontv{ color:#777}
.dbsx_nr ul li .fontw{ color:#00a5e9}
.dbsx_nr ul li a{ color:#00a5e9;}
.dbsx_nr ul li a:hover{text-decoration:underline; color:#168cbc;}

.listc_div{ padding:0 20px;}
.listc_div ul li{ line-height:26px; padding:5px; font-size:14px;}
.listc_div ul li span{ float:right; font-size:12px; color:#666;}
.listc_div ul li a{ color:#000; font-size:14px;}
.listc_div ul li a:hover{ text-decoration:underline; color:#006ec2;}
 
.list_right4{min-height:555px;_height:555px; padding:20px;}
.list_right4 .list_righth3{ font-family:"微软雅黑"; font-size:24px; text-align:center; line-height:50px;}
.list_right4 .list_righth4{ border:1px solid #dcdcdc; background-color:#fafafa; line-height:30px; height:30px; text-align:center; font-weight:normal; color:#555;}

.z_show{ font-family:"微软雅黑"; line-height:28px; color:#333; font-size:14px; padding:0 20px}
.fhome{ padding:20px; text-align:center;}
.fhome a{  padding:0 20px; color:#006ec2;font-size:14px;}
.fhome a:hover{ text-decoration:underline; }
</style>
</rapid:override>
<rapid:override name="content">

			 <div class="dbsx">
            	<div class="dbsx_bt">待办事项</div>
                <div class="dbsx_nr">
                	<ul>
                    <li><a id="yycl" href="#"><span id="zxyy" class="fontw"></span><span id="bmyy"  class="fontw"></span></a></li>
                    <li><a id="hiddengx" href="#"> <span id="scdata" class="fontw"></span></a></li>
                    <li><a id="hiddenxx" href="${ctx}/message/getZnmessage"> <span id="zndata" class="fontw"></span></a></li> 
                	</ul>
                </div>
            </div>
            <br/>
　
			 
			　 <iframe name="left" id="rightMain" src="http://10.19.13.243:8081/col/col90/index.html" frameborder="false" 
							 scrolling="auto" style="border:none;" width="100%"  height="180" allowtransparency="true">
				</iframe>
			
			　

</rapid:override>

<rapid:override name="script">

<script src="${rs}/global/plugins/morris/morris.min.js" type="text/javascript"></script>
<script src="${rs}/admin/pages/scripts/index3.js" type="text/javascript"></script>
<script src="${rs}/js/plugins/jqgrid/i18n/grid.locale-cn.js"></script>
<script src="${rs}/js/plugins/jqgrid/jquery.jqGrid.min.js"></script>
<script src="${rs}/js/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="${rs}/js/plugins/layer/layer.js"></script>
<script src="${ctx}/resources/dist/echarts-all.js"></script>
<script src="${rs}/js/plugins/validate/messages_zh.min.js"></script>
<script>
$(document).ready(function () {
	
	$.ajax({
		type:"post",
		url:'${ctx}/Initpage/getBMID',
		dataType:"json",
		data:{},
		success:function(data){
			if(data.BMID=="55636fa1ea164673ad41b23535e4daca"){
				$("#gg").attr("href","${ctx}/notices/list");
				$.ajax({
					type:"post",
					url:'${ctx}/Initpage/getZXZXCount',
					dataType:"json",
					data:{},
					success:function(data){
						$("#bmzx").text("在线咨询");
						if(data==null||data==''){
							$("#zxdata").append("<span>无权限</span>");
						}else{ 
							//$("#zxzx").attr('href','${ctx}/zx/list');
							$("#zxzx").attr('onclick','zx_submit()');
							$("#znxx").text("待处理");
							$("#zxdata").append("<span>"+data+"</span>条");
						}
					},
					error:function(){
					}
				});
			} else {
				$("#gg").attr("href","${ctx}/notices/zflist");
				$.ajax({
					type:"post",
					url:'${ctx}/Initpage/getBMData',
					dataType:"json",
					data:{},
					success:function(data){
						$("#bmzx").text("部门数据信息");
						if(data==0){
							$("#zxdata").append("<span>无权限</span>");
						}else{
							
							$("#znxx").text("数据条数");
							//$("#zxzx").attr('onclick','zx_submit()');
							$("#zxdata").append("<span>"+data+"</span>条");
						}
						
					},
					error:function(){
					}
				});
				
			}
		}
	});
	$.ajax({
		type:"post",
		url:'${ctx}/Initpage/getYytjs',
		dataType:"json",
		data:{},
		success:function(data){
			 
			if(data.bmid==""||data.bmid=="undefined"||data.bmid==null){ 
				
				
				
				if(data.yytjs==null){
// 					$("#hiddengx").attr("href","#");
					$("#zxyy").append("[异议处理]<span>无权限</span>");
					$("#hiddengx").attr("href","#");
// 					$("#zxyy").append("待处理<span>0</span>条");
				}
				else{
// 					$("#hiddengx").attr("href","${ctx}/shares/applist"); 
					$("#yycl").attr('onclick','yycl_submit(\''+data.YYTYPE+'\')'); 		 
// 					[异议处理]<span>(6)</span><span class="fontv">条信息未处理</span>		
					$("#zxyy").append("[异议处理]<span>("+data.yytjs+")</span><span class='fontv'>条信息未处理</span>");
				}
			} else { 
				if(data.yytjs==null){
					$("#bmyy").append("[异议处理]<span>无权限</span>");
				}else{
 					$("#yycl").attr('onclick','yycl_submit(\'1\')'); 
					$("#bmyy").append("[异议处理]<span>("+data.yytjs+")</span><span class='fontv'>条信息未处理</span>");
				}
			}
		}
	});
	$.ajax({
		type:"post",
		url:'${ctx}/Initpage/bquery',
		dataType:"json",
		data:{},
		success:function(data){
			
//		 	<li><span>2016-06-13</span><a href="#">· &nbsp;&nbsp;我市城市信用综合指数在全国36个主要城市</a>	 </li>
// 			var rowStr = "<tr><th>通知公告名称</th><th>发布时间</th></tr>";
			var rowStr ="";
			for (var i=0; i<data.length; i++){
				var rowObj = data[i];
				if(i%5==0){
					rowStr += "<li>";
				} else if(i%5==1){
					rowStr += "<li>";
				} else if(i%5==2){
					rowStr += "<li>";
				} else if(i%5==3){
					rowStr += "<li>";
				} else if(i%5==4){
					rowStr += "<li>";
				}
				var fbsj = " ";
				if(rowObj.FBSJ!="undefined" && rowObj.FBSJ!=null){
					fbsj = rowObj.FBSJ;
				}
				rowStr += "<span>"+fbsj+"</span><a class='noticeDetail' id='"+rowObj.ID+"'>&bull;&nbsp;&nbsp;"+rowObj.TZGGMC+"</a></li>";
// 				rowStr += "<td width='70%'><a class='noticeDetail' id='"+rowObj.ID+"'>"+rowObj.TZGGMC+"</a></td>" + 
// 								"<td width='30%'>"+fbsj+"</td>";
// 				rowStr += "</tr>";
			}
			$("#tzgg").append(rowStr);
		    $(window).bind('resize', function () {
		        var width = $('.jqGrid_wrapper').width();
		        $('#tzgg').setGridWidth(width);
		    });
		}
	});

	$.ajax({
		type:"post",
		url:'${ctx}/Initpage/getStationInfo',
		dataType:"json",
		data:{},
		success:function(data){
			$("#zntitle").text("消息管理");
			if(data==null||data==''){
// 				$("#hiddenxx").attr("href","#");
// 				$("#zndata").append("<span>无权限</span>");
				$("#zndata").append("[站内消息]<span>(0)</span><span class='fontv'>条未查看</span>");
			}else{
				$("#zndata").append("[站内消息]<span>("+data+")</span><span class='fontv'>条未查看</span>");
			}
		}
	});
	
	$.ajax({
		type:"post",
		url:'${ctx}/Initpage/getShareCount',
		dataType:"json",
		data:{},
		success:function(data){
			$("#gxtitle").text("共享审核");
			if(data.ISYX=='N'){
				$("#hiddengx").attr("href","#");
				$("#scdata").append("[共享审核]<span>无权限</span>");
			}else if(data.ISYX=='BM'){
//				$("#hiddengx").attr("href","${ctx}/shares/bApplylist");

				$("#hiddengx").attr('onclick','gxml_submit(\'1\')'); 
				$("#scdata").append("[共享审核]<span>("+data.NUM+")</span><span class='fontv'>条信息未处理</span>");
			}else if(data.ISYX=='ADMIN'){
//				$("#hiddengx").attr("href","${ctx}/shares/applist");
 	 
				$("#hiddengx").attr('onclick','gxml_submit(\''+data.gxtype+'\')'); 
				$("#scdata").append("[共享审核]<span>("+data.NUM+")</span><span class='fontv'>条信息未处理</span>");
			}else{
				$("#hiddengx").attr("href","#");
				$("#scdata").append("<span>[共享审核]无权限</span>");
			}
		}
	});
	
	$.ajax({
		type:"post",
		url:'${ctx}/Initpage/getBMData',
		dataType:"json",
		data:{},
		success:function(data){
			 
				$("#bmdata").append("<span>"+data+"</span>条"); 
		}
	});
	
	$(document).on("click",".noticeDetail",function(){
		 var id=$(this).attr("id");
		 window.location.href="${ctx}/notices/toShowBumenNotice?ID="+id;
	});
	
	
// 	$.ajax({
// 		type:"post",
// 		url:'${ctx}/Initpage/getBmsjtj',
// 		dataType:"json",
// 		data:{},
// 		success:function(data){
// 			var xList = new Array();
// 			var  dataList = new Array();
// 			for (var i=0; i<data.length; i++){
// 				var obj = data[i];
// 				xList.push(obj.RKRQ);
// 				dataList.push(obj.TOTAL);
// 			}
// 			initLineCharts(xList,dataList);
// 		}
// 	});
});

//统计分析图标 之折线图  ： 数据量  查询量  目录量
function initLineCharts(xList,dataList) {
	var myChart = echarts.init(document.getElementById('main'));
	option = {
		title : {
			text : '数据统计分析图表',
			subtext : ''
		},
		tooltip : {
			trigger : 'axis'
		},
		legend : {
			data : [ '数据总量' ]
		},
		toolbox : {
			show : true,
			feature : {
				mark : {
					show : true
				},
				dataView : {
					show : true,
					readOnly : false
				},
				magicType : {
					show : true,
					type : [ 'line', 'bar' ]
				},
				restore : {
					show : true
				},
				saveAsImage : {
					show : true
				}
			}
		},
		calculable : true,
		xAxis : [ {
			type : 'category',
			boundaryGap : false,
			data : xList
		} ],
		yAxis : [ {
			type : 'value',
			axisLabel : {
				formatter : '{value} '
			}
		} ],
		series : [ {
			name : '数据总量',
			type : 'line',
			data : dataList,
		}]
	};
	myChart.setOption(option);
}
function yycl_submit(yytype){
	
	 
	
		if("<%=request.getSession().getAttribute("BMID")%>"=="55636fa1ea164673ad41b23535e4daca"){
//			 if(<%=request.getSession().getAttribute("S_Y")%>!=1){ 
//				casubmit('/yycl/getInitAdmin');
//			}else{ 
//				casubmit('/yycl/getInitAdmin');
//				//$("#yycl").attr('href','${ctx}/yycl/getInitAdmin'); 
//			}  
			if(yytype=="XX"){
				$("#yycl").attr('href','${ctx}/yycl/getInitAdmin?yytype=XX'); 
			}
			if(yytype=="BM"){
				$("#yycl").attr('href','${ctx}/yycl/getInitAdmin?yytype=BM'); 
			}
			if(yytype=="ZX"){
				$("#yycl").attr('href','${ctx}/yycl/getInitAdmin?yytype=ZX'); 
			}
			
		}else{
//			if(<%=request.getSession().getAttribute("S_Y")%>!=1){ 
//				casubmit('/yycl/getInit');
//			}else{ 
//				casubmit('/yycl/getInit');
//				//$("#yycl").attr('href','${ctx}/yycl/getInit');
//			} 		
			$("#yycl").attr('href','${ctx}/yycl/getInit');
		}
	}
function gxml_submit(gxtype){ 
	if("<%=request.getSession().getAttribute("BMID")%>"=="55636fa1ea164673ad41b23535e4daca"){
//		if(<%=request.getSession().getAttribute("S_Y")%>!=1){ 
//			casubmit('/shares/applist');
//		}else{  
//			window.location.href = "${ctx}/shares/applist";
//		}
 
if(gxtype=="xxy"){
	window.location.href = "${ctx}/shares/applist?cltype=xxy";
}
if(gxtype=="bmld"){
	window.location.href = "${ctx}/shares/applist?cltype=bmld";
}
if(gxtype=="zxld"){
	window.location.href = "${ctx}/shares/applist?cltype=zxld";
}

		
	}else{
//		if(<%=request.getSession().getAttribute("S_Y")%>!=1){ 
//			casubmit('/shares/bApplylist');
//		}else{  
//			window.location.href = "${ctx}/shares/bApplylist";
//		}	
		window.location.href = "${ctx}/shares/bApplylist";
	}
}	 
function zx_submit(){ 
	if("<%=request.getSession().getAttribute("BMID")%>"=="55636fa1ea164673ad41b23535e4daca"){
//		if(<%=request.getSession().getAttribute("S_Y")%>!=1){ 
//			casubmit('/zx/list');
//		}else{  
//			window.location.href = "${ctx}/zx/list";
//		}
		window.location.href = "${ctx}/zx/list";
	}else{
//		if(<%=request.getSession().getAttribute("S_Y")%>!=1){ 
//			casubmit('/shares/bApplylist');
//		}else{  
//			window.location.href = "${ctx}/shares/bApplylist";
//		}		
		window.location.href = "${ctx}/shares/bApplylist";
	}
}

// function casubmit(url){
	 
	 
<%-- 		 var xlh =cazs_select('<%=request.getSession().getAttribute("S_CABZF")%>');  --%>
// 		 if(xlh!="error"){
// 		 $.ajax({
// 				url : '${ctx}/testca',
// 				type : "POST",
// 				data : {
// 					"passport" : xlh 
// 				},
// 				dataType : "json"
// 			}).done(function(resultData, ss) {
// 				if(resultData.SFYX=='Y'){
// 					window.location.href = "${ctx}"+url;
// 				}else{
// 					layer.msg('无此CA用户。');
// 				}
// 			}).fail(function(jqXHR, textStatus, errirThrown) {
// 				layer.msg('数据加载失败,请稍后重试');
// 			});
	 
// 		 }else{
// 			 layer.msg("请确认安装数字证书客户端。");
// 		 }
	 
	
// }
</script>
</rapid:override>
<%@ include file="template/base.jsp"  %>