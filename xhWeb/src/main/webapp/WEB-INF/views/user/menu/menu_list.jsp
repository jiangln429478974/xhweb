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
        .red{color:red;}
        .modal-footer{text-align: center;}
    </style>
</rapid:override>
<rapid:override name="content">

<div class="wrapper wrapper-content  animated fadeInRight">
											<div class="row">
												<p>
							                         <button class="btn btn-primary " type="button" id="btn-add" onclick="insertData();"><i class="fa fa-plus"></i>&nbsp;添加</button>
							                         <button class="btn green " type="button" id="btn-update" onclick="updateData();"><i class="fa fa-edit"></i>&nbsp;编辑</button>
							                         <button class="btn red " type="button" id="btn-delete" onclick="deleteData();"><i class="fa fa-times-circle"></i>&nbsp;删除</button>
							                         <button class="btn yellow " type="button" id="btn-frush" onclick="frushData();"><i class="fa fa-refresh"></i>&nbsp;刷新</button>
							                    	 <input type="hidden" id="menuName"/>
							                    	 <input type="hidden" id="menuId"/>
							                     </p>
							                     <div class="jqGrid_wrapper">
							                         <table id="menuJqgrid"></table>
							                         <div id="pager_list"></div>
							                         <input type="hidden" id="page" value="${page == null ? 1 : page}">
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
$(document).ready(function () {
    $("#menuJqgrid").jqGrid({
        url:'${ctx}/menu/getMenuList',
        datatype: "json",
        height: 'auto',
        autowidth: true,
        mtype:"POST",
        page:$("#page").val(),
        //shrinkToFit: true,
        //multiselect:true,//全选功能
        rownumbers:true,
        rowNum: 10,
        rowList: [10, 20, 30],
        colNames: ['选择','功能菜单名称','显示序号','URL地址','隐藏'],
        colModel: [
			{
				name:'ID',
				width:'10%',
				align:'center',
				formatter:function(cellvalue, options, rowObject){
					return	'<input type="radio" name="radio" value="'+cellvalue+'" onclick="selectRadio(\''+rowObject.GNCDMC+','+cellvalue+'\');"/>'+
					'';
				}
			},
            {name: 'GNCDMC',index: 'GNCDMC',align:'left',width:'25%'},
            {name: 'XH',index: 'XH',align:'left',width:'10%'},
            {name: 'URL',index: 'URL',align:'left',width:'55%'},
			{
				name:'GNCDID',
				hidden:true,
				formatter:function(cellvalue, options, rowObject){
					return	rowObject.ID;
				}
			}
        ],
        pager: "#pager_list",
        //viewrecords: true,
        caption: "功能菜单信息",
        //add: true,
        //edit: true,
        //addtext: 'Add',
        //edittext: 'Edit',
        hidegrid: false,
        shrikToFit: true,  
        subGrid: true,  // (1)开启子表格支持  
        subGridRowExpanded: function(subgrid_id, row_id) {  // (2)子表格容器的id和需要展开子表格的行id，将传入此事件函数  
        	var subgrid_table_id;  
            subgrid_table_id = subgrid_id + "_t";   // (3)根据subgrid_id定义对应的子表格的table的id  
              
            var subgrid_pager_id;  
            subgrid_pager_id = subgrid_id + "_pgr"  // (4)根据subgrid_id定义对应的子表格的pager的id  
              
            // (5)动态添加子报表的table和pager  
            $("#" + subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table><div id='"+subgrid_pager_id+"' class='scroll'></div>");  
              
           	var rowData = $('#menuJqgrid').jqGrid('getRowData',row_id);//获取选中父类的功能菜单名称
           	
            // (6)创建jqGrid对象  
            var PostData = {SJGNCDID:rowData.GNCDID};
            $("#" + subgrid_table_id).jqGrid({  
                url: "${ctx}/menu/getLowerMenuList",  // (7)子表格数据对应的url  
                autowidth: true,
                datatype: "json",  
                mtype:"POST",
                rownumbers:true,
                postData:PostData,
                colNames: ['选择','功能菜单名称','显示序号','URL地址','隐藏'],  
                colModel: [  
                    	{
							name:'ID',
							width:'5%',
							align:'center',
							formatter:function(cellvalue, options, rowObject){
								return	'<input type="radio" name="radio" value="'+cellvalue+'" onclick="selectRadio(\''+rowObject.GNCDMC+','+cellvalue+'\');"/>'+
								'';
							}
						},
			            {name: 'GNCDMC',index: 'GNCDMC',align:'center',width:'25%'},
			            {name: 'XH',index: 'XH',align:'center',width:'10%'},
			            {name: 'URL',index: 'URL',align:'center',width:'55%'},
						{
							name:'GNCDID',
							hidden:true,
							formatter:function(cellvalue, options, rowObject){
								return	rowObject.ID;
							}
						}
                ],  
                //prmNames: {search: "search"},  
                //pager: subgrid_pager_id,  
                //viewrecords: true,  是否显示总记录数
                height: "100%", 
                autowidth: true,
                rowNum: 100,
                shrikToFit: true,  
                subGrid: true,  // (1)开启子表格支持  
                subGridRowExpanded: function(subgrid_id1, row_id1) {  // (2)子表格容器的id和需要展开子表格的行id，将传入此事件函数  
                	//alert(subgrid_id1);
                	//alert(row_id1);
                	var subgrid_table_id1;  
                    subgrid_table_id1 = subgrid_id1 + "_t";   // (3)根据subgrid_id定义对应的子表格的table的id  
                      
                    var subgrid_pager_id1;  
                    subgrid_pager_id1 = subgrid_id1 + "_pgr"  // (4)根据subgrid_id定义对应的子表格的pager的id  
                      
                    // (5)动态添加子报表的table和pager  
                    $("#" + subgrid_id1).html("<table id='"+subgrid_table_id1+"' class='scroll'></table><div id='"+subgrid_pager_id1+"' class='scroll'></div>");  
                      
                   	var rowData1 = $('#menuJqgrid_'+row_id+'_t').jqGrid('getRowData',row_id1);//获取选中父类的功能菜单名称
                    // (6)创建jqGrid对象  
                    var PostData1 = {SJGNCDID:rowData1.GNCDID};
                    $("#" + subgrid_table_id1).jqGrid({  
                        url: "${ctx}/menu/getLowerMenuList",  // (7)子表格数据对应的url  
                        autowidth: true,
                        datatype: "json",  
                        mtype:"POST",
                        rownumbers:true,
                        postData:PostData1,
                        colNames: ['选择','功能菜单名称','显示序号','URL地址','隐藏'],  
                        colModel: [  
                            	{
        							name:'ID',
        							width:'3%',
        							align:'center',
        							formatter:function(cellvalue, options, rowObject){
        								return	'<input type="radio" name="radio" value="'+cellvalue+'" onclick="selectRadio(\''+rowObject.GNCDMC+','+cellvalue+'\');"/>'+
        								'';
        							}
        						},
        			            {name: 'GNCDMC',index: 'GNCDMC',align:'right',width:'27%'},
        			            {name: 'XH',index: 'XH',align:'right',width:'11%'},
        			            {name: 'URL',index: 'URL',align:'right',width:'60%'},
        						{
        							name:'GNCDID',
        							hidden:true,
        							formatter:function(cellvalue, options, rowObject){
        								return	rowObject.ID;
        							}
        						}
                        ],  
                        //prmNames: {search: "search"},  
                        //pager: subgrid_pager_id,  
                        //viewrecords: true,  是否显示总记录数
                        height: "100%", 
                        autowidth: true,
                        rowNum: 100
                   });  
                   	
                    //隐藏子表格的列表名gview_menuJqgrid_1_t_1_t
                    var t = "gview_menuJqgrid_"+row_id+"_t_"+row_id1+"_t";
                    $("#"+t).children("div")[1].style.display="none";
                    //var s = "menuJqgrid_"+row_id+"_t";
                   // var p = document.getElementById(s).childNodes;
                    //alert(p.length);
                    //alert(p[0].children);
                	//for(var i = 0,pl = p[0].children.length;i<pl;i++){
                	//	if(p[0].children[i].className=='ui-subgrid' && $("."+p[0].children[i].className).val()=='')p[0].children[i].style.display="none";
                	//   alert(p[0].children[i].className+"--"+($("."+p[0].children[i].className).val()));
                	//}
               }
           });  
            //隐藏子表格的列表名
            var t = "gview_menuJqgrid_"+row_id+"_t";
            $("#"+t).children("div")[1].style.display="none";
       }  
    });
 
    
   $(window).bind('resize', function () {
        var width = $('.jqGrid_wrapper').width();
        $('#menuJqgrid').setGridWidth(width);
    });

 
});
//删除某条数据
function deleteData(){
	var val=$('input:radio[name="radio"]:checked').val();
	var id = "";
    if(val==null){
    	layer.msg('请选择一个删除');
        return false;
    }
    else{
        id = val;
		layer.confirm('是否删除？', {
		    btn: ['确定','取消'], 
		    shade: false 
		}, function(){
			 $.ajax({
		         url: '${ctx}/menu/deleteMenu/'+id,
		         type: "POST",
		         data: {},
		         dataType: "json"
		     }).done(function(data,ss) {
		    	 layer.msg('数据删除成功');
		    	 $("#menuJqgrid").trigger("reloadGrid");
		    	 $("#menuName").val('');
		    	 $("#menuId").val('');
		 		 window.location.reload(); 
		     }).fail(function(jqXHR, textStatus, errorThrown){
		    	 layer.msg('数据删除失败，请稍后重试');
		     }	 
		     );
		}, function(){
		    
		});
    }
}
//编辑某条数据
function updateData(){
	var page = jQuery("#menuJqgrid").getGridParam('page');//当前页
	var val=$('input:radio[name="radio"]:checked').val();
	var id = "";
    if(val==null){
    	layer.msg('请选择一个编辑');
        return false;
    }
    else{
        id = val;
		window.location.href = "${ctx}/menu/toUpdateMenu?ID="+id+"&page="+page;
    }
}


//添加
	function insertData(){
	var menuName = $("#menuName").val();//获取上级菜单名称
	var menuId = $("#menuId").val();//获取上级菜单id
			BootstrapDialog.show({
				message: $('<form class="form-horizontal" id="menuForm" method="post"><div class="form-group"><label class="col-lg-3 control-label">功能菜单名称：</label><div class="col-lg-8"><input type="text" name="GNCDMC" id="GNCDMC" placeholder="功能菜单名称 " class="form-control"></div><label class="help-inline red">*</label>'+
                        '</div><div class="form-group"><label class="col-lg-3 control-label">上级功能菜单：</label><div class="col-lg-8"><input type="text" name="SJGNCDMC" id="SJGNCDMC" value="'+menuName+'" disabled="disabled" placeholder="上级功能菜单名称 " class="form-control"><input type="hidden" name="SJGNCDID" id="SJGNCDID" value="'+menuId+'"/></div>'+
                        '</div><div class="form-group"><label class="col-lg-3 control-label">序号：</label> <div class="col-lg-8"> <input type="text" name="XH" id="XH" placeholder="序号 " class="form-control"></div><label class="help-inline red">*</label>'+
                        '</div><div class="form-group"><label class="col-lg-3 control-label">URL地址：</label><div class="col-lg-8"><input type="text" name="URL" id="URL" placeholder="URL地址 " class="form-control"></div><label class="help-inline red">*</label>'+
                        '</div><div class="form-group"><label class="col-lg-3 control-label">是否CA验证：</label><div class="col-lg-4"> <label><input type="radio" name="CAYZ" id="CAYZ"  value="1" /> 是</label><label><input type="radio" name="CAYZ" id="CAYZ"  checked="checked" value="0" /> 否</label></div> '+
                        '</div><div class="form-group"><label class="col-lg-3 control-label">功能菜单描述：</label><div class="col-lg-8"><textarea type="text" name="GNCDMS" id="GNCDMS" placeholder="功能菜单描述" class="form-control"  style="resize: none;" rows="5" cols="10"></textarea></div></div></form>'),
	            title:"添加功能菜单",
	            buttons: [
	             {
	                label: '添 加',
	                cssClass: 'btn-primary',
	                action: function(){
	                	layer.confirm('是否添加？', {
	            		    btn: ['确定','取消'], 
	            		    shade: false 
	            		}, function(){
		                	var sign = subData();//提交添加的表单数据
		                	//dialogit.close();
		                	
		                	if(sign==0)window.location.href = "${ctx}/menu/getInit";
	            		}, function(){
	            		    
	            		});	
	                }
	            }, 
	            {
	                label: '返 回',
	                cssClass: 'btn-primary',
	                action: function(){
	                	window.location.href = "${ctx}/menu/getInit";
	                }
	            }]
	        });
	}
	
	//提交表单内容
	function subData(){
		var sign = '1';
		var GNCDMC = $("#GNCDMC").val();
    	var SJGNCDMC = $("#SJGNCDMC").val();
    	var SJGNCDID = $("#SJGNCDID").val();
    	var CAYZ =  $('input:radio[name="CAYZ"]:checked').val();
    	var XH = $("#XH").val();
    	var URL = $("#URL").val();
    	var GNCDMS = $("#GNCDMS").val();
    	if(GNCDMC=="")layer.msg('请输入功能菜单名称');
    	else{
    		if(XH=="" || isNaN(XH))layer.msg('请输入正确的序号');
    		else{
    			if(URL=="")layer.msg('请输入URL地址');
    			else{
	                	$.ajax({
	           	         url: '${ctx}/menu/addMenu',
	           	         type: "POST",
	           	      	 async:false,
	           	         data: {GNCDMC:GNCDMC,SJGNCDMC:SJGNCDMC,SJGNCDID:SJGNCDID,XH:XH,URL:URL,GNCDMS:GNCDMS,CAYZ:CAYZ},
	           	         dataType: "json"
		           	     }).done(function(data,ss) {
		           	    	 var code = data.code;
	     	                   if(code == 0){
	     	                	   sign = code;
	     	                       layer.msg('功能菜单添加成功');
	     	                       //form.reset();
	     	                   }else{
	     	                   	layer.msg(data.msg);
	     	                   }
		           	     }).fail(function(jqXHR, textStatus, errorThrown){
		           	    	 layer.msg('系统异常，请稍后重试');
		           	     });
        		}
    		}
    	}
    	return sign;
	}
	
//选择单条数据获取功能菜单名称
function selectRadio(obj){
	var str = obj.split(",");
	var name = str[0];
	var id = str[1];
	$("#menuName").val(name);
	$("#menuId").val(id);
}
	
//刷新页面
	function frushData(){
		$("#menuName").val('');
		$("#menuId").val('');
		window.location.reload(); 
	}
</script>
</rapid:override>
<%@ include file="../../template/base.jsp"  %>