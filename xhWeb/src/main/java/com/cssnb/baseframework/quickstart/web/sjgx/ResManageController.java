package com.cssnb.baseframework.quickstart.web.sjgx;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import com.cssnb.baseframework.core.domain.JqgridPage;
import com.cssnb.baseframework.core.domain.JqgridResponse;
import com.cssnb.baseframework.core.domain.Response;
import com.cssnb.baseframework.core.util.ParameterUtil;
import com.cssnb.baseframework.quickstart.entity.sjgx.ResOrderContent;
import com.cssnb.baseframework.quickstart.entity.zTree.Node;
import com.cssnb.baseframework.quickstart.service.sjgx.ResManageService;
import com.cssnb.baseframework.quickstart.shiro.MyJdbcRealm.ShiroUser;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

/**
 * 
 * @类描述：数据共享信息管理
 * @项目名称：nbzwy-demo
 * @包名： com.cssnb.baseframework.quickstart.web.sjgx
 * @类名称：ResManageController
 * @创建人：wujiong
 * @创建时间：2015年8月4日上午9:32:58
 * @修改人：wujiong
 * @修改时间：2015年8月4日上午9:32:58
 * @修改备注：
 * @version v1.0
 * @see [nothing]
 * @bug [nothing]
 * @Copyright
 * @mail
 */
@Controller
@RequestMapping("/sjgx")
public class ResManageController {

	private static final Logger LOGGER = LoggerFactory
			.getLogger(ResManageController.class);

	@Autowired
	private ResManageService resManageService;

	/**
	 * 
	 * @描述:展示订单列表页重定向
	 * @方法名: showList
	 * @param model
	 * @return
	 * @返回类型 String
	 * @创建人 wujiong
	 * @创建时间 2015年8月6日下午3:30:40
	 * @修改人 wujiong
	 * @修改时间 2015年8月6日下午3:30:40
	 * @修改备注
	 * @since
	 * @throws
	 */
	@RequestMapping("/manage/datalist/index")
	public String showList(Model model) {
		Subject subject = SecurityUtils.getSubject();
		boolean hasAdminRole = subject.hasRole("admin");
		List<String> shareModes = resManageService.getShareMode();
		List<String> frequency = resManageService.getFrequency();
		List<String> department = resManageService.getDepartment();
		model.addAttribute("shareModes", shareModes);
		model.addAttribute("frequency", frequency);
		model.addAttribute("department", department);
		model.addAttribute("hasAdminRole", hasAdminRole);
		return "sjgx/sjgx_manage_list";
	}

	/**
	 * 
	 * @描述:获得订单列表数据
	 * @方法名: getJpgridData
	 * @param jqgridPage
	 * @param request
	 * @return
	 * @返回类型 JqgridResponse<HashMap<String,Object>>
	 * @创建人 wujiong
	 * @创建时间 2015年8月6日下午3:31:03
	 * @修改人 wujiong
	 * @修改时间 2015年8月6日下午3:31:03
	 * @修改备注
	 * @since
	 * @throws
	 */
	@RequestMapping("/manage/datalist/getdata")
	@ResponseBody
	public JqgridResponse<HashMap<String, Object>> getJpgridData(
			JqgridPage jqgridPage, WebRequest request) {
		Map<String, Object> param = ParameterUtil.getFilterMap(request);
		Subject subject = SecurityUtils.getSubject();
		ShiroUser shiroUser = (ShiroUser) subject.getPrincipal();
		param.put("userDepartmentId", shiroUser.getDepartmentId());
		PageList<HashMap<String, Object>> pagelist = resManageService
				.findInfoList(jqgridPage, param);
		return new JqgridResponse<>(pagelist);
	}

	/**
	 * 
	 * @描述:删除订单
	 * @方法名: deleteInfo
	 * @param id
	 * @return
	 * @返回类型 Response
	 * @创建人 wujiong
	 * @创建时间 2015年8月6日下午3:31:41
	 * @修改人 wujiong
	 * @修改时间 2015年8月6日下午3:31:41
	 * @修改备注
	 * @since
	 * @throws
	 */
	@RequestMapping("/manage/{id}/datalist/deletedata")
	@ResponseBody
	public Response deleteInfo(@PathVariable String id) {
		Response response = new Response();
		try {
			resManageService.deleteInfo(id);
			response.setCode(Response.SUCCESS);
		} catch (Exception ex) {
			String msg = "系统内部错误，删除用户失败";
			response.setMsg(msg);
			response.setCode(Response.ERROR);
			LOGGER.error(msg, ex);
		}
		return response;
	}

