package com.cssnb.users.controller;

import java.sql.Clob;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import com.alibaba.fastjson.JSONArray;
import com.cssnb.baseframework.core.domain.JqgridPage;
import com.cssnb.baseframework.core.domain.JqgridResponse;
import com.cssnb.baseframework.core.domain.Response;
import com.cssnb.baseframework.core.util.ParameterUtil;
import com.cssnb.baseframework.quickstart.shiro.MyJdbcRealm.ShiroUser;
import com.cssnb.users.service.MenuService;
import com.cssnb.users.service.RoleService;
import com.cssnb.util.SystemLog;
import com.cssnb.util.UUIDGenerator;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

 

@Controller
@RequestMapping("/menu")
public class MenuController {
	private static final Logger logger = LoggerFactory.getLogger(MenuController.class);
	
	@Autowired
	private MenuService menuService;
 
	
	/**
	 * 跳转功能菜单页面
	 * @param request
	 * @return
	 */
	    @SystemLog(operationType="forward",operationName="跳转功能菜单页面") 
	    @RequestMapping("/getInit")
	    public String getInit(HttpServletRequest request){
	    	Map<String, Object> param = ParameterUtil.getFilterMap(request);
	    	request.setAttribute("page", param.get("page"));
	    	return "user/menu/menu_list";
	    }
	   
	   
	    
	    /**
		 * 获取任务列表
		 * 
		 * @param jqgridPage
		 * @param request
		 * @return
		 */
	    @SystemLog(operationType="select",operationName="获取功能菜单列表数据") 
		@RequestMapping("/getMenuList")
		@ResponseBody
		public JqgridResponse<HashMap<String, Object>> getMenuList(
				JqgridPage jqgridPage, WebRequest request) {
			Map<String, Object> param = ParameterUtil.getFilterMap(request);
//			System.out.println("getmenuList:"+param);
			PageList<HashMap<String, Object>> resList;
			resList = menuService.getInit(jqgridPage, param);
			return new JqgridResponse<>(resList);
		}
		
		
		
		/**
		* 获取下级功能菜单任务列表
		* @param SJGNCDID 上级功能菜单主键
		* @param jqgridPage
		* @param request
		* @return
		*/
		@SystemLog(operationType="select",operationName="根据功能菜单获取下级功能菜单列表") 
		@RequestMapping("/getLowerMenuList")
		@ResponseBody
		public JqgridResponse<HashMap<String, Object>> getLowerMenuList(
			JqgridPage jqgridPage, WebRequest request) {
			Map<String, Object> param = ParameterUtil.getFilterMap(request);
//			System.out.println("getLowerMenuList:"+param);
			PageList<HashMap<String, Object>> resList;
			resList = menuService.getLowerMenuList(jqgridPage, param);
			return new JqgridResponse<>(resList);
		}
		
		/**
		 * 删除功能菜单
		 * @param id 功能菜单主键id
		 * @param userId
		 * @return
		 */
		@SystemLog(operationType="delete",operationName="根据功能菜单主键id删除功能菜单 以及其子菜单") 	
		@RequestMapping("/deleteMenu/{id}")
		@ResponseBody
		public Response deleteUser(@PathVariable String id){
			
			Response response = new Response();
			try {
				Map<String, Object>map = new HashMap<String, Object>();
				map.put("ID", id);
				List menuList=menuService.getMenuList(map);
		    	Map menuMap=new HashMap();
		    	if(menuList!=null){
		    		menuMap=(Map)menuList.get(0);
		    	}
		    	String GNCDID = (String) menuMap.get("ID");//删除前获取功能菜单id
		    	
				Integer res = menuService.deleteMenu(map);//执行删除操作
				if(res>0){
					map.clear();
					map.put("GNCDID", GNCDID);
					menuService.deleteLowerMenu(map);//删除对应子菜单
					response.setCode(Response.SUCCESS);
				}
				else {
					String msg = "系统内部错误，删除失败";
					response.setMsg(msg);
					response.setCode(Response.ERROR);
				}
			} catch (Exception ex) {
				String msg = "系统内部错误，删除失败";
				response.setMsg(msg);
				response.setCode(Response.ERROR);
				logger.info("error");
			}
			return response;
		}
		
		
		/**
		 * 跳转功能菜单更新页面
		 * @param ID 功能菜单主键id
		 * @param page 当前页
		 * @param request
		 * @param response
		 * @return
		 */
		  @SystemLog(operationType="update",operationName="跳转功能菜单更新页面") 
		  @RequestMapping("/toUpdateMenu")
		    public String toUpdateUser(HttpServletRequest request, HttpServletResponse response){
		    	try{
				  	String id=request.getParameter("ID");
				  	String page = request.getParameter("page");
				  	Map<String, Object>map = new HashMap<String, Object>();
					map.put("ID", id);
			    	List menuList=menuService.getMenuList(map);//获取功能菜单对象
			    	Map menuMap=new HashMap();
			    	if(menuList!=null){
			    		menuMap=(Map)menuList.get(0);
			    	}
			    	/*
			    	Object  message = menuMap.get("GNCDMS");
			    	Clob msgclob=(Clob)message;
					String msg=msgclob.getSubString((long)1,(int) msgclob.length());
					menuMap.put("GNCDMS", msg);
					*/
			    	request.setAttribute("map", menuMap);
			    	request.setAttribute("page", page);
		    	}catch(Exception e){
		    		logger.info("error");
		    	}
		    	return "user/menu/menu_update";
		    }
		
