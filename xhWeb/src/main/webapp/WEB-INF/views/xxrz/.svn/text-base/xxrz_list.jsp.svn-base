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
                       	消息日志记录
                    </div>
                    <div class="tools">
<!-- 								<a class="collapse" href="" data-original-title="" title=""> -->
<!-- 								</a> -->
                    </div>
                </div>
                <div class="portlet-body form">
                <br/>
                        <form class="form-horizontal">
                        	<div class="form-group">
                        	    <label class="control-label col-md-1" style="padding-left:16px;width:150px;">消息内容查询：</label>
                                <div class="col-md-3">
                                    <input type="text" class="form-control"  id="notice_name">
                                </div>    
                                <div class="col-md-offset-0 col-md-5">
											<button type="button"  class="btn btn-primary" id="btn-search"><i class="fa fa-search"></i> 搜 索 </button>
											<a href="${ctx}/xxrz/list"><button class="btn btn-warning" id="reset" type="button"><i class="fa fa-refresh"></i> 刷 新 </button></a>
										</div>
                            </div>
                        
                            
	                          <div class="form-actions"> 
										<div class="row">
										<!-- <div class="col-md-offset-0 col-md-5">
											<span style="float: left;"><button class="btn btn-primary " type="button" id="btn-add"><i class="fa fa-plus"></i>&nbsp;添加公告</button></span>
										</div> -->
									
									</div>
							 </div>	
							 <input type="hidden" value="${page}" id="new_page"/>
                        </form>
                        
                    </div>
                </div>
	

 
     
     
     <div class="row">
				<div class="col-md-6" style="width:100%">
					<div class="portlet box blue">
						<div class="portlet-title">
							<div class="caption">
								消息日志列表
							</div>
							
						</div>
						<div class="portlet-body">
							<div class="table-scrollable">
								<table class="table table-bordered table-hover" border=1 id="tzgg">
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

</rapid:override>
<rapid:override name="script">
<script src="${rs}/js/plugins/jqgrid/i18n/grid.locale-cn.js"></script>
<script src="${rs}/js/plugins/jqgrid/jquery.jqGrid.min.js"></script>
<script src="${rs}/js/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="${rs}/js/plugins/layer/layer.js"></script>

<script>