	/**
	 * 
	 * @描述:展现订单详情页重定向
	 * @方法名: showDetail
	 * @param id
	 * @param model
	 * @return
	 * @返回类型 String
	 * @创建人 wujiong
	 * @创建时间 2015年8月6日下午3:31:54
	 * @修改人 wujiong
	 * @修改时间 2015年8月6日下午3:31:54
	 * @修改备注
	 * @since
	 * @throws
	 */
	@RequestMapping("/manage/{id}/datalist/detaildata/index")
	public String showDetail(@PathVariable String id, Model model) {
		Map<String, Object> detail = resManageService.getDetail(id);
		String status = detail.get("STATUS")==null?"":detail.get("STATUS").toString();
		if("2".equals(status)){
			Map<String, Object> shareCount = resManageService.getShareCount(id);
			model.addAttribute("shareCount", shareCount);
		}
		model.addAttribute("detail", detail);
		model.addAttribute("id", id);
		return "sjgx/sjgx_manage_detail";
	}
	/**
	 * 
	 * @描述:审核的详情
	 * @方法名: showDetail4Check
	 * @param id
	 * @param model
	 * @return
	 * @返回类型 String
	 * @创建人 wujiong
	 * @创建时间 2015年8月18日下午3:54:06
	 * @修改人 wujiong
	 * @修改时间 2015年8月18日下午3:54:06
	 * @修改备注
	 * @since
	 * @throws
	 */
	@RequestMapping("/check/{id}/datalist/detaildata/index")
	public String showDetail4Check(@PathVariable String id, Model model) {
		Map<String, Object> detail = resManageService.getDetail(id);
		String status = detail.get("STATUS")==null?"":detail.get("STATUS").toString();
		if("2".equals(status)){
			Map<String, Object> shareCount = resManageService.getShareCount(id);
			model.addAttribute("shareCount", shareCount);
		}
		model.addAttribute("detail", detail);
		model.addAttribute("id", id);
		return "sjgx/sjgx_check_detail";
	}

	/**
	 * 
	 * @描述:展示订单内容
	 * @方法名: getDetail
	 * @param id
	 * @return
	 * @返回类型 List<Node>
	 * @创建人 wujiong
	 * @创建时间 2015年8月6日下午3:32:08
	 * @修改人 wujiong
	 * @修改时间 2015年8月6日下午3:32:08
	 * @修改备注
	 * @since
	 * @throws
	 */
	@RequestMapping("/manage/{id}/datalist/detaildata/content")
	@ResponseBody
	public List<Node> getDetail(@PathVariable String id) {
		List<ResOrderContent> contents = resManageService.getDetailContent(id);
		if (contents == null || contents.isEmpty()) {
			return Collections.emptyList();
		}
		Map<String, Map<String, Map<String, String>>> flagMap = new HashMap<>();
		for (int i = 0; i < contents.size(); i++) {
			ResOrderContent resOrderContent = contents.get(i);
			String departmentName = resOrderContent.getDepartmentName();
			String tableName = resOrderContent.getTableName();
			String colName = resOrderContent.getColName();

			Map<String, String> colMap = new HashMap<>();
			colMap.put(colName, colName);

			if (flagMap.containsKey(departmentName)) {
				Map<String, Map<String, String>> tableMapExist = flagMap
						.get(departmentName);
				if (tableMapExist.containsKey(tableName)) {
					Map<String, String> colMapExist = tableMapExist
							.get(tableName);
					colMapExist.putAll(colMap);
				} else {
					tableMapExist.put(tableName, colMap);
				}
			} else {
				Map<String, Map<String, String>> tableMap = new HashMap<>();
				tableMap.put(tableName, colMap);
				flagMap.put(departmentName, tableMap);
			}
		}
		List<Node> departmentNodes = new ArrayList<>();
		for (Entry<String, Map<String, Map<String, String>>> entry : flagMap
				.entrySet()) {
			String eDepartment = entry.getKey();
			List<Node> tableNodes = new ArrayList<>();
			for (Entry<String, Map<String, String>> entry2 : entry.getValue()
					.entrySet()) {
				String eTable = entry2.getKey();
				List<Node> colNodes = new ArrayList<>();
				for (Entry<String, String> entry3 : entry2.getValue()
						.entrySet()) {
					Node colNode = new Node();
					colNode.setName(entry3.getValue());
					colNodes.add(colNode);
				}
				Node tableNode = new Node();
				tableNode.setName(eTable);
				tableNode.setChildren(colNodes);
				tableNodes.add(tableNode);
			}
			Node departmentNode = new Node();
			departmentNode.setName(eDepartment);
			departmentNode.setChildren(tableNodes);
			departmentNodes.add(departmentNode);
		}
		return departmentNodes;
	}

