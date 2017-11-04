<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rs" value="${ctx}/resources" />
<rapid:override name="css"><style>.red{color:red;}</style></rapid:override>
<rapid:override name="title">jqgrid</rapid:override>
<rapid:override name="content">
	<div class="portlet box blue">
               <div class="portlet-title ">
                    <div class="caption">
                       	修改用户
                    </div>
<!--                     <div class="tools"> -->
<!-- 								<a class="collapse" href="" data-original-title="" title=""> -->
<!-- 								</a> -->
<!--                     </div> -->
                </div>
                    <div class="portlet-body form">
               		 <br/>
                        <form class="form-horizontal" id="userForm" method="post">
                            <input type="hidden" name="ID" value="${map.ID}">
                            <input type="hidden" id="JSMARR" value="${map.JSMARR}">
                            <input type="hidden" id="JSIDARR" value="${map.JSIDARR}">
                              <c:if test="${map.YHLX=='XYZX'}">
                              	  <div class="form-group">
		                              <label class="col-lg-3 control-label">姓名：</label>
		                              <div class="col-lg-3">
		                                  <input type="text" name="XM" id = "XM" placeholder="姓名" value="${map.XM}" class="form-control">
		                              </div>
		                              <label class="help-inline red">*</label>
		                          </div>
                           		 <div class="form-group">
		                              <label class="col-lg-3 control-label">身份证号：</label>
		                              <div class="col-lg-3">
		                                  <input type="text" name="YHM" id = "YHM" placeholder="身份证号" value="${map.YHM}" class="form-control">
		                              </div>
		                              <label class="help-inline red">*</label>
		                          </div>
                              </c:if>
                              <c:if test="${map.YHLX=='XYB'}">
                              	 <div class="form-group">
		                              <label class="col-lg-3 control-label">姓名：</label>
		                              <div class="col-lg-3">
		                                  <input type="text" name="XM" id = "XM" placeholder="姓名" value="${map.XM}" class="form-control" disabled="disabled">
		                              </div>
		                              <label class="help-inline red">*</label>
		                          </div>
                             	 <div class="form-group">
		                              <label class="col-lg-3 control-label">身份证号：</label>
		                              <div class="col-lg-3">
		                                  <input type="text" name="YHM" id = "YHM" placeholder="身份证号" value="${map.YHM}" class="form-control" disabled="disabled">
		                              </div>
		                              <label class="help-inline red">* 将用于平台登录</label>
		                          </div>
		                          
                               </c:if>    
                           
                             <div class="form-group">
                                <label class="col-lg-3 control-label">新密码：</label>
                                <div class="col-lg-3">
                                    <input type="password" name="MM" id="MM" placeholder="新密码" class="form-control" value="${map.MM }">
                                </div>
                                <label class="help-inline red">* 长度在8-20位，必须含有"小写字母"、大写字母"、"数字"、"特殊符号"中的任意三种</label>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">新密码确认：</label>
                                <div class="col-lg-3">
                                    <input type="password" id="MMYZ" name="MMYZ" placeholder="新密码确认" class="form-control" value="${map.MM }">
                                </div>
                                <label class="help-inline red">* 请重新输入密码</label>
                            </div>
                            
                            <c:if test="${map.YHLX=='XYZX'}">
	                            <div class="form-group">
	                                <label class="col-lg-3 control-label">是否CA用户：</label>
	                                <div class="col-lg-9">
	                                	<div class="radio-list">
												<label class="radio-inline">
													<span class="${map.SFCA==1 ? 'checked' : '' }"><input name="SFCA"  value="1"  type="radio" class="radiosCA" ${map.SFCA==1 ? 'checked=checked' : '' }></span>
														是
												</label>
												<label class="radio-inline">
													<span class="${map.SFCA==2 ? 'checked' : '' }"><input name="SFCA" value="2"  type="radio" class="radiosCA" ${map.SFCA==2 ? 'checked=checked' : '' }></span>
														否
												</label>
											</div>
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <label class="col-lg-3 control-label">CA标识符：</label>
	                                <div class="col-lg-3">
	                                    <input type="text" name="CABZF" id="CABZF" placeholder="CA标识符" class="form-control" ${map.SFCA==2 ? 'disabled=disabled' : '' } value="${map.CABZF=='0' ? '': map.CABZF}">
	                                </div>
	                            </div>
                             </c:if>    
                   			
                              <div class="form-group">
                                <label class="col-lg-3 control-label">部门：</label>
                                <input type="hidden" id="BMID" value="${map.BMID }"/>
                                <div class="col-lg-3">
                                    <select name="BMID" id="BMID_SEL1" class="form-control">
                                    </select>
                                </div>
                                <label class="help-inline red">*</label>
                            </div>
                            
                        <%--      <div class="form-group">
                                <label class="col-lg-3 control-label">处室：</label>
                                <div class="col-lg-3">
                                    <input type="text" name="CS" id="CS" placeholder="处室" class="form-control" value="${map.CS }">
                                </div>
                            </div> --%>
                            
                            <div class="form-group">
                                <label class="col-lg-3 control-label">职务：</label>
                                <div class="col-lg-3">
                                    <input type="text" name="ZW" id="ZW" value="${map.ZW}"  class="form-control">
                                </div>
                                  <label class="help-inline red">*</label>
                            </div>
                            
                         <c:if test="${map.YHLX=='XYZX'}">    
	                        <div class="form-group">
								<label class="col-lg-3 control-label">角色：</label>
									<div class="col-md-3">
										  <select id="JSID" class="form-control" size="8" multiple="multiple"></select>
								    </div>
										    	
								    <div class="col-md-1">
										  <button type="button" id="JSID_rightAll" class="btn btn-block" style="margin-left: 0px;"><i class="glyphicon glyphicon-forward"></i></button>
										  <button type="button" id="JSID_rightSelected" class="btn btn-block" style="margin-left: 0px;"><i class="glyphicon glyphicon-chevron-right"></i></button>
										  <button type="button" id="JSID_leftSelected" class="btn btn-block" style="margin-left: 0px;"><i class="glyphicon glyphicon-chevron-left"></i></button>
										  <button type="button" id="JSID_leftAll" class="btn btn-block" style="margin-left: 0px;"><i class="glyphicon glyphicon-backward"></i></button>
								   </div>
								   <div class="col-md-3">
										  <select name="JSIDTO" id="JSID_to" class="form-control" size="8" multiple="multiple"></select>
								   </div>
								 <label class="help-inline red">*</label>
							</div>
						</c:if>
					    <c:if test="${map.YHLX=='XYB'}">
                       	   <div class="form-group">
                           		<label class="col-lg-3 control-label">角色：</label>
	                            <div class="col-lg-3">
	                                <input type="text"  placeholder="" value="区县（市）部门用户" class="form-control" disabled="disabled" >
	                             	<select name="JSIDTO" id="JSID_to"  value="" class="form-control" size="8"  style="display:none;">
	                               		<option value='bd004325d76145f38bd963f0cfef0a6a'>区县（市）部门用户</option>
	                               	</select>
	                            </div>
                             <label class="help-inline red">*</label>
                      		 </div>
                        </c:if>
						 
                        <div class="form-group">
                            <label class="col-lg-3 control-label">状态：</label>
                            <div class="col-lg-9">
                            	<div class="radio-list">
									<label class="radio-inline">
										<span class="${map.ZT==1 ? 'checked' : '' }"><input name="ZT" id="radios1" value="1"  type="radio" class="radios" ${map.ZT==1 ? 'checked=checked' : '' }></span>
											启用
									</label>
									<label class="radio-inline">
										<span class="${map.ZT==2 ? 'checked' : '' }"><input name="ZT" id="radios2" value="2"  type="radio" class="radios" ${map.ZT==2 ? 'checked=checked' : '' }></span>
											停用
									</label>
								</div>
                            </div>
                        </div>
                        
                            <div class="form-group">
                                <label class="col-lg-3 control-label">手机号码：</label>
                                <div class="col-lg-3">
                                    <input type="text" name="JSSJHM" placeholder="手机号码" value="${map.JSSJHM}" class="form-control sjhm">
                                </div>
                                <label class="help-inline red">* 用于接收重要通知短信</label>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">电子邮箱：</label>
                                <div class="col-lg-3">
                                    <input type="text" name="DJYX" placeholder="电子邮箱" value="${map.DJYX}" class="form-control mail">
                                </div>
                                <label class="help-inline red">* 用于接收重要通知邮箱</label>
                            </div>
                           
                           
                           
                           <div class="form-actions"> 
									<div class="row">
										<div class="col-md-offset-3 col-md-9">
											<button class="btn blue" type="submit"><i class="fa fa-check"></i> 提  交</button>
											<a href="${ctx}/users/getInit?page=${page}"><button class="btn blue" id="back" type="button"><i class="fa fa-reply"></i> 返  回</button></a>
										</div>
									</div>
							</div>	
                        </form>
                    </div>
                </div>