		/**
		 * 修改功能菜单信息
		 * 
		 * @param GNCDMC 功能菜单名称
		 * @param SJGNCDMC 上级功能菜单名称
		 * @param XH 序号
		 * @param URL url地址
		 * @param GNCDMS 功能菜单描述
		 * @return
		 */
		@SystemLog(operationType="update",operationName="根据功能菜单主键id更新功能菜单") 
		@RequestMapping("/updateMenu")
		@ResponseBody
		public Response updateMenu(WebRequest request){
			Map<String, Object> map = ParameterUtil.getFilterMap(request);
			Response response = new Response();
			try {
				//用户登入
				Subject subject = SecurityUtils.getSubject();
				String username =  (String) subject.getPrincipal();
				if(username!=null)map.put("USERID", username);//当前操作用户
				map.put("GXRQ", new Date());
				
				Integer res = menuService.updateMenu(map);
				if(res>0)response.setCode(Response.SUCCESS);
				else {
					String msg = "系统内部错误，删除失败";
					response.setMsg(msg);
					response.setCode(Response.ERROR);
				}
			} catch (Exception ex) {
				String msg = "系统内部错误，修改失败";
				response.setMsg(msg);
				response.setCode(Response.ERROR);
				logger.error(msg, ex);
			}
			return response;
		}
		
		
		/**
		 * 跳转添加功能菜单页面
		 * @return
		 */
		 @RequestMapping("/toAddMenu")
		    public String toAddMenu(){
		    	
		    	return "user/menu/menu_add";
		    }
		 
		 
		/**
		 * 新增功能菜单信息
		 * @param GNCDMC 功能菜单名称
		 * @param SJGNCDMC 上级功能菜单名称
		 * @param XH 序号
		 * @param URL url地址
		 * @param GNCDMS 功能菜单描述
		 * @return
		 */
		@SystemLog(operationType="add",operationName="新增功能菜单") 
		@RequestMapping("/addMenu")
		@ResponseBody
		public Response addMenu(WebRequest request){
			Map<String, Object> map = ParameterUtil.getFilterMap(request);
//			System.out.println("addmenu:"+map);
			Response response = new Response();
			try {
				List x = menuService.getMenuList(map);
				if(x.size()==0){
					map.put("ID", UUIDGenerator.getUUID());//主键id
					map.put("RKRQ", new Date());//入库日期
					Integer res = menuService.insertMenu(map);
					if(res>0)response.setCode(Response.SUCCESS);
					else{
						String msg = "系统内部错误，删除失败";
						response.setMsg(msg);
						response.setCode(Response.ERROR);
					}
				}else{
					String msg = "功能菜单已存在！请更换";
					response.setMsg(msg);
					response.setCode(Response.ERROR);
				}
			} catch (Exception ex) {
				String msg = "系统内部错误，新增失败";
				response.setMsg(msg);
				response.setCode(Response.ERROR);
				logger.error(msg, ex);
			}
			return response;
		}
		
		/**
	     * 加载菜单资源
	     * @return
	     */
	    @RequestMapping( value = {"/loadMenu"})
	    @ResponseBody
	    @SystemLog(operationType="获取任务列表:",operationName="左部菜单")  
	    public List<Map<String,Object>> loadMenu(){
	    	//用户登入
			Subject subject = SecurityUtils.getSubject();
			String userId =  (String) subject.getPrincipal();
			List menuList= menuService.getMenuByUserId(userId);
//			System.out.println(menuList);
	    	return menuList;
	    }
	    /**
	     * 加载姓名资源
	     * @return
	     */
	    @RequestMapping( value = {"/loadXM"})
	    @ResponseBody
	    @SystemLog(operationType="获取任务列表:",operationName="左部菜单")  
	    public String loadXM(){
	    	//用户登入
			Subject subject = SecurityUtils.getSubject();
			String userId =  (String) subject.getPrincipal();
	//		List menuList= menuService.getMenuByUserId(userId);
		//	System.out.println(menuList);
			HashMap<String ,Object> map= new HashMap<String ,Object>();
			map.put("userId", userId);
			
			String XM=menuService.getXM(map); 
			
	    	return XM;
	    }
		
}
