<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rs" value="${ctx}/resources" />

<rapid:override name="title">宁波市公共信用信息服务平台</rapid:override>
<rapid:override name="css">
	<link href="${rs}/css/plugins/jQueryUI/jquery-ui-1.10.4.custom.min.css"
		rel="stylesheet">
	<!-- Data Tables -->
	<link href="${rs}/css/plugins/jqgrid/ui.jqgrid.css" rel="stylesheet">
	<link href="${rs}/js/plugins/layer/skin/layer.css" rel="stylesheet">
	<style>
/* Additional style to fix warning dialog position */
#alertmod_table_list_2 {
	top: 900px !important;
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
	<div class="wrapper">
		<div class="portlet box blue">
			<div class="portlet-title ">
				<div class="caption">新增短信消息</div>
				<div class="tools">
<!-- 					<a class="collapse" href="" data-original-title="" title=""> </a> -->
				</div>
			</div>
			<div class="portlet-body form">
				<div class="form-horizontal">
					<div class="wrapper wrapper-content  animated fadeInRight">
						<br />
						<div class="row" style="margin-left: 6px">
							<div class="col-lg-12">
								<div class="ibox ">
									<div class="ibox-content">
										<div>
											<div id="selectArea" style="display: none">
												<div>
													<select id="bm-select" class="input-control"
														onchange="getUserByBMID(this)"></select>
												</div>
												<div style="margin-top: 12px">
													<table width="288"  border="0" cellpadding="0"
														cellspacing="0">
														<tr>
															<td colspan="4"><select name="from" id="from"
																multiple="multiple" size="8" style="width: 150px;height:180px"
																class="input-control">
															</select></td>
															<td align="center" width="100px">
																<button type="button" id="addAll"
																	style="width: 60px; margin-left: 6px; margin-right: 6px">>></button>
																<br />
																<button type="button" id="addOne"
																	style="width: 60px; margin-top: 6px">></button>
																<br />
																<button type="button" id="removeOne"
																	style="width: 60px; margin-top: 6px">&lt;</button>
																<br />
																<button type="button" id="removeAll"
																	style="width: 60px; margin-top: 6px">&lt;&lt;</button>
																<br />
															</td>
															<td colspan="4"><select name="to" id="to"
																multiple="multiple" size="8" style="width: 150px;height:180px"
																class="input-control">
															</select></td>

														</tr>
													</table>
												</div>
											</div>


											<br />

											<div class="form-group" style="height: 100%"
												id="div_contactlist">
												<!-- 横线
													<div
														style="border-top: 1px solid #000; width: 70%; height: 1px; margin-top: 16px"></div>
													<div style="margin-top: 12px;">
													 -->
												<div class="row">
													<div class="col-md-12">
														<button type="button" class="btn default"
															onClick="showAdd()" id="btn_add"
															style="margin-left: 12px">
															<i class="fa fa-plus"></i>&nbsp;添加
														</button>
														<button type="button" class="btn default"
															id="btn_deletecontact"
															style="display: none; margin-left: 12px">
															<i class="fa fa-times-circle"> </i>&nbsp;全部
														</button>
													</div>
												</div>
												<div id="contact_area" style="margin-left: 12px"></div>
											</div>

											<div class="jqGrid_wrapper"
												style="margin-top: 8px; margin-left: 6px; margin-right: 20px; width: 50%">
												<table id="contactorJqgrid"></table>
												<div id="pager_list"></div>
											</div>

											<div style="margin-left: 6px; margin-top: 12px">
												<input type="text" name="biaoti" id="biaoti" class="input-control"
													placeholder="请填写标题"
													style="resize: none; width: 30%; height: 36px"/>
											</div>
													
											<div style="margin-left: 6px; margin-top: 12px">
												<textarea name="MBNR" id="textarea_nr" class="input-control"
													placeholder="请填写内容"
													style="resize: none; width: 50%; height: 120px"></textarea>
											</div>
											
											<div style="margin-left: 6px; margin-top: 16px">
												<button type="button" class="btn btn-primary" id="btn_send">
													<i class="fa fa-plus"></i>&nbsp;发送
												</button>
												<button type="button" class="btn btn-primary"
													id="btn_cancel" style="background-color: #F36A5A">
													<i class="fa fa-times-circle"></i>&nbsp;放弃
												</button>
											</div>
											<br />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</rapid:override>