</rapid:override>
<rapid:override name="script">
<script src="${rs}/js/jquery.form.js"></script>
<script src="${rs}/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${rs}/js/plugins/validate/messages_zh.min.js"></script>
<link href="${rs}/js/plugins/layer/skin/layer.css" rel="stylesheet">
<script src="${rs}/js/plugins/layer/layer.js"></script>
<!-- Page-Level Scripts -->
<script type="text/javascript">
  
    //以下为官方示例
    $().ready(function () {
    	//设置value=?的项目为当前选中项 
    	//$("#uniform-radios"+$("#ZT").val()+" span").addClass('checked');
       //角色多选框
    	$('#JSID').multiselect();
       
    	//初始化部门
        $.ajax({
            url: '${ctx}/dept/initDeptList',
            type: "POST",
            data: {},
            dataType: "json"
        }).done(function(data,ss) {
       		var list = "<option value=''>请选择部门</option>";
       		for(var i=0; i<data.length; i++){
       			list += "<option value='"+data[i].ID+"'>"+data[i].BMMC+"</option>";
       			//st += "<input type='checkbox' name='rr' value='"+data[i].ID+"' onclick='checkItem(this,"+'bb'+")' style='margin-left:10px;' />"+data[i].BMMC;
       		}
       		$("#BMID_SEL1").html(list);
    		$("#BMID_SEL1 option[value='"+$("#BMID").val()+"']").attr("selected",true);//当前用户所在部门
        }).fail(function(jqXHR, textStatus, errorThrown){
       	 	layer.msg('数据加载失败，请稍后重试');
        });
        
       
        //初始化角色
        $.ajax({
            url: '${ctx}/role/initRoleList',
            type: "POST",
            data: {},
            dataType: "json"
        }).done(function(data,ss) {
       		var list = "";
       		var list_to = "";
       		var JSMARR = new Array();
       		var JSIDARR = new Array();
       		var JSMArray = new Array();
       		var JSIDArray = new Array();
       		
       		for(var i=0; i<data.length; i++){//遍历所有角色 并且放入数组
       			JSIDArray.push(data[i].ID);
       			JSMArray.push(data[i].JSM);
       		}


       			if($("#JSMARR").val().indexOf(",")>0){//判断是否存在多个
       				JSMARR = $("#JSMARR").val().split(",");//用户拥有的jsm数组（右边）
       				JSIDARR = $("#JSIDARR").val().split(",");//用户拥有的jsid数组（右边）
       	       		var a = arr_dive(JSIDARR,JSIDArray);//所有角色的id减去拥有角色的id（左边）
       	       		var b = arr_dive(JSMARR,JSMArray);//所有角色的jsm减去拥有角色的jsm（左边）
       				for(var j=0; j<JSMARR.length; j++){
       					list_to += "<option value='"+JSIDARR[j]+"'>"+JSMARR[j]+"</option>";
       				}
       				for(var j=0; j<a.length; j++){
       					list += "<option value='"+a[j]+"'>"+b[j]+"</option>";
       				}
       			}else{
       				
       				 list_to += "<option value='"+$("#JSIDARR").val()+"'>"+$("#JSMARR").val()+"</option>";
       				for(var j=0; j<data.length; j++){
       					if(data[j].ID!=$("#JSIDARR").val()) list += "<option value='"+data[j].ID+"'>"+data[j].JSM+"</option>";
       				}
       			}
       		
       		$("#JSID").html(list);
       		$("#JSID_to").html(list_to);
        }).fail(function(jqXHR, textStatus, errorThrown){
       	 	layer.msg('数据加载失败，请稍后重试');
        });
         
    	//修改表单提交
    	$("#userForm").validate({
            submitHandler: function(form){
            	layer.confirm('是否修改？', {
        		    btn: ['确定','取消'], 
        		    shade: false 
        		}, function(){
        			//右边角色全选
        	    	$("#JSID_to option").each(function(){
            		    $(this).attr("selected","selected");
            		});
	                $("#userForm").ajaxSubmit({
	                    url:'${ctx}/users/updateUser',
	                    dataType:'json',
	                    type:'post',
	                    success:function(data){
	                        var code = data.code;
	                        var  XM =  $("#XM").val();
	                    	  XM = encodeURI(encodeURI(XM)); 
	                        var  YHM =  $("#YHM").val();
	                        var  MM2 =  $("#MM").val();
	                        MM = escape(MM2) ;
	                        var  BMMC =   $("#BMID_SEL1").find("option:selected").text(); 
	                        BMMC = encodeURI(encodeURI(BMMC));
	                        if(code == 0){
	                            layer.msg('用户信息修改成功');
	                            window.location.href = 'http://10.19.13.245/jcms/interface/ldap/receive.jsp?state=C&result=T&loginuser='+YHM+'&loginpass='+MM+'&domainname='+BMMC+'&alldomainname= '+BMMC+'&modifyuser=T&ndlogin=0&t_name='+XM;
	                            window.location.href = '${ctx}/users/getInit';
	                           
	                        }else{
	                        	layer.msg(data.msg);
	                        }
	                        return false;
	                    },
	                    error:function(html){
	                    	layer.msg("提交数据失败，代码:" +html.status+ "，请稍候再试");
	                    }
	                });
	            }, function(){
	    		    
	    		});
            },
            rules: {
            	YHM:{required:true,maxlength:20},
            	XM:{required:true},
            	MM:{required:true,rangelength:[8,20],equalTo:"#MMYZ",regex:true  },
            	MMYZ:{required:true,rangelength:[8,20],equalTo:"#MM",regex:true  },
            	JSSJHM: { required: true,digits:true,maxlength:11 },
                DJYX: { required: true,email:true },
                BMID: { required: true },
                JSIDTO: { required: true }
            },
            messages: {
            	YHM:{required:"<span style='color:red'>请输入用户名</span>"},
            	XM:{required:"<span style='color:red'>请输入姓名</span>"},
            	MM:{required:"<span style='color:red'>请输入密码</span>",rangelength:"<span style='color:red'>请输入长度在8-20位的密码</span>",equalTo:"<span style='color:red'>两次输入的密码不相同</span>"},
            	MMYZ:{required:"<span style='color:red'>请确认密码</span>",rangelength:"<span style='color:red'>请输入长度在8-20位的密码</span>",equalTo:"<span style='color:red'>两次输入的密码不相同</span>"},
            	JSSJHM: { required: "<span style='color:red'>请输入您的手机号</span>" },
            	DJYX: { required: "<span style='color:red'>请输入电子邮箱</span>" },
            	BMID: { required: "<span style='color:red'>请选择部门</span>" },
            	JSIDTO: { required: "<span style='color:red'>请选择角色</span>" }
            }
        });
    	 jQuery.validator.addMethod("regex",function(str, element){  //扩展方法示例:　　　　　　　　　　　  
 			/* var regExp1 =/^(?=.*[0-9].*)(?=.*[A-Z].*)(?=.*[a-z].*).{8,20}$/; //
 			var regExp2 =/(?=.*[a-z])(?=.*\d)(?=.*[#@!~%^&*])[a-z\d#@!~%^&*]/i; //   ~!@#$%^&*
 			var flag= 0;
 		    if(regExp1.test(value)){
 			 flag=flag+1;
 			}  
 	   		 if(regExp2.test(value)){
 	   			 flag=flag+1;
 	   		 }  
 			 if(flag==2){ 
 				return true;
 			}else{ 
 				return false;
 			}  */
 			
 			var rC = {  lW:'[a-z]',  uW:'[A-Z]',  nW:'[0-9]',  sW:'[\\u0020-\\u002F\\u003A-\\u0040\\u005B-\\u0060\\u007B-\\u007E]'  };
			
			var tR = {  l:Reg(str, rC.lW),  u:Reg(str, rC.uW), n:Reg(str, rC.nW), s:Reg(str, rC.sW)  };
			
 			function Reg(str, rStr){ 
		        var reg = new RegExp(rStr); 
		        if(reg.test(str)) return true; 
		        else return false; 
		    }
 			
 			if((tR.l && tR.u && tR.n) || (tR.l && tR.u && tR.s) || (tR.s && tR.u && tR.n) || (tR.s && tR.l && tR.n)){ 
 	           // document.title = '密码符合要求'; 
 	            return true; 
 	        }else{ 
 	           // document.title = '您的密码必须含有“小写字母”、“大写字母”、“数字”、“特殊符号”中的任意三种'; 
 	            return false; 
 	        }
 			
 			//alert(regExp1.test(value))
 			//return  regExp1.test(value);         //value  被验证的input传入的值  
 	       },"<span style='color:red'>您的密码必须含有“小写字母”、“大写字母”、“数字”、“特殊符号”中的任意三种</span>"); 
    	
        //是否CA用户
        $(".radiosCA").click(function(){
     	   $("input:radio[name='SFCA']").attr("checked",false);
     	   $(this).attr('checked',true); 
     	   if($(this).val()==1)$("#CABZF").attr('disabled',false);
     	   else $("#CABZF").attr('disabled',true);
 		});
    	
        //validate自定义方法名 
        jQuery.validator.addMethod("sjhm", function(value, element) {
     	     var length = value.length;     
     	     var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(16[0-9]{9})|(19[0-9]{9})|(15[0-9]{9})$/;    
     	     return (length == 11 && mobile.exec(value))? true:false; 
        }, "<span class='help-inline' style='color:red;'>请正确填写您的手机号码</span>");
        
      //邮箱 表单验证规则
        jQuery.validator.addMethod("mail", function (value, element) {
        	var mail = /^[a-z0-9._%-]+@([a-z0-9-]+\.)+[a-z]{2,4}$/;
        	return this.optional(element) || (mail.test(value));
        }, "<span class='help-inline' style='color:red;'>邮箱格式不对</span>");
      
       
      
      //end ready 
    });

    
    
    //取出两个数组的补集
    function arr_dive(b,c){   //第一个数组减去第二个数组
    	var a = {};
 		for(var i = 0;i< b.length; i++){
   		    if(!a[b[i]]){
   		        a[b[i]] = true;  
   		    }
   		}

   		for(var i = 0;i< c.length; i++){
   		    if(a[c[i]]){
   		            c.splice(i,1);   /*从一个数组中第i位移除一个或多个元素*/
   		            i--;
   		    }
   		}
   		return c;
    }
</script>
</rapid:override>
<%@ include file="../template/base.jsp"  %>
