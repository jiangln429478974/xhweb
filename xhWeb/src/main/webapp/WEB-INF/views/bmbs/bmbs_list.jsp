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
        .bodyclass {
	background: #555;
}

.input-control {
	height: 34px;
	font-size: 14px;
	color: #555;
	background-color: #FFF;
	background-image: none;
	border: 1px solid #CCC;
	border-radius: 4px;
	box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075) inset;
}
    </style>
</rapid:override>
<rapid:override name="content">

<div class="portlet box blue">
               <div class="portlet-title ">
                    <div class="caption">
                       	部门报送日志
                    </div>
                    <div class="tools">
<!-- 								<a class="collapse" href="" data-original-title="" title=""> -->
<!-- 								</a> -->
                    </div>
                </div>
                <div class="portlet-body form">
                <br/>
                        <form class="form-horizontal">
                        	<div  class="form-group">
                        	<label  class="control-label col-md-2">部门名称</label>
	                        	<div class="col-md-2">
	                        		<input id='inputbm' type="text" name="BM" class="form-control">
	                        	</div>
	                        <label  class="control-label col-md-2">姓名</label>
	                        	<div class="col-md-2">
	                        		<input id='inputxm' type="text" name="XM" class="form-control">
	                        	</div>
                        	</div>
                         
                        	<div  class="form-group">
                        	<label  class="control-label col-md-2">时间</label>
	                        	<div class="col-md-3">
										<input class="form-control" type="text" id="fbsj_start" name="fbsj_start" readonly onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" placeholder="开始时间"/>
								</div>
								<div class="col-md-3">
										<input class="form-control" type="text" id="fbsj_end" name="fbsj_end" readonly onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" placeholder="结束时间"/>
								</div>
                        	</div> 
                            
	                          <div class="form-actions"> 
										<div class="row">
										<!-- <div class="col-md-offset-0 col-md-5">
											<span style="float: left;"><button class="btn btn-primary " type="button" id="btn-add"><i class="fa fa-plus"></i>&nbsp;添加公告</button></span>
										</div> -->
										<div class="col-md-offset-4 col-md-8">
											<button type="button"  class="btn btn-primary" id="btn-search"><i class="fa fa-search"></i> 搜 索 </button>
											<a href="${ctx}/bmbs/list"><button class="btn btn-warning" id="reset" type="button"><i class="fa fa-refresh"></i> 刷 新 </button></a>
										</div>
									</div>
							 </div>	
							 <input type="hidden" value="${page}" id="new_page"/>
                        </form>
                        
                    </div>
           </div>
   <div class="jqGrid_wrapper">
          <table id="cjzbJqgrid"></table>
          <div id="pager_list"></div>
     </div>
