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
        
        .tree {
    min-height:20px;
    padding:19px;
    margin-bottom:20px;
    background-color:#fbfbfb;
    border:1px solid #999;
    -webkit-border-radius:4px;
    -moz-border-radius:4px;
    border-radius:4px;
    -webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.05);
    -moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.05);
    box-shadow:inset 0 1px 1px rgba(0, 0, 0, 0.05)
}
.tree li {
    list-style-type:none;
    margin:0;
    padding:10px 5px 0 5px;
    position:relative
}
.tree li::before, .tree li::after {
    content:'';
    left:-20px;
    position:absolute;
    right:auto
}
.tree li::before {
    border-left:1px solid #999;
    bottom:50px;
    height:100%;
    top:0;
    width:1px
}
.tree li::after {
    border-top:1px solid #999;
    height:20px;
    top:25px;
    width:25px
}
.tree li span {
    -moz-border-radius:5px;
    -webkit-border-radius:5px;
    border:1px solid #999;
    border-radius:5px;
    display:inline-block;
    padding:3px 8px;
    text-decoration:none
}
.tree li.parent_li>span {
    cursor:pointer
}
.tree>ul>li::before, .tree>ul>li::after {
    border:0
}
.tree li:last-child::before {
    height:30px
}
.tree li.parent_li>span:hover, .tree li.parent_li>span:hover+ul li span {
    background:#eee;
    border:1px solid #94a0b4;
    color:#000
}
    </style>
</rapid:override>
<rapid:override name="content">

<div class="wrapper wrapper-content  animated fadeInRight">
       <div class="portlet box purple">
							<div class="portlet-title">
								<div class="caption">
									新增菜单功能
								</div>
								
							</div>
							<div class="portlet-body form">
								<!-- BEGIN FORM-->
								<form action="#" class="form-horizontal form-bordered">
									<div class="form-body">
										<div class="form-group">
											<label class="control-label col-md-3">功能菜单名称</label>
											<div class="col-md-4">
												<input  name="" class="form-control" maxlength="25" name="defaultconfig" id="maxlength_defaultconfig" type="text">
												
											</div>
										</div>
									<div class="form-group last">
									<label class="col-md-3 control-label">对应数据表</label>
									<div class="col-md-6">
								
										<div class="row" data-selectsplitter-wrapper-selector="">
											<div class="col-xs-12 col-sm-6">
												<select   id="select1" size="5" class="form-control" data-selectsplitter-firstselect-selector="">
													<option>Group 1</option>
													<option>Group 2</option>
													<option>Group 3</option>
													<option>Group 4</option>
												</select>
											</div> 
											<div class="col-xs-12 col-sm-6">
												<select  id="select2" size="5" class="form-control" data-selectsplitter-secondselect-selector="">
													
												</select>
											</div>
										</div>
									</div>
								</div>
										<div class="form-group">
											<label class="control-label col-md-3">功能菜单描述</label>
											<div class="col-md-9">
												<textarea id="maxlength_textarea" class="form-control" maxlength="225" rows="2" placeholder="请填写相关描述"></textarea>
											</div>
										</div>
										
										<div class="tree well">
										    <ul>
										        <li>
										            <span><i class="icon-folder-open"></i> Parent</span> <a href="">Goes somewhere</a>
										            <ul>
										                <li>
										                	<span><i class="icon-minus-sign"></i> Child</span> <a href="">Goes somewhere</a>
										                    <ul>
										                        <li>
											                        <span><i class="icon-leaf"></i> Grand Child</span> <a href="">Goes somewhere</a>
										                        </li>
										                    </ul>
										                </li>
										                <li>
										                	<span><i class="icon-minus-sign"></i> Child</span> <a href="">Goes somewhere</a>
										                    <ul>
										                        <li>
											                        <span><i class="icon-leaf"></i> Grand Child</span> <a href="">Goes somewhere</a>
										                        </li>
										                        <li>
										                        	<span><i class="icon-minus-sign"></i> Grand Child</span> <a href="">Goes somewhere</a>
										                            <ul>
										                                <li>
											                                <span><i class="icon-minus-sign"></i> Great Grand Child</span> <a href="">Goes somewhere</a>
												                            <ul>
												                                <li>
													                                <span><i class="icon-leaf"></i> Great great Grand Child</span> <a href="">Goes somewhere</a>
												                                </li>
												                                <li>
													                                <span><i class="icon-leaf"></i> Great great Grand Child</span> <a href="">Goes somewhere</a>
												                                </li>
												                             </ul>
										                                </li>
										                                <li>
											                                <span><i class="icon-leaf"></i> Great Grand Child</span> <a href="">Goes somewhere</a>
										                                </li>
										                                <li>
											                                <span><i class="icon-leaf"></i> Great Grand Child</span> <a href="">Goes somewhere</a>
										                                </li>
										                            </ul>
										                        </li>
										                        <li>
											                        <span><i class="icon-leaf"></i> Grand Child</span> <a href="">Goes somewhere</a>
										                        </li>
										                    </ul>
										                </li>
										            </ul>
										        </li>
										        <li>
										            <span><i class="icon-folder-open"></i> Parent2</span> <a href="">Goes somewhere</a>
										            <ul>
										                <li>
										                	<span><i class="icon-leaf"></i> Child</span> <a href="">Goes somewhere</a>
												        </li>
												    </ul>
										        </li>
										    </ul>
										</div>
										
										<div class="tree">
										    <ul>
										        <li>
										            <span><i class="icon-calendar"></i> 2013, Week 2</span>
										            <ul>
										                <li>
										                	<span class="badge badge-success"><i class="icon-minus-sign"></i> Monday, January 7: 8.00 hours</span>
										                    <ul>
										                        <li>
											                        <a href=""><span><i class="icon-time"></i> 8.00</span> &ndash; Changed CSS to accomodate...</a>
										                        </li>
										                    </ul>
										                </li>
										                <li>
										                	<span class="badge badge-success"><i class="icon-minus-sign"></i> Tuesday, January 8: 8.00 hours</span>
										                    <ul>
										                        <li>
											                        <span><i class="icon-time"></i> 6.00</span> &ndash; <a href="">Altered code...</a>
										                        </li>
										                        <li>
											                        <span><i class="icon-time"></i> 2.00</span> &ndash; <a href="">Simplified our approach to...</a>
										                        </li>
										                    </ul>
										                </li>
										                <li>
										                	<span class="badge badge-warning"><i class="icon-minus-sign"></i> Wednesday, January 9: 6.00 hours</span>
										                    <ul>
										                        <li>
											                        <a href=""><span><i class="icon-time"></i> 3.00</span> &ndash; Fixed bug caused by...</a>
										                        </li>
										                        <li>
											                        <a href=""><span><i class="icon-time"></i> 3.00</span> &ndash; Comitting latest code to Git...</a>
										                        </li>
										                    </ul>
										                </li>
										                <li>
										                	<span class="badge badge-important"><i class="icon-minus-sign"></i> Wednesday, January 9: 4.00 hours</span>
										                    <ul>
										                        <li>
											                        <a href=""><span><i class="icon-time"></i> 2.00</span> &ndash; Create component that...</a>
										                        </li>
										                    </ul>
										                </li>
										            </ul>
										        </li>
										        <li>
										            <span><i class="icon-calendar"></i> 2013, Week 3</span>
										            <ul>
										                <li>
										                	<span class="badge badge-success"><i class="icon-minus-sign"></i> Monday, January 14: 8.00 hours</span>
										                    <ul>
										                        <li>
											                        <span><i class="icon-time"></i> 7.75</span> &ndash; <a href="">Writing documentation...</a>
										                        </li>
										                        <li>
											                        <span><i class="icon-time"></i> 0.25</span> &ndash; <a href="">Reverting code back to...</a>
										                        </li>
										                    </ul>
										                </li>
												    </ul>
										        </li>
										    </ul>
									</div>
										
									<div class="form-actions">
										<div class="row">
											<div class="col-md-offset-3 col-md-9">
												<button type="submit" class="btn green"><i class="fa fa-check"></i> 保存</button>
												<button type="submit" class="btn purple"><i class="fa fa-check"></i> 保存并编写下一条</button>
												<button type="button" class="btn default">放弃</button>
											</div>
										</div>
									</div>
								</form>
								<!-- END FORM-->
							</div>
						</div>
