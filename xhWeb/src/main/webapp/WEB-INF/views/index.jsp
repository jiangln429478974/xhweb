<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rs" value="${ctx}/resources" />
<rapid:override name="title">新嘩集团</rapid:override>
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
.portlet-title{  height:41px;}	
.portlet-title span{ color:#fff; font-size:14px; line-height:39px; display:block; width:75px; height:39px; float:left; text-align:center; cursor:pointer;  margin:2px 2px 0;}
.portlet-title .gztt{ color:#fff; font-size:16px;display:block;  height:41px;line-height:41px;font-style:normal;float:left; text-align:center;}		
.portlet-title span:hover,.navdd .on{ background-color:#0073a5;



height:37px; line-height:37px;margin-top:4px;
    -moz-border-radius: 5px 5px 0 0;      /* Gecko browsers */
    -webkit-border-radius: 5px 5px 0 0;   /* Webkit browsers */
    border-radius:5px 5px 0 0;            /* W3C syntax */

}
 
/*全局s*/ 

*{ margin:0;}
body{  font-family:"微软雅黑","Hiragino Sans GB"; font-size:12px;}
a{ text-decoration:none; }
ul{ margin:0; border:0; padding:0;}
ul li{ list-style:none;}
/*全局j*/ 
.dbsx{  -moz-border-radius: 5px;      /* Gecko browsers */
    -webkit-border-radius: 5px;   /* Webkit browsers */
    border-radius:5px;            /* W3C syntax */ border:1px solid #0cacc4; height:40px; position:relative;background-color:#fff; }

.dbsx_bt{ width:125px; background-color:#0cacc4;  line-height:40px; float:left; color:#fff; padding:0 0 0 30px; font-size:16px;position:relative;}
.dbsx_sy{ width:125px; background-color:#123456;  line-height:40px; float:left; color:#fff; padding:0 0 0 30px; font-size:16px;position:relative;}
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
.dbsx_nr ul li{ float:left; padding:0 15px; line-height:40px; font-size:14px; color:#00a5e9;}
.dbsx_nr ul li span{ color:red;}
.dbsx_nr ul li .fontv{ color:#777}
.dbsx_nr ul li .fontw{ color:#00a5e9}
.dbsx_nr ul li a{ color:#00a5e9;}
.dbsx_nr ul li a:hover{text-decoration:underline; color:#168cbc;}

.listc_div{ padding:0 5px;}
.listc_div ul li{ line-height:26px; padding:5px; font-size:14px;}
.listc_div ul li span{ float:right; font-size:12px; color:#666;}
.listc_div ul li a{ color:#000; font-size:14px;}
.listc_div ul li a:hover{ text-decoration:underline; color:#006ec2;}

.listc_div_more{display: inline-block; float: right;  padding: 12px 0 8px;}

@media (max-width: 850px){
	.dbsx {
	    height: inherit;
	}
}
@media (max-width: 850px){
	.dbsx_nr ul li {
	    float: inherit;
	}
}
@media (max-width: 1130px){
	.dbsx_nr ul {
	    padding: 0px 6px 0 120px;
	}
}
@media (max-width: 1130px){
	.dbsx_nr ul li {
	    padding: 0px 6px;
	}
}
@media (max-width: 1024px){
	.dbsx_nr ul {
	    padding: 0px 6px 0 108px;
	}
}
@media (max-width: 1024px){
	.dbsx_nr ul li {
	    padding: 0px 2px;
	}
}

</style>
</rapid:override>
<rapid:override name="content">
 			
             <input type = "hidden" value ="${sessionScope.loginname }"/>
            <br/>

			<div class="row">
				<div class="col-md-5 col-sm-12">
					<div class="portlet box blue">
						<div class="portlet-title" style="height:40px;background-color:#0E6D67;">
					  <div class="">
						<div class="navdd">
							<em class="gztt">
		                    <i class="fa fa-comments"></i> Forecast&nbsp;&nbsp;</em> 
 						 </div>
 						 </div>
						</div>
						<div  style="min-height:210px;" class="portlet-body">
 
							<div>
				            	 <table width="100%"  border="1px" align="center" cellpadding="0" cellspacing="0" style="font-size:15px;font-weight:bold;">
				            	 	<tr style="height:19px;"><td>NO.</td><td>Status</td><td>Count</td><td  >Detail</td></tr>
				            	 	<tr style="height:19px;"><td>1</td><td>Open</td><td>0</td><td style="color:#2965A8;">detail</td></tr>
				            	 	<tr style="height:19px;"><td>2</td><td>Save</td><td>0</td><td style="color:#2965A8;">detail</td></tr>
				            	 	<tr style="height:19px;"><td>3</td><td>Rejected</td><td>0</td><td style="color:#2965A8;">detail</td></tr>
				            	 	<tr style="height:19px;"><td>4</td><td>No planning</td><td>0</td><td style="color:#2965A8;">detail</td></tr>
				            	 	<tr style="height:19px;"><td>5</td><td>Sales Exception</td><td>yes</td><td style="color:#2965A8;">detail</td></tr>
				            	 </table>
				            </div>
 
						</div>
					</div>
				</div>
				
				
				<div class="col-md-7 col-sm-12">
					<div class="portlet box blue">
						<div class="portlet-title" style="height:40px;background-color:#0E6D67;">
							<div class="">
                                   <div class="navdd">
			                           <em class="gztt">
			                           <i class="fa fa-folder"></i> NBO&nbsp;&nbsp;</em> 
			                      </div>
							</div>
						</div>
						<div  style="min-height:210px;" class="portlet-body">
 							<div>
				            	 <table width="100%"  border="1px" align="center" cellpadding="0" cellspacing="0" style="font-size:15px;font-weight:bold;">
				            	 	<tr style="height:19px;"><td>NO.</td><td>Project Name</td><td>Project Stratus</td><td>Create Date</td></tr>
				            	 	<tr style="height:19px;"><td>1</td><td>60W 2.4G 遥控平板灯</td><td>Design Phase</td><td>Nov 3,2017 12:05:43 PM</td></tr>
				            	 	<tr style="height:19px;"><td>2</td><td>80W LED 电源</td><td>Board Testing</td><td>Nov 3,2017 12:05:43 PM</td></tr>
				            	 	<tr style="height:19px;"><td>3</td><td>Remoter A100</td><td>Conceptualise</td><td>Nov 3,2017 12:05:43 PM</td></tr>
				            	 	<tr style="height:19px;"><td>4</td><td>L10/45</td><td>Board Testing</td><td>Nov 3,2017 12:05:43 PM</td></tr>
				            	 	<tr style="height:19px;"><td>5</td><td>L10/45</td><td>Board Testing</td><td>Nov 3,2017 12:05:43 PM</td></tr>
				            	 </table>
				            </div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-5 col-sm-12">
					<div class="portlet box blue">
						<div class="portlet-title" style="height:40px;background-color:#0E6D67;">
							<div class="">
                                   <div class="navdd">
			                           <em class="gztt">
			                           <i class="fa fa-folder"></i> Call Report</em>  
			                          </div>
							</div>
							 
						</div>
						<div  style="min-height:210px;" class="portlet-body">
 							<div>
				            	 <table width="100%"  border="1px" align="center" cellpadding="0" cellspacing="0" style="font-size:15px;font-weight:bold;">
				            	 	<tr style="height:19px;"><td>NO.</td><td>Status</td><td>CallReport Title</td><td>Cust Name</td></tr>
				            	 	<tr style="height:19px;"><td>1</td><td>Saved</td><td>Design Phase JHJKHKJHJKH</td><td>Nov 3,2017 12:05:43 PM</td></tr>
				            	 	<tr style="height:19px;"><td>2</td><td>Saved</td><td>Board Testing Phase JHJKHKJHJKH Phase JHJKHKJHJKH</td><td>Nov 3,2017 12:05:43 PM</td></tr>
				            	 	<tr style="height:19px;"><td>3</td><td>Saved</td><td>Conceptualise Phase JHJKHKJHJKH</td><td>Nov 3,2017 12:05:43 PM</td></tr>
				            	 	<tr style="height:19px;"><td>4</td><td>Saved</td><td>Board Testing Phase JHJKHKJHJKH</td><td>Nov 3,2017 12:05:43 PM</td></tr>
				            	 	<tr style="height:19px;"><td>5</td><td>Saved</td><td>Board Testing Phase JHJKHKJHJKH</td><td>Nov 3,2017 12:05:43 PM</td></tr>
				            	 </table>
				            </div>
						</div>
					</div>
				</div>
			 
				
				<div class="col-md-7 col-sm-12">
					<div class="portlet box blue">
						<div class="portlet-title" style="height:40px;background-color:#0E6D67;">
							    <div class="">
                                   <div class="navdd">
			                           <em class="gztt">
			                           <i class="fa fa-folder"></i> Download</em>
			                          </div>
							    </div>
						</div>
  						<div  style="min-height:210px;" class="portlet-body">
 							 <div class="listc_div" style="font-size:15px;font-weight:bold;color:#2965A8">
				            	<ul >
									<li style="border-bottom:1px solid #ccc;">Serial Corprate</li>
									<li style="border-bottom:1px solid #ccc;">Shipping Application Form(SMHK)</li>
									<li style="border-bottom:1px solid #ccc;">2Q’2017 & 1H'2017 RESULTS PRESENTATION</li>
				                </ul>
				            </div>
						</div>	
					</div>
				</div>
				
			</div>
			
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

});
    
</script>
</rapid:override>
 
<c:if test='${sessionScope.loginname!="hzh_fgw" }'>
<%@ include file="template/base.jsp"  %>
</c:if>
<c:if test='${sessionScope.loginname=="hzh_fgw" }'>
<%@ include file="template/basenomenu.jsp"  %>
</c:if>