</rapid:override>
<rapid:override name="script">
<script src="${rs}/js/plugins/jqgrid/i18n/grid.locale-cn.js"></script>
<script src="${rs}/js/plugins/jqgrid/jquery.jqGrid.min.js"></script>
<script src="${rs}/js/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="${rs}/js/plugins/layer/layer.js"></script>
<script>


	$(document).ready(function () {
 
		var dataPros = '<input type="checkbox" style="width:20px;" name="bb" onclick="checkAll(this)" />&nbsp;&nbsp;<button class="btn red btn-sm" type="button" onclick="scheng();"><i class="fa fa-times-circle"></i>&nbsp;删除</button>';
		$("#qx").prepend(dataPros);
		var page = $("#new_page").val();
	    $("#cjzbJqgrid").jqGrid({
	        url:'${ctx}/bmbs/bmbslist',
	        datatype: "json",
	        height: "auto",
	        autowidth: true,
	        page:page,
	        //shrinkToFit: true,
	        //multiselect:true,//全选功能
	        rowNum: 10,
	        rowList: [10, 20, 30],
	        colNames: ['部门','姓名','事项','状态','报送时间'],
	        colModel: [{name:'BM',index:'BM'},
	                   {name:'XM',index:'XM'},
	                   
	                   {
	                   	name:'SX' ,index:'SX',
	                   	formatter:function(cellvalue, options, rowObject){
	                   		return '<a href="/nbggxy/ftp/init?UUID='+rowObject.FTPUUID+'">'+rowObject.SX+'</a>'
	                   				;
	                   	}
	                   },
// 	                   ="checkData(\''+cellvalue+','+rowObject.XXLB+','+rowObject.SLZT+'\');">查看
	                   {name:'BJZT',index:'BJZT',
	                   formatter:function(cellvalue, options, rowObject){
                                     
	                	            if(rowObject.STATUS=='1'){
	                	            	  if(rowObject.BJZT=='N'){
		                                       return "未处理";
		                                   }else if(rowObject.BJZT=='Y'){
		                                       return "已处理";
		                                   }else if(rowObject.BJZT=='I'){
			                                	   return "已处理";
		                                   }else if(rowObject.BJZT=='F'){
		                                	   return "处理失败";
		                                   }else if(rowObject.BJZT=='W'){
		                                	   return "上月无数据";
		                                   }else {
		                                	   return "";
		                                   }
	                	            	  
	                	            }else {
	                                	   return  "文件已删除";
	                                   }
	                                  
	                                      
	                               	}},
	                   {name:'RKRQ',index:'RKRQ'}],  
	        pager: "#pager_list",
	        hidegrid: false
	    });
	    
	
	    /*搜索*/
	    $("#btn-search").click(function(){
	    	//公告名称
	      var inputbmmc = $("#inputbm").val();
	      var inputxm = $("#inputxm").val();
	      var time_start = $("#fbsj_start").val();
	      var time_end = $("#fbsj_end").val();
	 	   $("#cjzbJqgrid").jqGrid('setGridParam',{ 
	             url:'${ctx}/bmbs/bquery',//你的搜索程序地址 
	             mtype:'POST',
	             postData:{'BM':inputbmmc,'XM':inputxm,'fbsj_start':time_start,'fbsj_end':time_end}, //发送搜索条件 
	             page:1 
	         }).trigger("reloadGrid"); //重新载入
	    });
	
	 
    /*搜索*/
   /*  $("#btn-search").click(function(){
    	//公告名称
    	var sjstart = $("#bm").val();
    	
    	$.ajax({
    		type:"post",
    		url:'${ctx}/bmbs/bquery',
    		dataType:"json",
    		data: {"sjstart":sjstart,"sjend":sjend,},
    		success:function(data){
    			
    			var rowStr = "<tr><th>ID</th><th>表名称</th><th>来源数据库</th><th>总量</th><th>更新时间</th><th>UNID</th><th>当天量</th><th>统计时间</th></tr>";
    			for (var i=0; i<data.length; i++){
    				var rowObj = data[i];
    				if(i%5==0){
    					rowStr += "<tr  >";
    				} else if(i%5==1){
    					rowStr += "<tr  >";
    				} else if(i%5==2){
    					rowStr += "<tr  >";
    				} else if(i%5==3){
    					rowStr += "<tr  >";
    				} else if(i%5==4){
    					rowStr += "<tr  >";
    				}
    				var fbsj = " ";
    				if(rowObj.FBSJ!="undefined" && rowObj.FBSJ!=null){
    					fbsj = rowObj.FBSJ;
    				}
    				
    				if(rowObj.GXSJ==null){
    					rowStr += "<td><a class='noticeDetail' id='"+rowObj.ID+"'>"+rowObj.ID+"</a></td>" + 
    					"<td>"+rowObj.TNAME+"</td>"+"<td>"+rowObj.SJK+"</td>"+"<td>"+rowObj.TOTAL+"</td>"+"<td>"+" "+"</td>"
    					+"<td>"+" "+"</td>"+"<td>"+rowObj.TODAY+"</td>"+"<td>"+rowObj.TJRQ+"</td>";
    	rowStr += "</tr>";
    				}else{
    					rowStr += "<td><a class='noticeDetail' id='"+rowObj.ID+"'>"+rowObj.ID+"</a></td>" + 
    					"<td>"+rowObj.TNAME+"</td>"+"<td>"+rowObj.SJK+"</td>"+"<td>"+rowObj.TOTAL+"</td>"+"<td>"+rowObj.GXSJ+"</td>"
    					+"<td>"+rowObj.UNID+"</td>"+"<td>"+rowObj.TODAY+"</td>"+"<td>"+rowObj.TJRQ+"</td>";
    	rowStr += "</tr>";
    				}
    				
    			}
    			$("#tzgg").append(rowStr);
    		    $(window).bind('resize', function () {
    		        var width = $('.jqGrid_wrapper').width();
    		        $('#tzgg').setGridWidth(width);
    		    });
    		    _w_table_rowspan("#tzgg",2);
    		}
    	});
    }); */
 
});

</script>
</rapid:override>
<%@ include file="../template/base.jsp"  %>