</div>
</rapid:override>
<rapid:override name="script">
<script src="${rs}/js/plugins/jqgrid/i18n/grid.locale-cn.js"></script>
<script src="${rs}/js/plugins/jqgrid/jquery.jqGrid.min.js"></script>
<script src="${rs}/js/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="${rs}/js/plugins/layer/layer.js"></script>
<script src="${rs}/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${rs}/js/plugins/validate/messages_zh.min.js"></script>
<script src="${rs}/js/jquery.form.js"></script>
<script>

$(document).ready(function(){
	
	$("#select1").change(function(){
		var  optionStr='';
		for(var id=1;id<3;id++)
			optionStr+="<option  selected value= ' "+id+" ' > "+("option"+id)+"</option>";
		
			document.getElementById("select2").innerHTML = "";
			$("#select2").append(optionStr);		
			
	});
	
	  $('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', 'Collapse this branch');
	    $('.tree li.parent_li > span').on('click', function (e) {
	        var children = $(this).parent('li.parent_li').find(' > ul > li');
	        if (children.is(":visible")) {
	            children.hide('fast');
	            $(this).attr('title', 'Expand this branch').find(' > i').addClass('icon-plus-sign').removeClass('icon-minus-sign');
	        } else {
	            children.show('fast');
	            $(this).attr('title', 'Collapse this branch').find(' > i').addClass('icon-minus-sign').removeClass('icon-plus-sign');
	        }
	        e.stopPropagation();
	    });
});
</script>

</rapid:override>
<%@ include file="../../template/base.jsp"  %>