	/**
	 * 
	 * @描述:订单增加页重定向
	 * @方法名: showAddOrder
	 * @param model
	 * @return
	 * @返回类型 String
	 * @创建人 wujiong
	 * @创建时间 2015年8月6日下午3:34:48
	 * @修改人 wujiong
	 * @修改时间 2015年8月6日下午3:34:48
	 * @修改备注
	 * @since
	 * @throws
	 */
	@RequestMapping("/manage/datalist/adddata/index")
	private String showAddOrder(Model model) {
		List<String> frequency = resManageService.getFrequency();
		List<Map<String, String>> resNames = resManageService.getResName();
		model.addAttribute("frequency", frequency);
		model.addAttribute("resNames", resNames);
		return "sjgx/sjgx_manage_order_add";
	}

	@RequestMapping("/manage/datalist/adddata/add")
	@ResponseBody
	public Response addOrder(WebRequest request) {
		Map<String, Object> param = ParameterUtil.getFilterMap(request);
		Subject subject = SecurityUtils.getSubject();
		ShiroUser shiroUser = (ShiroUser) subject.getPrincipal();
		String userId = shiroUser.getUserId() + "";
		param.put("userId", userId);
		String pOrderID = (String)param.get("orderId");
		if(pOrderID == null||pOrderID == ""){
			//TODO ADD
			String orderID = System.currentTimeMillis() + "";
			while (userId.length() < 4) {
				userId = "0" + userId;
			}
			param.put("orderId", orderID + userId);
			Response response = new Response();
			try {
				resManageService.addOrder(param);
				String[] content = ((String) param.get("orderContent")).split(",");
				for (int i = 0; i < content.length; i++) {
					Map<String, Object> mMap = new HashMap<>();
					mMap.put("orderId", param.get("orderId"));
					mMap.put("resTableName", content[i]);
					resManageService.addOrder4Content(mMap);
				}
				response.setCode(Response.SUCCESS);
			} catch (Exception ex) {
				String msg = "系统内部错误，新增用户失败";
				response.setMsg(msg);
				response.setCode(Response.ERROR);
				LOGGER.error(msg, ex);
			}
			return response;
		}else{
			//TODO UPDATA
			Response response = new Response();
			try {
				resManageService.updateOrder(param);
				resManageService.deleteOrder4Content(pOrderID);
				String[] content = ((String) param.get("orderContent")).split(",");
				for (int i = 0; i < content.length; i++) {
					Map<String, Object> mMap = new HashMap<>();
					mMap.put("orderId", param.get("orderId"));
					mMap.put("resTableName", content[i]);
					resManageService.addOrder4Content(mMap);
				}
				response.setCode(Response.SUCCESS);
			} catch (Exception ex) {
				String msg = "系统内部错误，新增用户失败";
				response.setMsg(msg);
				response.setCode(Response.ERROR);
				LOGGER.error(msg, ex);
			}
			return response;
		}
		
		
	}

	/**
	 * 
	 * @描述:订单审查跳转
	 * @方法名: showCheckList
	 * @param model
	 * @return
	 * @返回类型 String
	 * @创建人 wujiong
	 * @创建时间 2015年8月14日上午10:33:47
	 * @修改人 wujiong
	 * @修改时间 2015年8月14日上午10:33:47
	 * @修改备注
	 * @since
	 * @throws
	 */
	@RequestMapping("/check/datalist/index")
	public String showCheckList(Model model) {
		Subject subject = SecurityUtils.getSubject();
		boolean hasAdminRole = subject.hasRole("admin");
		List<String> department = resManageService.getDepartment();
		List<String> orderStatus = resManageService.getOrderStatus();
		model.addAttribute("department", department);
		model.addAttribute("orderStatus", orderStatus);
		model.addAttribute("hasAdminRole", hasAdminRole);
		return "sjgx/sjgx_order_check_list";
	}

