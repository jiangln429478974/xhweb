<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rs" value="${ctx}/resources" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
	<script src="${rs}/js/jquery.form.js"></script>
	<script src="${rs}/js/plugins/validate/jquery.validate.min.js"></script>
	<script src="${rs}/js/plugins/validate/messages_zh.min.js"></script>

<script type="text/javascript">
    
    $().ready(function () {
        $("#myform").validate({
            submitHandler: function(form){
            	layer.confirm('是否新增？', {
        		    btn: ['确定','取消'], 
        		    shade: false 
        		}, function(){
        			alert('11');
	            	$("#myform").ajaxSubmit({
	                    url:'${ctx}/demo/add',
	                    dataType:'json',
	                    type:'post',
	                    success:function(data){
	                        var msg = data.result;
	                        if(msg == 1){
	                            layer.msg('新增成功');
	                            //window.location.href = '${ctx}/users/getInit';
	                            //form.reset();
	                        }else{
	                        	layer.msg('插入失败');
	                        }
	                    },
	                    error:function(html){
	                        alert("提交数据失败，代码:" +html.status+ "，请稍候再试");
	                  
	                    }
	                });
        		}, function(){
        		    
        		});
                return false; //不刷新页面 
            },
            <c:out value="${map.INSJSDY }"  escapeXml="false"/>
        });
        
    });
        
</script>
</head>
<body>

                        <form class="form-horizontal" id="myform" method="post">
                        <input type="hidden" name="BMC" value="${map.BMC }" />
                            <c:out value="${map.INSDY }"  escapeXml="false"/>
                            
                            
                            <div class="form-group">
                                <div class="col-lg-offset-3 col-lg-8">
                                    <button class="btn btn-primary" type="submit"><i class="fa fa-check">提交</i></button>
                               		<a href="javascript:history.go(-1);"><button class="btn yellow" type="button" id="back"><i class="fa fa-reply">返回</i></button></a>
                                </div>
                            </div>
                        </form>
</body>
</html>