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
    </style>
</rapid:override>
<rapid:override name="content">

<div class="portlet box blue">
               <div class="portlet-title ">
                    <div class="caption">
                       	第四基准
                    </div>
                    <div class="tools">
<!-- 								<a class="collapse" href="" data-original-title="" title=""> -->
<!-- 								</a> -->
                    </div>
                </div>
                <div class="portlet-body form">
                <br/>
                        <form class="form-horizontal">
                        	<div class="form-group" id="myForm">
                        	    <label class="control-label col-md-1" style="padding-left:16px;width:110px;">姓名:</label>
                                <div class="col-md-3">
                                    <input type="text" class="form-control"  name="XM">
                                </div>
                                <label class="control-label col-md-1" style="width:110px;">身份证件号码:</label>
                                <div class="col-md-3">
                                    <input type="text" class="form-control"  name="SFZH">
                                </div>
                            </div>
                           
	                          <div class="form-actions"> 
										<div class="row">
										<div class="col-md-offset-0 col-md-5">
											<button type="button"  class="btn btn-primary" id="btn-search"><i class="fa fa-search"></i> 搜 索 </button> 
										</div>
									</div>
							 </div>	
							 <input type="hidden" value="${page}" id="new_page"/>
							 <input type="hidden" value="${map.TNAME}" id="tname"/>
                        </form>
                        
                    </div>
                </div>


     <div style="width:auto;height:auto;margin-top:15px;margin-bottom: 10px;" id="qx">
      </div>     

     <div class="jqGrid_wrapper">
          <table id="noticeJqgrid"></table>
          <div id="pager_list"></div>
     </div>

</rapid:override>
<rapid:override name="script">
<script src="${rs}/js/plugins/jqgrid/i18n/grid.locale-cn.js"></script>
<script src="${rs}/js/plugins/jqgrid/jquery.jqGrid.min.js"></script>
<script src="${rs}/js/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="${rs}/js/plugins/layer/layer.js"></script>
<script>
var tname = $("#tname").val(); 
$(document).ready(function () {

	    $("#noticeJqgrid").jqGrid({
	        url:'${ctx}/dsjz/toShowDdjzList',
	        datatype: "json",
	        height: 'auto',
	        autowidth: true,
	        mtype:"POST",
	        postData:{
	        	TNAME:tname
	        	},
	       
	        //shrinkToFit: true,
	        //multiselect:true,//全选功能
	        rownumbers:true,
	        rowNum: 20,
	        rowList: [10, 20, 30],
	        colNames: ['UNID','姓名','身份证号','操作'],
	        colModel: [
	        {name:'UNID',index:'UNID',hidden:true},
	        {name:'XM',index:'XM',align:'center',width:'10%'},
	        {name:'SFZH',index:'SFZH',align:'center',width:'10%'},
	        {
            	name:'CZ',align:'center',width:'18%',
            	formatter:function(cellvalue, options, rowObject){
            		var htm = '<BUTTON class="btn btn-xs blue" onclick="getData(\''+rowObject.UNID+'\');">详情</BUTTON>'+
            		'<BUTTON class="btn btn-xs blue" onclick="checkData(\''+rowObject.UNID+'\');">数据核实</BUTTON>'+
            		'<BUTTON class="btn btn-xs blue" onclick="tsdsjz(\''+rowObject.UNID+'\',\''+rowObject.SFZH+'\',\''+rowObject.XM+'\');">推送基准</BUTTON>';
            		return htm;
            	}
            }
	        ],
	        pager: "#pager_list",
	        //viewrecords: true,
	        caption: "第四基准",
	        //add: true,
	        //edit: true,
	        //addtext: 'Add',
	        //edittext: 'Edit',
	        hidegrid: false
	    });
	    
    
	    /*搜索*/
	     $("#btn-search").click(function(){
	    	
	    	   // 将查询参数融入postData选项对象  
	    	   
	    	// var fields = $("#myForm").serializeArray();
	    	var postData = $("#noticeJqgrid").jqGrid("getGridParam", "postData"); 
	    	var rules="";
			$("#myForm :input").each(function(i){
				if ($(this).val()) {
					var myname=$(this).attr("name");
					var myvalue=$(this).val();
					//alert($("#myForm :input").size());
						rules+="\""+myname+"\":\""+myvalue+"\",";
					//$.extend(postData, {myname:myvalue});
				}
			});
			ParamJson = '{' + rules.substr(0,rules.lastIndexOf(",")) + '}';
			//alert(ParamJson);
			
	    	$.extend(postData, { Param: ParamJson });

	  	   $("#noticeJqgrid").jqGrid('setGridParam',{ 
	  		    search: true,
	  	   }).trigger("reloadGrid", [{page:1}]); //重新载入
	     });
	  
    
    
 
	 
 
   $(window).bind('resize', function () {
        var width = $('.jqGrid_wrapper').width();
        $('#noticeJqgrid').setGridWidth(width);
    });

	function show(obj){
		$("#buType").val(obj);
	}
});
//推送第四基准
// function tsdsjz(id){
// 		window.location.href = "${ctx}/dsjz/adddsjz?unid="+id+"&tname="+tname;
// }

