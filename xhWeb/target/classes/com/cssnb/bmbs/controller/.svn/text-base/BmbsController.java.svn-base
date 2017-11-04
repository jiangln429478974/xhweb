package com.cssnb.bmbs.controller;

import com.alibaba.fastjson.JSON;
import com.cssnb.baseframework.core.domain.JqgridPage;
import com.cssnb.baseframework.core.domain.JqgridPageBounds;
import com.cssnb.baseframework.core.domain.JqgridResponse;
import com.cssnb.baseframework.core.util.ParameterUtil;
import com.cssnb.bmbs.service.BmbsService;
import com.cssnb.util.SystemLog;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpResponse;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

@Controller
@RequestMapping({ "/bmbs" })
// 部门上报
public class BmbsController {

	@Autowired
	private BmbsService bmbsService;
	
	// 跳转到部门报送上传页面
	@SystemLog(operationType = "forword", operationName = "跳转到部门报送上传页面")
	@RequestMapping({ "/list" })
	public String goNoticeList(HttpServletRequest request) {
		String page = request.getParameter("page");
		request.setAttribute("page", page);
		return "bmbs/bmbs_list";
	}
	//部门信息的获取List
	@RequestMapping("/bmbslist")
	@ResponseBody
	@SystemLog(operationType = "select:", operationName = "获取初始化的部门报送信息")
	public JqgridResponse<HashMap<String, Object>> getbmList(
			JqgridPage jqgridPage, WebRequest request) {
		Map<String, Object> map = ParameterUtil.getFilterMap(request);
	
		String  wjly= "1";
		PageList<HashMap<String, Object>> resList;
		resList = bmbsService.getbmbsList(jqgridPage, wjly);
		
	    //System.out.println("resList:"+resList);
		return new JqgridResponse<>(resList);
	}
	//精确查找部门信息List
	@RequestMapping("/bquery")
	@ResponseBody
	@SystemLog(operationType = "select:", operationName = "精确查找部门信息List")
	public JqgridResponse<HashMap<String, Object>> getbmmc(
			JqgridPage jqgridPage, WebRequest request) {
		Map<String, Object> map = ParameterUtil.getFilterMap(request);
		// 7.3.用户登入
		// 用户登入
		// 用户登入
	//	Subject subject = SecurityUtils.getSubject();
	//	String username = (String) subject.getPrincipal();
		String wjly = "1";
		/*
		 * Map userMap=new HashMap(); userMap.put("username",username); List
		 * yhList=this.usersService.getUserList(userMap); Map
		 * yhMap=(Map)yhList.get(0);
		 */

		map.put("wjly", wjly);
		PageList<HashMap<String, Object>> resList;
		resList = bmbsService.findbmmc(jqgridPage, map);
		return new JqgridResponse<>(resList);
	}

}