function _w_table_rowspan(_w_table_id,_w_table_colnum){ 
	  _w_table_firsttd = ""; 
	  _w_table_currenttd = ""; 
	  _w_table_SpanNum = 0; 
	  _w_table_Obj = $(_w_table_id + " tr td:nth-child(" + _w_table_colnum + ")"); 
	  _w_table_Obj.each(function(i){ 
	  if(0==i){ 
	  _w_table_firsttd = $(this); 
	  _w_table_SpanNum = 1; 
	  }else{ 
	  _w_table_currenttd = $(this); 
	  if(_w_table_firsttd.text()==_w_table_currenttd.text()){ 
	  	_w_table_SpanNum++; 
	  	_w_table_currenttd.hide(); //remove(); 
	  _w_table_firsttd.attr("rowSpan",_w_table_SpanNum); 
	  }else{ 
	    _w_table_firsttd = $(this); 
	    _w_table_SpanNum = 1; 
	  } 
	  } 
	  }); 
	  
	  }  
	$(document).ready(function () {
 
		$.ajax({
			type:"post",
			url:'${ctx}/xxrz/xxrzlist',
			dataType:"json",
			data:{},
			success:function(data){
				
				var rowStr = "<tr><th hidden>ID</th><th>发送人</th><th>消息内容</th><th>消息类型</th><th>查看状态</th><th>接收人</th><th>时间</th></tr>";
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
					
					/* if(rowObj.CKZT=='1'){
						rowStr += "<td><a class='noticeDetail' id='"+rowObj.ID+"'>"+rowObj.ID+"</a></td>" + 
						"<td>"+rowObj.XM+"</td>"+"<td>"+rowObj.MBNR+"</td>"+"<td>"+rowObj.XXLX+"</td>"+"<td>"+"已阅"+"</td>"
						+"<td>"+rowObj.RKRQ+"</td>";
		rowStr += "</tr>";
					}else{
						rowStr += "<td><a class='noticeDetail' id='"+rowObj.ID+"'>"+rowObj.ID+"</a></td>" + 
						"<td>"+rowObj.XM+"</td>"+"<td>"+rowObj.MBNR+"</td>"+"<td>"+rowObj.XXLX+"</td>"+"<td>"+"未查看"+"</td>"
						+"<td>"+rowObj.RKRQ+"</td>";
		rowStr += "</tr>";
					} */
					if(rowObj.CKZT=='1' &&rowObj.XXLX=='1'){
						rowStr += "<td hidden><a  class='noticeDetail' id='"+rowObj.ID+"'>"+rowObj.ID+"</a></td>" + 
						"<td>"+rowObj.XM+"</td>"+"<td>"+rowObj.MBNR+"</td>"+"<td>"+"短信"+"</td>"+"<td>"+"已阅"+"</td>"+"<td>"+rowObj.JSR+"</td>"
						+"<td>"+rowObj.RKRQ+"</td>";
		rowStr += "</tr>";
					}
					if(rowObj.CKZT=='1' &&rowObj.XXLX=='2'){
						rowStr += "<td hidden><a class='noticeDetail' id='"+rowObj.ID+"'>"+rowObj.ID+"</a></td>" + 
						"<td>"+rowObj.XM+"</td>"+"<td>"+rowObj.MBNR+"</td>"+"<td>"+"站内消息"+"</td>"+"<td>"+"已阅"+"</td>"+"<td>"+rowObj.JSR+"</td>"
						+"<td>"+rowObj.RKRQ+"</td>";
		rowStr += "</tr>";
					}
					if(rowObj.CKZT=='0' &&rowObj.XXLX=='1'){
						rowStr += "<td hidden><a class='noticeDetail' id='"+rowObj.ID+"'>"+rowObj.ID+"</a></td>" + 
						"<td>"+rowObj.XM+"</td>"+"<td>"+rowObj.MBNR+"</td>"+"<td>"+"短信"+"</td>"+"<td>"+"未阅读"+"</td>"+"<td>"+rowObj.JSR+"</td>"
						+"<td>"+rowObj.RKRQ+"</td>";
		rowStr += "</tr>";
					}
					if(rowObj.CKZT=='0' &&rowObj.XXLX=='2'){
						rowStr += "<td hidden><a class='noticeDetail' id='"+rowObj.ID+"'>"+rowObj.ID+"</a></td>" + 
						"<td>"+rowObj.XM+"</td>"+"<td>"+rowObj.MBNR+"</td>"+"<td>"+"站内消息"+"</td>"+"<td>"+"未阅读"+"</td>"+"<td>"+rowObj.JSR+"</td>"
						+"<td>"+rowObj.RKRQ+"</td>";
		rowStr += "</tr>";
					}
					if(rowObj.MBNR==null){
						rowStr += "<td hidden><a class='noticeDetail' id='"+rowObj.ID+"'>"+rowObj.ID+"</a></td>" + 
						"<td>"+rowObj.XM+"</td>"+"<td>"+" "+"</td>"+"<td>"+" "+"</td>"+"<td>"+" "+"</td>"+"<td>"+" "+"</td>"
						+"<td>"+" "+"</td>";
		rowStr += "</tr>";
					}
				}
				$("#tzgg").append(rowStr);
			    $(window).bind('resize', function () {
			        var width = $('.jqGrid_wrapper').width();
			        $('#tzgg').setGridWidth(width);
			    });
			    //_w_table_rowspan("#tzgg",2);
			}
		});
	
		
		/*清空功能主键*/
	 $(function(){
			$("#btn-search").click(function() {
				$("#tzgg tr").html("");
			});
		}); 
		
		 /*搜索*/
	    $("#btn-search").click(function(){
	    	//公告名称
	    	  
	    	
	    	   var noticeName = $("#notice_name").val();
	    	   
 				if(noticeName==null){
 					alert("请输入查询条件"+noticeName);
 				}else{
 					$.ajax({
 		    			type:"post",
 		    			url:'${ctx}/xxrz/bquery',
 		    			dataType:"json",
 		    			data: {"noticeName":noticeName,},
 		    			success:function(data){
 		    				
 		    				var rowStr = "<tr><th hidden>ID</th><th>发送人</th><th>消息内容</th><th>消息类型</th><th>查看状态</th><th>接收人</th><th>时间</th></tr>";
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
 		    					
 		    					/* if(rowObj.CKZT=='1'){
 		    						rowStr += "<td><a class='noticeDetail' id='"+rowObj.ID+"'>"+rowObj.ID+"</a></td>" + 
 		    						"<td>"+rowObj.XM+"</td>"+"<td>"+rowObj.MBNR+"</td>"+"<td>"+rowObj.XXLX+"</td>"+"<td>"+"已阅"+"</td>"
 		    						+"<td>"+rowObj.RKRQ+"</td>";
 		    		rowStr += "</tr>";
 		    					}else{
 		    						rowStr += "<td><a class='noticeDetail' id='"+rowObj.ID+"'>"+rowObj.ID+"</a></td>" + 
 		    						"<td>"+rowObj.XM+"</td>"+"<td>"+rowObj.MBNR+"</td>"+"<td>"+rowObj.XXLX+"</td>"+"<td>"+"未查看"+"</td>"
 		    						+"<td>"+rowObj.RKRQ+"</td>";
 		    		rowStr += "</tr>";
 		    					} */
 		    					if(rowObj.CKZT=='1' &&rowObj.XXLX=='1'){
 		    						rowStr += "<td hidden><a  class='noticeDetail' id='"+rowObj.ID+"'>"+rowObj.ID+"</a></td>" + 
 		    						"<td>"+rowObj.XM+"</td>"+"<td>"+rowObj.MBNR+"</td>"+"<td>"+"短信"+"</td>"+"<td>"+"已阅"+"</td>"+"<td>"+rowObj.JSR+"</td>"
 		    						+"<td>"+rowObj.RKRQ+"</td>";
 		    		rowStr += "</tr>";
 		    					}
 		    					if(rowObj.CKZT=='1' &&rowObj.XXLX=='2'){
 		    						rowStr += "<td hidden><a class='noticeDetail' id='"+rowObj.ID+"'>"+rowObj.ID+"</a></td>" + 
 		    						"<td>"+rowObj.XM+"</td>"+"<td>"+rowObj.MBNR+"</td>"+"<td>"+"站内消息"+"</td>"+"<td>"+"已阅"+"</td>"+"<td>"+rowObj.JSR+"</td>"
 		    						+"<td>"+rowObj.RKRQ+"</td>";
 		    		rowStr += "</tr>";
 		    					}
 		    					if(rowObj.CKZT=='0' &&rowObj.XXLX=='1'){
 		    						rowStr += "<td hidden><a class='noticeDetail' id='"+rowObj.ID+"'>"+rowObj.ID+"</a></td>" + 
 		    						"<td>"+rowObj.XM+"</td>"+"<td>"+rowObj.MBNR+"</td>"+"<td>"+"短信"+"</td>"+"<td>"+"未阅读"+"</td>"+"<td>"+rowObj.JSR+"</td>"
 		    						+"<td>"+rowObj.RKRQ+"</td>";
 		    		rowStr += "</tr>";
 		    					}
 		    					if(rowObj.CKZT=='0' &&rowObj.XXLX=='2'){
 		    						rowStr += "<td hidden><a class='noticeDetail' id='"+rowObj.ID+"'>"+rowObj.ID+"</a></td>" + 
 		    						"<td>"+rowObj.XM+"</td>"+"<td>"+rowObj.MBNR+"</td>"+"<td>"+"站内消息"+"</td>"+"<td>"+"未阅读"+"</td>"+"<td>"+rowObj.JSR+"</td>"
 		    						+"<td>"+rowObj.RKRQ+"</td>";
 		    		rowStr += "</tr>";
 		    					}
 		    					if(rowObj.MBNR==null){
 		    						rowStr += "<td hidden><a class='noticeDetail' id='"+rowObj.ID+"'>"+rowObj.ID+"</a></td>" + 
 		    						"<td>"+rowObj.XM+"</td>"+"<td>"+" "+"</td>"+"<td>"+" "+"</td>"+"<td>"+" "+"</td>"+"<td>"+" "+"</td>"
 		    						+"<td>"+" "+"</td>";
 		    		rowStr += "</tr>";
 		    					}
 		    				}
 		    				$("#tzgg").append(rowStr);
 		    			    $(window).bind('resize', function () {
 		    			        var width = $('.jqGrid_wrapper').width();
 		    			        $('#tzgg').setGridWidth(width);
 		    			    });
 		    			    //_w_table_rowspan("#tzgg",2);
 		    			}
 		         }); //重新载入
 				}
	    		
	    });
    
    

    
  

  
    
  
    

    //批量修改用户信息
    $('#btn-edit').click(function(){
        var jqgrid = $('#noticeJqgrid');
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

//删除通知
function deleteData(id){
	layer.confirm('是否删除？', {
	    btn: ['确定','取消'], 
	    shade: false 
	}, function(){
		 $.ajax({
	         url: '${ctx}/notices/deleteNotice/'+id,
	         type: "POST",
	         data: {},
	         dataType: "json"
	     }).done(function(data,ss) {
	    	 if(data.flag==1){
	    		 layer.msg('数据删除成功');
		    	 $("#noticeJqgrid").trigger("reloadGrid");	 
	    	 }else{
	    	 	layer.msg(data.msg);
		    	$("#noticeJqgrid").trigger("reloadGrid");	 
	    	 }
	    	
	     }).fail(function(jqXHR, textStatus, errorThrown){
	    	 layer.msg('数据删除失败，请稍后重试');
	     }	 
	     );
	}, function(){
	    
	});
}


//发布通知
function fabuData(id){
	layer.confirm('是否发布？', {
	    btn: ['确定','取消'], 
	    shade: false 
	}, function(){
		 $.ajax({
	         url: '${ctx}/notices/fabuNotice/'+id,
	         type: "POST",
	         data: {},
	         dataType: "json"
	     }).done(function(data,ss) {
	    	 if(data.flag==1){
	    		 layer.msg('发布成功');
		    	 $("#noticeJqgrid").trigger("reloadGrid");	 
	    	 }else{
	    	 	layer.msg(data.msg);
	    	 }
	    	
	     }).fail(function(jqXHR, textStatus, errorThrown){
	    	 layer.msg('数据删除失败，请稍后重试');
	     }	 
	     );
	}, function(){
	    
	});
}

//撤销通知
function cancelData(id){
	layer.confirm('是否撤销？', {
	    btn: ['确定','取消'], 
	    shade: false 
	}, function(){
		 $.ajax({
	         url: '${ctx}/notices/chexiaoNotice/'+id,
	         type: "POST",
	         data: {},
	         dataType: "json"
	     }).done(function(data,ss) {
	    	 if(data.flag==1){
	    		 layer.msg('撤销成功');
		    	 $("#noticeJqgrid").trigger("reloadGrid");	 
	    	 }else{
	    	 	layer.msg(data.msg);
	    	 }
	    	
	     }).fail(function(jqXHR, textStatus, errorThrown){
	    	 layer.msg('数据撤销失败，请稍后重试');
	     }	 
	     );
	}, function(){
	    
	});
}





//去更新
function modifyData(id){
	 var page = jQuery("#noticeJqgrid").getGridParam('page');
		 $.ajax({
	         url: '${ctx}/notices/goToUpdateNotice/',
	         type: "POST",
	         data: {"ID":id},
	         dataType: "json"
	     }).done(function(data,ss) {
	    	 if(data.flag==1){
	    		 window.location.href = "${ctx}/notices/toUpdateNotice?ID="+id+"&page="+page;
	    	 }else{
	    	 	layer.msg(data.msg);
		    	$("#noticeJqgrid").trigger("reloadGrid");	 
	    	 }
	    	
	     }).fail(function(jqXHR, textStatus, errorThrown){
	    	 layer.msg('数据编辑失败，请稍后重试');
	     }	 
	    );
}

//去查看
function findData(id){
	 var page = jQuery("#noticeJqgrid").getGridParam('page');
			 $.ajax({
		         url: '${ctx}/notices/goTofindNotice/',
		         type: "POST",
		         data: {"ID":id},
		         dataType: "json"
		     }).done(function(data,ss) {
		    	 if(data.flag==1){
		    		 window.location.href = "${ctx}/notices/toShowNotice?ID="+id+"&page="+page;
		    	 }else{
		    	 	layer.msg(data.msg);
			    	$("#noticeJqgrid").trigger("reloadGrid");	 
		    	 }
		    	
		     }).fail(function(jqXHR, textStatus, errorThrown){
		    	 layer.msg('数据查看失败，请稍后重试');
		     }	 
		     );
}

/*全选函数*/
function checkAll(e){    //全选函数
    var aa = document.getElementsByName("rr");
    for(var i=0;i<aa.length;i++){
        aa[i].checked = e.checked;
    }
}

function checkItem(e) {   //当选取或取消选取没一个复选框时调用的函数
   var aa = document.getElementsByName("bb"); //全选框对象
   var y = true;
   if (!e.checked) {      //如果是取消选取那么全选框就取消选取
   	$("#qx input").removeAttr("checked");
   }else {                 //如果是选取，就要判断其他是否都已经全部选取了
       var ab = document.getElementsByName("rr");
       for (var i = 0; i < ab.length; i++) {
           if (!ab[i].checked) {//如果有一个没有选上，那么就返回
               y = false;
           	break;
           }
       }
      if(y){
          $("#qx input").attr("checked","checked");
      }
   }
}

//批量删除
function scheng(){
	var boxLen = $('input:checkbox[name=rr]:checked').length;
	if(boxLen==0){
		layer.msg("请勾选一项目录");
		return;
	}else{
	  	var arrx = '';
	  	var boxArr = $('input:checkbox[name=rr]:checked');
	  	for(var i=0; i<boxArr.length;i++){
	  		arrx += boxArr[i].value;
	  		arrx += ",";
	  	}
	  	arrx = arrx.substring(0,(arrx.length-1));
		layer.confirm('是否删除？', {
		    btn: ['确定','取消'], 
		    shade: false 
		}, function(){
			 $.ajax({
		         url: '${ctx}/notices/deletePiNotice/'+arrx,
		         type: "GET",
		         data: {},
		         dataType: "json"
		     }).done(function(data,ss) {
		    	 if(data.result=='true'){
		    		 layer.msg('批量删除成功');
			    	 $("#noticeJqgrid").trigger("reloadGrid");	 
		    	 }else{
		    	 	layer.msg(data.msg);
			    	$("#noticeJqgrid").trigger("reloadGrid");	 
		    	 }
		     }).fail(function(jqXHR, textStatus, errorThrown){
		    	 layer.msg('删除失败，请稍后重试');
		     }	 
		     );
		}, function(){
		    
		});
	  	
	}
}

	function show(obj){
		$("#buType").val(obj);
	}
</script>
</rapid:override>
<%@ include file="../template/base.jsp"  %>