// function tsdsjz(id){
	
<%-- 	if('<%=request.getSession().getAttribute("S_Y")%>'!=1){ --%>
// 		t("function61",id);
// 	}else{
// 	     //操作
// 		window.location.href = "${ctx}/zx/detail?zxId="+id;
// }
// }
function function61(id){
	 
        var result= CA(); 
  	     if(result=='Y'){
  	    	  //操作
  	    	window.location.href = "${ctx}/zx/detail?zxId="+id;
  	     }else if(result=='cancel'){
  	        //取消
  	     }else{
  	    	layer.msg(result);
  	     } 
}
 
 
function tsdsjz(UNID,SFZH,XM){
	$.ajax({
		type:"post",
		url:'${ctx}/dsjz/adddsjz',
		dataType:"json",
		data:{ "UNID":UNID, 
			"SFZH":SFZH,
			"XM":XM,
			"TNAME":tname
			}, 
		success:function(data){
			if(data.msg=="1"){
				layer.msg("推送成功");
				 $("#noticeJqgrid").trigger("reloadGrid");
 
			}else if(data.msg=="2"){
				layer.msg("其他事项已推送该基准，与本事项内容一致");
				 $("#noticeJqgrid").trigger("reloadGrid");

			}else if(data.msg=="3"){
				layer.msg("其他事项已推送该基准，但姓名与本事项姓名不一致");
				 $("#noticeJqgrid").trigger("reloadGrid");
			}else{
				alert(data.msg);
			}
		},
		error:function(error){
			alert("系统错误！");
		}
		
	});
}

function getData(id){
	BootstrapDialog.show({
        title:'查看信息',
        size:BootstrapDialog.SIZE_NORMAL,
        message: function(dialog) {
            var $message = $('<div></div>');
            var pageToLoad = dialog.getData('pageToLoad');
            $message.load(pageToLoad);
            return $message;
        },
        data: {
            'pageToLoad': '${ctx}/dsjz/showdetail?UNID='+id+'&TNAME='+tname
        },
        buttons: [{
            label: '关闭',
            action: function(dialogRef){
                dialogRef.close(function(){
 
                });

                closeRefresh();
            }
        }] 
    }); 
}
//修改 
function checkData(UNID){

	 BootstrapDialog.show({
		title:'修改信息',
		message: function(dialog) {
           var $message = $('<div></div>');
           var pageToLoad = dialog.getData('pageToLoad');
           $message.load(pageToLoad);
           return $message;
       },
       data: {
      	    'pageToLoad': '${ctx}/dsjz/updatedetail?UNID='+UNID+'&TNAME='+tname
       }
	 });
}
</script>
</rapid:override>
<%@ include file="../template/base.jsp" %>