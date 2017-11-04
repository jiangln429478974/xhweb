<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rs" value="${ctx}/resources" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
    <script src="${rs}/global/plugins/zTree/js/jquery.ztree.core-3.5.min.js"></script>
	<script src="${rs}/js/plugins/jqgrid/i18n/grid.locale-cn.js"></script>
	<script src="${rs}/js/plugins/jqgrid/jquery.jqGrid.min.js"></script>
	<script src="${rs}/js/plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="${rs}/js/plugins/layer/layer.js"></script>
	<script type="text/javascript">
   
	   $().ready(function () {
	    
		   $('.content').hide();
	        
	    });
	 function display(value){
 		 if( value=='显示'){
 			$('.content').show();
 			document.getElementById('showBtn').value='隐藏'; 
 			
 		 }
 		 else{
 			$('.content').hide();
 			
 		    document.getElementById('showBtn').value='显示'; 
 		   
	     }


	
  	 }
	 
    </script>	
    <style>
 .content1{position:relative; width:100px;}
      .img_1{display:block;}
     .img_2{width:800px;position:fixed;top:100px;left:210px;display:none;}
     .content1:hover img{display: block;z-index:999;}  

</style>
    
</head>
<body>
	
							<table  class="table table-bordered">
							<c:forEach items="${list}" var="map">
							
							
							<c:if test="${!empty map.V_VAL }">
							<tr>
								   <c:if test="${map.V_CN eq '查询内容' }">
								        <td> 查询内容:<%-- <c:out value="${map.V_CN}" /> --%></td>
								    </c:if>
								    <c:if test="${map.V_CN !=  '查询内容' }">
								     <td width="25%">
								    <c:out value="${map.V_CN}" />：</td>
								    </c:if>
								
								
								<c:if test="${map.V_CN eq '查询内容' }">
									 <td>
									   <input type="button" id="showBtn" value="显示" onclick="display(this.value);">
									   
		                               <!--自然人日志信息查询 -->
										<c:if test="${!empty map.V_VAL }">
										
										<c:if test="${!empty map.V_VAL.yysx}">
										<tr >
										    <td width="25%"><c:out value="${map.V_VAL.yyTitle }"/></td>
											<td><c:out value="${map.V_VAL.yysx }"/></td>
									   </tr>
									   </c:if>
										<c:forEach var="nr" items="${map.V_VAL.jbsj }">
											<tr class="content">
											   <td colspan=2 style="background:#EBEBEB"></td>
											</tr>
											<!-- 部门名称：信息名称 -->
											<tr  style="color:#3A5FCD;font-weight:bold;" class="content">
												<td colspan=2>
													<c:out value="${nr.jbbmmc }"/>:
													<c:out value="${nr.jbTitle }"/>
												</td>
											</tr>
											
											<c:forEach var="jtnr" items="${nr.DATA }">
											    <c:if test="${!empty jtnr.VAL}">
											    <!-- "查询内容"中的对应信息 -->
													<tr style="color:#3A5FCD;font-weight:bold;" class="content">
														<td width="25%">
														 <c:out value="${jtnr.ZW }"/>:</td>
														<td>
														 <c:out value="${jtnr.VAL }"/>
														</td>
													</tr>
												</c:if>
											</c:forEach>
										</c:forEach>
											<tr class="content">
											   <td colspan=2 style="background:#EBEBEB"></td>
											</tr>
										</c:if>
		 								<!--法人日志信息查询 -->
										<c:if test="${!empty map.V_VALUE }">
											<c:forEach var="wclist" items="${map.V_VALUE }">
												<c:out value="${wclist.BMMC}"/><br/>
												<c:forEach var="zclist" items="${wclist.BMDATALIST2 }">
												<c:out value="${zclist.BZWM}"/><br/>
												<c:forEach var="nclist" items="${zclist.BDATALIST }">
												<c:forEach var="nr" items="${nclist.aa }">
												<c:out value="${nr.ZW }"></c:out>:
												<c:out value="${nr.VAL }"></c:out><br/>
												</c:forEach>
												</c:forEach>
												</c:forEach>
												<br/>
											</c:forEach>
										</c:if>
										</td>
									</c:if>
									
									<c:if test="${map.V_CN != '查询内容' }">
								       <td>
										<c:if test="${map.V_CN != '身份证照片名称' }">
											
										 <c:out value="${map.V_VAL}" />
											  
										</c:if>
											<c:if test="${map.V_CN eq '身份证照片名称' }">
											    ${map.V_VAL}
											</c:if>
									    </td>
									</c:if>
								
							</tr>
							</c:if>
							</c:forEach>
							
							<c:forEach items="${sqclList}" var="sqclmap">
								<tr>
									<td>
										${sqclmap.NAME }
									</td>
									<td>  <div class="content1">
<!-- 									<img src="ftp://xypt_scwj:xypt_scwj@10.19.13.231/home/SCWJ/myftp/upload/2017/05/05/xycx/123/65a1d543a0b947e78ec2fc07dc0ec7a6/df301ba8795344049408428865749804.jpg" style="width: 100px;height: 100px;cursor: pointer;"/> -->
<%-- 										<img style="height: 120px;width:120px;" src="${sqclmap.FJ }" class="img_1"/> --%>
										<img style="height: 120px;width:120px;" src="${sqclmap.URL }" class="img_1"/>
										<img src="${sqclmap.URL }" class="img_2" />
										</div>
									</td>
								</tr>
							</c:forEach>
							
							
							
							</table>
	

			
</html>