	/**
	 * 
	 * @描述:订单审查列表
	 * @方法名: getCheckJpgridData
	 * @param jqgridPage
	 * @param request
	 * @return
	 * @返回类型 JqgridResponse<HashMap<String,Object>>
	 * @创建人 wujiong
	 * @创建时间 2015年8月14日上午10:34:32
	 * @修改人 wujiong
	 * @修改时间 2015年8月14日上午10:34:32
	 * @修改备注
	 * @since
	 * @throws
	 */
	@RequestMapping("/check/datalist/getdata")
	@ResponseBody
	public JqgridResponse<HashMap<String, Object>> getCheckJpgridData(
			JqgridPage jqgridPage, WebRequest request) {
		Map<String, Object> param = ParameterUtil.getFilterMap(request);
		Subject subject = SecurityUtils.getSubject();
		ShiroUser shiroUser = (ShiroUser) subject.getPrincipal();
		param.put("userDepartmentId", shiroUser.getDepartmentId());
		PageList<HashMap<String, Object>> pagelist = resManageService
				.findOrderCheckList(jqgridPage, param);
		return new JqgridResponse<>(pagelist);
	}
	
	/**
	 * 
	 * @描述:orderID查找详情
	 * @方法名: editOrder
	 * @param id
	 * @param model
	 * @return
	 * @返回类型 String
	 * @创建人 wujiong
	 * @创建时间 2015年8月14日下午3:55:43
	 * @修改人 wujiong
	 * @修改时间 2015年8月14日下午3:55:43
	 * @修改备注
	 * @since
	 * @throws
	 */
	@RequestMapping("/check/{id}/editlist/index")
	public String editOrder(@PathVariable String id, Model model) {
		List<String> frequency = resManageService.getFrequency();
		List<Map<String, String>> resNames = resManageService.getResName();
		Map<String, Object> order = resManageService.getOrderByOrderId(id);
		List<String> content = resManageService.getOrderContentByOrderId(id);
		model.addAttribute("frequency", frequency);
		model.addAttribute("resNames", resNames);
		model.addAttribute("order", order);
		model.addAttribute("content",content);
		return "sjgx/sjgx_manage_order_add";
	}
	
	/**
	 * 
	 * @描述:审查页
	 * @方法名: showCheckDetail
	 * @param id
	 * @param model
	 * @return
	 * @返回类型 String
	 * @创建人 wujiong
	 * @创建时间 2015年8月14日下午5:55:07
	 * @修改人 wujiong
	 * @修改时间 2015年8月14日下午5:55:07
	 * @修改备注
	 * @since
	 * @throws
	 */
	@RequestMapping("/check/{id}/datalist/detaildata/check")
	public String showCheckDetail(@PathVariable String id, Model model) {
		Map<String, Object> detail = resManageService.getDetail(id);
		model.addAttribute("detail", detail);
		model.addAttribute("id", id);
		return "sjgx/sjgx_check";
	}
	
	/**
	 * 
	 * @描述:审核订单
	 * @方法名: checkOrder
	 * @param request
	 * @return
	 * @返回类型 Response
	 * @创建人 wujiong
	 * @创建时间 2015年8月16日下午6:54:07
	 * @修改人 wujiong
	 * @修改时间 2015年8月16日下午6:54:07
	 * @修改备注
	 * @since
	 * @throws
	 */
	@RequestMapping("/check/order")
	@ResponseBody
	public Response checkOrder(WebRequest request) {
		Map<String, Object> param = ParameterUtil.getFilterMap(request);
		String passFlag = (String)param.get("passFlag");
		if(passFlag.equals("true")){
			Response response = new Response();
			try {
				resManageService.addOrder4DBInfo(param);
				resManageService.updateOrderStatus("2", "",(String)param.get("orderId"));
				resManageService.addShareTask(param);
				response.setCode(Response.SUCCESS);
			} catch (Exception ex) {
				String msg = "系统内部错误，新增用户失败";
				response.setMsg(msg);
				response.setCode(Response.ERROR);
				LOGGER.error(msg, ex);
			}
			return response;
		}else{
			Response response = new Response();
			try {
				resManageService.updateOrderStatus("3", (String)param.get("noPassReason"),(String)param.get("orderId"));
				response.setCode(Response.SUCCESS);
			} catch (Exception ex) {
				String msg = "系统内部错误，新增用户失败";
				response.setMsg(msg);
				response.setCode(Response.ERROR);
				LOGGER.error(msg, ex);
			}
			return response;
		}
	}
	
}