<rapid:override name="script">
	<!--  <script src="${rs}/js/jquery-2.1.1.min.js"></script> -->
	<script src="${rs}/js/plugins/jqgrid/i18n/grid.locale-cn.js"></script>
	<script src="${rs}/js/plugins/jqgrid/jquery.jqGrid.min.js"></script>
	<script src="${rs}/js/plugins/layer/layer.js"></script>
	<script>
		var globalObject = {
			"defaultValue" : "0",
			"chooseUserList" : []
		};

		function chooseUser(name, userId, bmName, bmId, mobile) {
			this.userId = userId;
			this.name = name;
			this.bmName = bmName;
			this.bmId = bmId;
			this.mobile = mobile;
		}

		function showAdd() {
			var obj = document.getElementById("selectArea");

			if ($(obj).is(":visible")) {
				$(obj).hide("slow", function() {
					$("#btn_add").html('<i class="fa fa-plus"></i>&nbsp;添加');
				});

			} else {
				$(obj).show("slow", function() {
					$("#btn_add").text("确定");
				});
			}
		}

		function addCellAttr(rowId, val, rawObject, cm, rdata) {
			if (val < 0) {
				return "style='color:red'";
			} else {
				return "style='color:green'";
			}
		}

		function deleteItem(obj) {
			layer.confirm('是否删除该联系人？', {
				btn : [ '确定', '取消' ],
				shade : false
			},
					function() {
						var userId = obj.getAttribute("id");
						var BMID =$(obj).next().val();
						// 遍历option Select 
						$("#to option").each(function() {
									var indexValue = $(this).attr("index");
									if (indexValue == userId) {
										$(this).clone().appendTo("#from");
										$("#to option[index=" + indexValue + "]").remove();
									}
								});
						layer.msg("正在更新...");
						for(var i=0;i<globalObject["chooseUserList"].length;i++){
							if(globalObject["chooseUserList"][i].bmId==BMID&&globalObject["chooseUserList"][i].userId==userId){
								globalObject["chooseUserList"].splice(i,1);
								break;
							}
						}
						initjQgrid();
					}, function() {

					});
		}

		function isphone(inputString) {
			var partten = /^1[3,4,5,6,7,8]\d{9}$/;
			if (partten.test(inputString)) {
				return true;
			} else {
				return false;
			}
		}
		//获取所有的部门
		function getBMList() {
			globalObject["defaultValue"] = "0";
			$.ajax({
				url : '${ctx}/message/findAllBMs/',
				type : "POST",
				data : {},
				dataType : "json"
			}).done(
					function(resultData, ss) {
						var data = resultData["BMList"];
						var appendHtml = "<option  value="+globalObject["defaultValue"]+">请选择部门</option>";
						for ( var i = 0; i < data.length; i++) {
							appendHtml += "<option id='"+data[i].ID+"' value='"+data[i].ID+"'>"
									+ data[i].BMMC + "</option>";
						}
						$("#bm-select").append(appendHtml);

					}).fail(function(jqXHR, textStatus, errorThrown) {
				layer.msg('数据获取失败，请稍后重试');
			});
		}

		//根据部门ID 获取该部门的用户
		function getUserByBMID(obj) {
			var BMID = $(obj).find("option:selected").val();
						
			if (BMID == globalObject["defaultValue"]) {
				$("#from").html("");
				$("#to").html("");
				return;
			}
			$.ajax({
						url : '${ctx}/message/getUserByBMID/',
						type : "POST",
						data : {
							"BMID" : BMID,
						},
						dataType : "json",
					})
					.done(function(resultData, ss) {
								if (resultData == null
										|| resultData.length == 0) {
									layer.msg("没有数据");
									$("#from").html("");
									$("#to").html("");
									return;
								}
								var fromAppendOptions = "";
								var toAppendOptions = "";
								var chooseUserList = globalObject["chooseUserList"];

								var thisBMchooseUser = [];

								for ( var i = 0; i < chooseUserList.length; i++) {
									if (chooseUserList[i].bmId == BMID) {
										thisBMchooseUser.push(chooseUserList[i]);
									}
								}
								
								for ( var i = 0; i < resultData.length; i++) {
									for ( var j = 0; j < thisBMchooseUser.length; j++) {
										if (resultData[i].ID == thisBMchooseUser[j].userId) {
											bmId = thisBMchooseUser[j].bmId;
											userId = thisBMchooseUser[j].userId;
											toAppendOptions += "<option id="+bmId+" index="+userId+"  value="+thisBMchooseUser[j].mobile+">"+ thisBMchooseUser[j].name+ "</option>";
											resultData.splice(i,1);
											i--;
											break;
										}
									}
								}
								for ( var i = 0; i < resultData.length; i++) {
									bmId = resultData[i].BMID;
									userId = resultData[i].ID;
									fromAppendOptions += "<option id="+bmId+" index="+userId+"  value="+resultData[i].JSSJHM+">"+resultData[i].XM+ "</option>";
								}
								$("#from").html(fromAppendOptions);
								$("#to").html(toAppendOptions);

							}).fail(function(jqXHR, textStatus, errorThrown) {
						layer.msg('数据获取失败，请稍后重试');
					});
		}

		//获取部门联系人
		var initjQgrid = function() {
			
			var resultData = globalObject["chooseUserList"];
		
			if (resultData == null || resultData.length == 0) {
				$("#btn_deletecontact").hide("slow");
				$("#contact_area").html("");
				return;
			} else {
				if(resultData.length>2){
					for(var i=1;i<resultData.length;i++){
						for(var j=i;j>0;j--){
							if(resultData[j].bmName.toString()<resultData[j-1].bmName.toString()){
								var temp = resultData[j];
								resultData[j] = resultData[j-1];
								resultData[j-1] = temp;
							}
						}
					}
				}
				
				$("#btn_deletecontact").show("slow");
				var appendContactor = "";
				var shang = parseInt(resultData.length / 3);
				var yu = resultData.length % 3;
				for ( var i = 0; i < shang; i++) {
					appendContactor += '<div class="row" style="margin-top:6px">';
					for ( var j = 3 * i; j < 3 * (i + 1); j++) {
						appendContactor += '<span name="spcrowed" class="btn btn-circle btn-default btn-sm" id='+resultData[j].mobile+' style="margin-left:12px">'
								+ resultData[j].name+ '['
								+ resultData[j].bmName+ ']'
								+ '&nbsp;<i class="fa fa-times-circle" id='+ resultData[j].userId
								+ ' onClick="deleteItem(this)"></i><input type="hidden" value='+resultData[j].bmId+'></input></span>';
					}
					appendContactor += '</div>';
				}
				if (yu > 0) {
					appendContactor += '<div class="row" style="margin-top:6px">';
					for ( var i = resultData.length - yu; i < resultData.length; i++) {
						appendContactor += '<span name="spcrowed" class="btn btn-circle btn-default btn-sm" id='+resultData[i].mobile+' style="margin-left:12px">'
								+ resultData[i].name
								+ '['
								+ resultData[i].bmName
								+ ']'
								+ '&nbsp;<i class="fa fa-times-circle" id='
								+ resultData[i].userId
								+ '  onClick="deleteItem(this)"></i><input type="hidden" value='+resultData[i].bmId+'></input></span>';
					}
					appendContactor += '</div>';
				}
				$("#contact_area").html(appendContactor);
			}
		};

		function alertNotinUserId() {
			// alert(globalObject.Contactor["notInUserId"].toString());
		}

		function doubleClickToAdd(obj) {
			var BMID = $(obj).attr("id");
			var userId = $(obj).attr("index");
			var mobile =  $(obj).val();
			var name = $(obj).text();
			var bmName = $("#bm-select option:selected").text();
			//(name, userId, bmName, bmId, mobile)
			var  user = new chooseUser(name,userId,bmName,BMID,mobile);
			globalObject["chooseUserList"].push(user);
			$(obj).clone().appendTo("#to");
			$("#from option:selected").remove();
			initjQgrid();
		};

		function doubleClickToRemove(obj) {
			var BMID = $(obj).attr("id");
			var userId = $(obj).attr("index");
			for(var i=0;i<globalObject["chooseUserList"].length;i++){
				if(globalObject["chooseUserList"][i].bmId==BMID&&globalObject["chooseUserList"][i].userId==userId){
					globalObject["chooseUserList"].splice(i,1);
					break;
				}
			}
			$("#to option:selected").clone().appendTo("#from");
			$("#to option:selected").remove();
						
			initjQgrid();
		}

		$(document).ready(function() {
			getBMList();
			
			$("#from").dblclick(function() {
				doubleClickToAdd($("#from option:selected"));
			});

			$("#to").dblclick(function() {
				doubleClickToRemove($("#to option:selected"));
			});

			
			//选择一项  
			$("#addOne").click(function() {
				var obj = $("#from option:selected");
				if ($(obj).val() == undefined) {
					layer.msg("请选择联系人");
					return;
				}
				doubleClickToAdd(obj);
			});
			
		//选择全部  
		$("#addAll").click(function() {
			if ($("#from option").length == 0) {
				layer.msg("没有可选项");
				return;
			}
			var bmName = $("#bm-select option:selected").text();
			$("#from option").each(function(){
				var BMID = $(this).attr("id");
				var userId = $(this).attr("index");
				var mobile =  $(this).val();
				var name = $(this).text();
				var user = new chooseUser(name, userId, bmName, BMID, mobile);
				globalObject["chooseUserList"].push(user);
			});
			$("#from option").clone().appendTo("#to");
			$("#from option").remove();
			initjQgrid();
		});

		//移除一项  
		$("#removeOne").click(function() {
				var obj = $("#to option:selected");
				if ($(obj).val() == undefined) {
					layer.msg("请选择联系人");
					return;
				}
				doubleClickToRemove(obj);
		});

	//移除全部  
	$("#removeAll").click(function() {
		if ($("#to option").length == 0) {
			layer.msg("没有选择项");
			return;
		}
		var BMID = $("#to option:first").attr("id");
		$("#to option").clone().appendTo("#from");
		$("#to option").remove();
		for(var i=0;i<globalObject["chooseUserList"].length;i++){
			if(BMID==globalObject["chooseUserList"][i].bmId){
				globalObject["chooseUserList"].splice(i,1);
				i--;
			}
		}
		initjQgrid();
	});

	// 把JS对象转换到jQuery对象
	//var $obj = $(obj);
	$("#btn_send").click(function() {
					var znFB = true;
					var dxFB = false;
					var XXBT = $("#biaoti").val()+"";

					var content = $("#textarea_nr")
							.val();

					if (content == null|| content == "") {
						layer.msg("请填写内容");
						return;
					}
					if (obj == null|| obj.length == 0) {
						layer.msg("请添加联系人");
						return;
					}

					if (znFB == false&& dxFB == false) {
						layer.msg("请选择发布为站内消息或短信消息或都选");
						return;
					}
					layer.confirm('确定要发送么？',{
						btn : [
								'确定',
								'取消' ],
						shade : false
					},function() {
							var objlist = document.getElementsByName("spcrowed");
							if (objlist.length == null
									|| objlist.length == undefined
									|| objlist.length == 0) {
								layer.msg("请选择联系人!");
								return;
							}
							var nameArray = [];//联系人姓名
							var YHIDArray = [];//接收人id
							var mobileArray = [];//手机号
							var BMMCArray = [];//部门名称
							var BMIDArray = [];//部门id
							for ( var i = 0; i < objlist.length; i++) {
								var obj = objlist[i];
								var mobile = $(obj).attr("id");
								var XM = $(obj).text().split("[")[0];
								var BMMC = $(obj).text().split("[")[1]
										.split("]")[0];
								var userId = $(obj).children("i").attr("id");
								var BMID = $(obj).children("input").val();

								nameArray.push(XM);//联系人姓名
								YHIDArray.push(userId);//联系人ID
								mobileArray.push(mobile);//手机号
								BMMCArray.push(BMMC);//部门名称
								BMIDArray.push(BMID);//部门id
							}
							loading();
							$.ajax({
						url : '${ctx}/message/insertMessage/',
						type : "POST",
						data : {
							"nameArray" : nameArray
									.toString(),
							"YHIDArray" : YHIDArray
									.toString(),
							"mobileArray" : mobileArray
									.toString(),
							"BMMCArray" : BMMCArray
									.toString(),
							"BMIDArray" : BMIDArray
									.toString(),
							"content":content,
							"znFB" : znFB,
							"dxFB" : dxFB,
							"XXBT":XXBT
						},
						dataType : "json"
					}).done(
					function(data,ss) {
						hideLoading();
						if (data.result == "success") {
							layer.msg("发送成功");
							window.location.href = "${ctx}/message/getZnmessageForNotCenter/";
						} else {
							layer.msg('发送失败，请稍后重试');
						}
						
					}).fail(function(jqXHR,textStatus,errorThrown) {
				hideLoading();
				layer.msg('发布失败，请稍后重试');
			});
			}, function() {
				
			});
	});

		//删除全部联系人 
		$("#btn_deletecontact").click(function() {
			layer.confirm('是否删除全部联系人？', {
				btn : [ '确定', '取消' ],
				shade : false
			}, function() {
				$("#to option").clone().appendTo("#from");
				$("#to option").remove();
				layer.msg("正在更新");
				globalObject["chooseUserList"]=[];
				initjQgrid();
			}, function() {
			});
		});
		
		$("#btn_cancel").click(function() {
			window.location.href = "${ctx}/message/getZnmessageForNotCenter";
		});
	});

		function loading() {
			layer.load(4, {
				shade : [ 0.5, '#ccc' ]
			    //0.1透明度的白色背景
			});
		}

		function hideLoading() {
			layer.closeAll('loading');
		}
	</script>

</rapid:override>
<c:if test='${sessionScope.loginname!="hzh_fgw" }'>
<%@ include file="../../template/base.jsp"  %>
</c:if>
<c:if test='${sessionScope.loginname=="hzh_fgw" }'>
<%@ include file="../../template/basenomenu.jsp"  %>
</c:if> 