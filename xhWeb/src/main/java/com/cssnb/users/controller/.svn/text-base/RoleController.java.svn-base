package com.cssnb.users.controller;

import java.sql.Clob;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oracle.net.aso.p;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.cssnb.baseframework.quickstart.entity.admin.User;
import com.cssnb.baseframework.quickstart.shiro.MyJdbcRealm.ShiroUser;
import com.cssnb.users.service.MenuService;
import com.cssnb.users.service.RoleService;
import com.cssnb.users.service.UsersService;
import com.cssnb.util.SystemLog;
import com.cssnb.util.UUIDGenerator;
import com.cssnb.util.UserPublic;
import com.github.miemiedev.mybatis.paginator.domain.PageList;



/**
 * Company: 中国软件技术与服务股份有限公司宁波分公司
 * Project: 系统管理
 * Comments:用户管理
 * version used: JDK1.7 
 * Author: hdd  
 * Created Date: 2015-09-10
 */

@Controller
@RequestMapping("/role")
public class RoleController {
	private static final Logger logger = LoggerFactory.getLogger(RoleController.class);
	
	@Autowired
	private RoleService roleService;
	@Autowired
	private MenuService menuService;
	@Autowired
	private UsersService usersService;
	
	/**
	 * 跳转角色列表页面
	 * @return
	 */
		@SystemLog(operationType="forward",operationName="跳转角色列表页面") 
	    @RequestMapping("/getInit")
	    public String getInit(HttpServletRequest request){
	    	Map<String, Object> param = ParameterUtil.getFilterMap(request);
	    	request.setAttribute("page", param.get("page"));
	    	return "user/role/role_list";
	    }
	    
	    
	    /**
	     * 初始化角色列表
	     * @return
	     */
		@SystemLog(operationType="select",operationName="初始化角色列表数据") 
	    @RequestMapping("/initRoleList")
	    @ResponseBody
	    public List<HashMap<String, Object>> initDeptList(){
	    	Map<String,Object> map = new HashMap<String,Object>();
			String YHM =  UserPublic.login();
	    	map.put("YHM", YHM);
	    	Map<String,Object> userMap  = usersService.getUserList(map).get(0);//获取用户对象
	    	//通过部门表中的字段判断该用户所在部门是否为县市区信用办
	    	if(userMap.get("ISXYB").equals("2")){
	    		 map.put("XYB","YES");//仅县市区部门角色
	    	}
	    	
	    	List<HashMap<String, Object>> resList = roleService.getRoleList(map);
	    	return resList;
	    }
	    
	    /**
		 * 获取任务列表
		 * 
		 * @param jqgridPage
		 * @param request
		 * @return
		 */
		@SystemLog(operationType="select",operationName="获取角色列表页面数据") 
		@RequestMapping("/getRoleList")
		@ResponseBody
		public JqgridResponse<HashMap<String, Object>> getRoleList(
				JqgridPage jqgridPage, WebRequest request) {
			Map<String, Object> param = ParameterUtil.getFilterMap(request);
			System.out.println("getroleList:"+param);
			//用户登入
//			Subject subject = SecurityUtils.getSubject();
//			ShiroUser ddd = (ShiroUser) subject.getPrincipal();
//			boolean role = subject.hasRole("admin");
			PageList<HashMap<String, Object>> resList;
			resList = roleService.getInit(jqgridPage, param);
			return new JqgridResponse<>(resList);
		}
		
		
		
		/**
		 * 删除角色
		 * 
		 * @param Id
		 * @return
		 */
		@SystemLog(operationType="delete",operationName="删除角色") 	
		@RequestMapping("/deleteRole/{id}")
		@ResponseBody
		public Response deleteUser(@PathVariable String id){
			
			Response response = new Response();
			try {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("ID", id);
				
				int i = roleService.getYhjsb(map);
				if(i>0){
					String msg = "该角色正在使用，删除失败";
					response.setMsg(msg);
					response.setCode(Response.ERROR);
				}else{
				
				
					roleService.deleteRole(map);//删除角色表 
					response.setCode(Response.SUCCESS);
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
		 * 跳转角色编辑页面
		 * @param ID 角色主键id
		 * @param page 当前页
		 * @return
		 */
		  @SystemLog(operationType="forward",operationName="跳转角色编辑页面") 
		  @RequestMapping("/toUpdateRole")
		    public String toUpdateUser(HttpServletRequest request, HttpServletResponse response){
		    	try{
				  	String id=request.getParameter("ID");
				  	String page = request.getParameter("page");
				  	Map<String,String> map = new HashMap<String,String>();
				  	map.put("ID", id);
			    	List roleList=roleService.getRoleList(map);//根据id获取当前角色对象
			    	Map roleMap=new HashMap();
			    	if(roleList!=null){
			    		roleMap=(Map)roleList.get(0);
			    	}
			    	/*
			    	Object  message = roleMap.get("JSMS");
			    	Clob msgclob=(Clob)message;
					String msg=msgclob.getSubString((long)1,(int) msgclob.length());
					roleMap.put("JSMS", msg);
					*/
			    	request.setAttribute("map", roleMap);
			    	request.setAttribute("page", page);
		    	}catch(Exception e){
		    		logger.info("error");
		    	}
		    	return "user/role/role_update";
		    }
		
		/**
		 * 修改角色信息
		 * 
		 * @param ZT 状态
		 * @param JSMS 角色描述
		 * @param JSM 角色名 
		 * @return
		 */
		@SystemLog(operationType="update",operationName="修改角色信息") 
		@RequestMapping("/updateRole")
		@ResponseBody
		public Response updateRole(WebRequest request){
			Map<String, Object> map = ParameterUtil.getFilterMap(request);
			Response response = new Response();
			try {
				//用户登入
				Subject subject = SecurityUtils.getSubject();
				String username =  (String) subject.getPrincipal();
				if(username!=null)map.put("USERID", username);//当前操作用户
				
				Map<String, Object> param = new HashMap<String,Object>();
				param.put("JSM", map.get("JSM"));
				List<HashMap<String, Object>> list = roleService.getRoleList(param);
				if(list.size()>0){//不更新角色名称
					map.put("JSM", "");
				}
				
				map.put("GXRQ", new Date());
				roleService.updateRole(map);
				response.setCode(Response.SUCCESS);
			} catch (Exception ex) {
				String msg = "系统内部错误，修改失败";
				response.setMsg(msg);
				response.setCode(Response.ERROR);
				logger.error(msg, ex);
			}
			return response;
		}
		
		/**
		 * 跳转角色添加页面
		 * @return
		 */
		 @SystemLog(operationType="forward",operationName="跳转角色添加页面") 
		 @RequestMapping("/toAddRole")
		    public String toAddRole(){
		    	
		    	return "user/role/role_add";
		    }
		/**
		 * 新增角色信息
		 * 
		 * @param ZT 状态
		 * @param JSMS 角色描述
		 * @param JSM 角色名 
		 * @return
		 */
		@SystemLog(operationType="add",operationName="新增角色信息") 
		@RequestMapping("/addRole")
		@ResponseBody
		public Response addRole(WebRequest request){
			Map<String, Object> map = ParameterUtil.getFilterMap(request);
			System.out.println("addrole:"+map);
			Response response = new Response();
			try {
				List<HashMap<String, Object>> list = roleService.getRoleList(map);
				if(list.size()==0){//角色名不存在则添加
					map.put("ID", UUIDGenerator.getUUID());//主键id
					map.put("RKRQ", new Date());
					roleService.insertRole(map);
					response.setCode(Response.SUCCESS);
				}else{
					String msg = "角色已存在！请更换";
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
	     * 初始化功能菜单列表(父节点-同步加载)
	     * @param GNCDID 功能菜单id
	     * @return
	     */
		@SystemLog(operationType="select",operationName="初始化功能菜单列表(父节点-同步加载)") 
	    @RequestMapping("/initToolMenuList")
	    @ResponseBody
	    public String initToolMenuList(WebRequest request){
	    	Map<String, Object> map = ParameterUtil.getFilterMap(request);
	    	System.out.println("initToolMenuList:"+map);
	    	List<HashMap<String, Object>> resList = menuService.initMenuList(map);//父类目录
	    	List<Map<String,Object>> items = new ArrayList<Map<String,Object>>();
	    	//第一层开始
	    	for (int i = 0; i < resList.size(); i++) {
				String GNCDMC = (String)resList.get(i).get("GNCDMC");//功能菜单名称
				String GNCDID = (String)resList.get(i).get("ID");//功能菜单id
				String GNCDMS = (String)resList.get(i).get("GNCDMS");//功能菜单描述
				map.put("GNCDID", GNCDID);
//				if(GNCDMS==null||GNCDMS.equals("")){
//					map.put("GNCDMC", GNCDMC+"(null)");
//				}
//				else{
//					map.put("GNCDMC", GNCDMC+"("+GNCDMS+")");
//				}
				map.put("GNCDMC", GNCDMC);
				map.put("GNCDMS", GNCDMS);
				List list = roleService.getGncdList(map);//根据角色id和功能菜单id 查询该角色是否拥有该权限
		    	Map<String,Object> item = new HashMap<String,Object>();   //最外层，父节点        
		    	item.put("id", i);//id属性  ，数据传递
		    	item.put("pId", -1);//id属性  ，数据传递
//		    	if(GNCDMC.equals("信用异议处理")||GNCDMC.equals("共享审核")){
//		    		item.put("name", GNCDMC+"("+GNCDMS+")"); //name属性，显示节点名称
//		    	}else{
//		    		item.put("name", GNCDMC); //name属性，显示节点名称
//		    	}
		    	if(GNCDMS==null||GNCDMS.equals("")){
		    		item.put("name", GNCDMC); //name属性，显示节点名称
		    	}else{
		    		item.put("name", GNCDMC+"(备注:"+GNCDMS+")"); //name属性，显示节点名称
		    	}
		    	
//		    	item.put("name", GNCDMC); //name属性，显示节点名称
		    	item.put("gnms", GNCDMS); //name属性，显示节点名称
		    	item.put("gncdid", GNCDID);//id属性，功能菜单id
		    	item.put("isParent", true);//设置为父节点，这样所有最外层节点都是统一的图标，看起来会舒服些
		    	if(list.size()>0)item.put("checked", true);
		    	//item.put("open", true);//是否打开节点
		    	//item.put("iconSkin", "diy02");//设置节点的图标皮肤
		    	
		    	List<HashMap<String, Object>> resList2 = menuService.initLowerMenuList(map);//第二层
		    	List<Map<String,Object>> items2 = new ArrayList<Map<String,Object>>();
		    	//第二层开始
		    	if(resList2.size()>0){
		    		for (int j = 0; j < resList2.size(); j++) {
		    			String GNCDMC2 = (String)resList2.get(j).get("GNCDMC");
		    			String GNCDID2 = (String)resList2.get(j).get("ID");
		    			String GNCDMS2 = (String)resList2.get(j).get("GNCDMS");
		    			map.put("GNCDID", GNCDID2);
		    			List list2 = roleService.getGncdList(map);//根据角色id和功能菜单ID 查询该角色是否拥有该权限
		    			List<HashMap<String, Object>> resList3 = menuService.initLowerMenuList(map);//第三层
		    			Map<String,Object> item2 = new HashMap<String,Object>();   //最外层，父节点        
				    	item2.put("id", j+i);//id属性  ，数据传递
				    	item2.put("pId", 0);//id属性  ，数据传递
//				    	if(GNCDMC2.equals("信用异议处理")||GNCDMC2.equals("共享审核")){
//				    		item2.put("name", GNCDMC2+"("+GNCDMS2+")"); //name属性，显示节点名称
//				    	}else{
//				    		item2.put("name", GNCDMC2); //name属性，显示节点名称
//				    	}
				    	
				    	if(GNCDMS2==null||GNCDMS2.equals("")){
				    		item2.put("name", GNCDMC2); //name属性，显示节点名称
				    	}else{
				    		item2.put("name", GNCDMC2+"(备注:"+GNCDMS2+")"); //name属性，显示节点名称
				    	}
				    	
//				    	item2.put("name", GNCDMC2); //name属性，显示节点名称
				    	item2.put("gnms", GNCDMS2); //name属性，显示节点名称
				    	item2.put("gncdid", GNCDID2);//id属性，功能菜单id
				    	if(resList3.size()>0)item2.put("isParent", true);//设置为父节点，这样所有最外层节点都是统一的图标，看起来会舒服些
				    	if(list2.size()>0)item2.put("checked", true);//判断是否选中该节点
				    	item2.put("open", true);
				    	//第三层开始
				    	List<Map<String,Object>> items3 = new ArrayList<Map<String,Object>>();
				    	if(resList3.size()>0){
				    		for (int k = 0; k < resList3.size(); k++) {
				    			String GNCDMC3 = (String)resList3.get(k).get("GNCDMC");
				    			String GNCDID3 = (String)resList3.get(k).get("ID");
				    			String GNCDMS3 = (String)resList3.get(k).get("GNCDMS");
				    			map.put("GNCDID", GNCDID3);
				    			List list3 = roleService.getGncdList(map);//根据角色id和功能菜单ID 查询该角色是否拥有该权限
				    			List<HashMap<String, Object>> resList4 = menuService.initLowerMenuList(map);//第四层
				    			Map<String,Object> item3 = new HashMap<String,Object>();   //最外层，父节点        
						    	item3.put("id", j+i+k);//id属性  ，数据传递
						    	item3.put("pId", 0);//id属性  ，数据传递
//						    	if(GNCDMC3.equals("信用异议处理")||GNCDMC3.equals("共享审核")){
//						    		item3.put("name", GNCDMC3+"("+GNCDMS3+")"); //name属性，显示节点名称
//						    	}else{
//						    		item3.put("name", GNCDMC3); //name属性，显示节点名称
//						    	}
						    	
						    	if(GNCDMS3==null||GNCDMS3.equals("")){
						    		item3.put("name", GNCDMC3); //name属性，显示节点名称
						    	}else{
						    		item3.put("name", GNCDMC3+"(备注:"+GNCDMS3+")"); //name属性，显示节点名称
						    	}
						    	
//						    	item3.put("name", GNCDMC3); //name属性，显示节点名称
						    	item3.put("gnms", GNCDMS3); //name属性，显示节点名称
						    	item3.put("gncdid", GNCDID3);//id属性，功能菜单id
						    	if(resList4.size()>0)item3.put("isParent", true);//设置为父节点，这样所有最外层节点都是统一的图标，看起来会舒服些
						    	if(list3.size()>0)item3.put("checked", true);
						    	item3.put("open", true);
						    	//第四层开始
						    	List<Map<String,Object>> items4 = new ArrayList<Map<String,Object>>();
						    	if(resList4.size()>0){
						    		for(int l=0;l<resList4.size();l++){
						    			String GNCDMC4 = (String)resList4.get(l).get("GNCDMC");
						    			String GNCDID4 = (String)resList4.get(l).get("ID");
						    			String GNCDMS4 = (String)resList4.get(l).get("GNCDMS");
						    			map.put("GNCDID", GNCDID4);
						    			List list4 = roleService.getGncdList(map);//根据角色id和功能菜单ID 查询该角色是否拥有该权限
						    			Map<String,Object> item4 = new HashMap<String,Object>();   //最外层，父节点
						    			item4.put("id", j+i+k+l);//id属性  ，数据传递
								    	item4.put("pId", 0);//id属性  ，数据传递
								    	
//								    	if(GNCDMC4.equals("信用异议处理")||GNCDMC4.equals("共享审核")){
//								    		item4.put("name", GNCDMC4+"("+GNCDMS4+")"); //name属性，显示节点名称
//								    	}else{
//								    		item4.put("name", GNCDMC4); //name属性，显示节点名称
//								    	}
								    	
								    	if(GNCDMS4==null||GNCDMS4.equals("")){
								    		item4.put("name", GNCDMC4); //name属性，显示节点名称
								    	}else{
								    		item4.put("name", GNCDMC4+"(备注："+GNCDMS4+")"); //name属性，显示节点名称
								    	}
								    	
								    	item4.put("gnms", GNCDMS4); //name属性，显示节点名称
								    	item4.put("gncdid", GNCDID4);//id属性，功能菜单id
								    	if(list4.size()>0)item4.put("checked", true);
                                        items4.add(item4);//添加到树的第四层
						    		}
						    		item3.put("children", items4);//添加第二层子节点
						    		map.put("GNCDMC", "");
						    	}
						    	//第四层结束
						    	items3.add(item3);//添加到树的第三层
							}
				    		item2.put("children", items3);//添加第二层子节点
				    		map.put("GNCDMC", "");
				    	}
				    	//第三层结束
				    	items2.add(item2);//添加到树的第二层
					}
		    		item.put("children", items2);//添加第一层子节点
		    		map.put("GNCDMC", "");
		    	}
		    	  //第二层结束
		    	  items.add(item); //添加到树的第一层
	    	}
	    	//第一层结束
	    	String json = JSONArray.toJSONString(items);//转成json格式
	    	return json;
	    }
	    
	    
	    /**
	     * 初始化功能菜单列表(子节点-异步加载)
	     * @param id ztree的节点id
	     * @param pId ztree的节点的父节点id
	     * @param name ztree的节点名称
	     * @return
	     */
		@SystemLog(operationType="select",operationName="初始化功能菜单列表(子节点-异步加载)") 
	    @RequestMapping(value="/initLowerToolMenuList",produces = {"text/json;charset=UTF-8"})
	    @ResponseBody
	    public String initLowerToolMenuList(HttpServletRequest request){
	    	String id = request.getParameter("id");
	    	String pId = request.getParameter("pId");
	    	String name = request.getParameter("name");
	    	if(id==null || pId==null || name==null)return "";
	    	Map<String, Object> map = new HashMap<String, Object>();
	    	map.put("GNCDMC", name);
	    	List<HashMap<String, Object>> resList = menuService.initLowerMenuList(map);
	    	List<Map<String,Object>> items = new ArrayList<Map<String,Object>>();
	    	for (int i = 0; i < resList.size(); i++) {
				String GNCDMC = (String)resList.get(i).get("GNCDMC");
				Map<String, Object> cdmap = new HashMap<String, Object>();
		    	cdmap.put("GNCDMC", GNCDMC);
				List<HashMap<String, Object>> cdList = menuService.initLowerMenuList(cdmap);//获取该功能菜单的所有下级
		    	Map<String,Object> item = new HashMap<String,Object>();   //最外层，父节点        
		    	item.put("id", 1);//id属性  ，数据传递
		    	item.put("pId", 0);//id属性  ，数据传递
		    	item.put("name", GNCDMC); //name属性，显示节点名称
		    	//设置为父节点，这样所有最外层节点都是统一的图标，看起来会舒服些
		    	if(cdList.size()>0)item.put("isParent", true);//该功能菜单存在下级则添加父节点
		    	//item.put("iconSkin", "diy02");//设置节点的图标皮肤
		    	items.add(item); //添加到树的第一层  
	    	}
	    	String json = JSONArray.toJSONString(items);//转成json格式
	    	System.out.println("##:"+json);
	    	return json;
	    }
		
		
		/**
		 * 跳转功能菜单授权页面
		 * @param 当前角色id
		 * @param 当前页
		 * @return
		 */
		@SystemLog(operationType="forward",operationName="跳转功能菜单授权页面") 
		@RequestMapping("/toRoleAuthorize")
		public String toRoleAuthorize(HttpServletRequest request){
			String JSID = request.getParameter("JSID");//当前角色id
			String page = request.getParameter("page");//当前页
			HashMap<String,String> map = new HashMap<String,String>();
			map.put("JSID", JSID);
			request.setAttribute("map", map);
			request.setAttribute("page", page);
			return "user/role/role_authorize";
		}
		
		
		/**
		 * 角色功能菜单授权提交
		 * @return
		 */
		@SystemLog(operationType="add",operationName="角色功能菜单授权提交") 
		@RequestMapping("/roleAuthorize")
		@ResponseBody
		public Response roleAuthorize(WebRequest request){
			Map<String, Object> map = ParameterUtil.getFilterMap(request);
			System.out.println("roleAuthorize:"+map);
			String menusMap = (String)map.get("menus");//获取前台提交所有功能菜单内容
			String idsMap = (String)map.get("ids");//获取前台提交所有功能菜单id
			String JSID = (String)map.get("JSID");//角色id
			
			//用户登入
			Subject subject = SecurityUtils.getSubject();
			String username =  (String) subject.getPrincipal();
			String USERID = username;
			Response response = new Response();
			try {
				if("".equals(menusMap)){//页面无功能菜单内容
					roleService.deleteRoleGncd(map);//删除该角色所有功能菜单权限
				}else{
					String[] menus = menusMap.substring(0, menusMap.length()-1).split(",");//分别得到前台选择的功能菜单内容
					String[] ids = idsMap.substring(0, idsMap.length()-1).split(",");//分别得到前台选择的功能菜单id
					
					List<HashMap<String, Object>> list = roleService.getGncdList(map);
					if(list.size()>0){//该角色已有功能菜单权限 则更新(先删除在插入)
						roleService.deleteRoleGncd(map);//删除该角色所有功能菜单权限
					}
					//对该角色进行功能菜单授权
						for (int i = 0; i < menus.length; i++) {
							Map<String,Object> menuMap = new HashMap<String,Object>();
							menuMap.put("ID", UUIDGenerator.getUUID());
							menuMap.put("JSID",JSID);
							menuMap.put("GNCDMC",menus[i].toString());
							menuMap.put("GNCDID", ids[i].toString());
							menuMap.put("USERID",USERID);
							menuMap.put("RKRQ",new Date());
							roleService.insertRoleGncd(menuMap);//角色功能菜单授权
					}
				}
				response.setCode(Response.SUCCESS);
			} catch (Exception ex) {
				String msg = "系统内部错误，新增失败";
				response.setMsg(msg);
				response.setCode(Response.ERROR);
				logger.error(msg, ex);
			}
			return response;
		}
		
		
		
		
		/**
		 * 跳转数据项授权页面
		 * @param JSID 当前角色id
		 * @param page 当前页
		 * @return
		 */
		@SystemLog(operationType="forward",operationName="跳转数据项授权页面") 
		@RequestMapping("/toRoleDataItem")
		public String toRoleDataItem(HttpServletRequest request){
			String JSID = request.getParameter("JSID");
			String page = request.getParameter("page");
			HashMap<String,String> map = new HashMap<String,String>();
			map.put("JSID", JSID);
			request.setAttribute("map", map);
			request.setAttribute("page", page);
			return "user/role/role_dataItem";
		}
		
		
		
		/**
		 * 同步加载数据项授权目录
		 * @param JSID 授权的角色id
		 * @param request
		 * @return
		 */
	    @RequestMapping("/initRoleDataItem")
	    @ResponseBody
	    @SystemLog(operationType="select",operationName="同步加载数据项授权目录") 
	 	public List<Map<String,Object>> initRoleDataItem(HttpServletRequest request){
	    	String JSID = request.getParameter("JSID");
	    	Map<String,Object> map = new HashMap<String,Object>();
	    	map.put("SFQY", "1");//是否已启用
	    	map.put("SFSTB", "1");//是否实体表
	    	List<HashMap<String,Object>> dataItems = roleService.getDataItemList(map);//最外层的所有部门
	    	
	    	List<Map<String,Object>> item = new ArrayList<Map<String,Object>>();
	    	
	    	for(int i=0; i<dataItems.size(); i++){
	    		Map<String,Object> m = new HashMap<String,Object>();
	    		m.put("name", dataItems.get(i).get("BMMC"));//部门名称
	    		m.put("id", i);//ztree节点id
	    		m.put("pid", -1);//ztree父节点id
	    		m.put("isParent", true);//是否父节点
	    		
	    		map.put("BMID", dataItems.get(i).get("BMID"));//部门id
	    		List<HashMap<String,Object>> dataItemInfos = roleService.getDataItemSecList(map);//第二层的信息 根据部门获取
	    		List<Map<String,Object>> item1 = new ArrayList<Map<String,Object>>();
	    		for(int k=0; k<dataItemInfos.size(); k++){
	    			Map<String,Object> m1 = new HashMap<String,Object>();
	    			String name =  dataItemInfos.get(k).get("GXMLMC")+"";
	    			String tName = "";
	    			if(name.length()>20)tName = name.substring(0, 20)+"...";//如果显示的信息内容长度大于20则隐藏
	    			else tName = name;
	    			m1.put("name",tName);//共享目录名称
	    			m1.put("id", k);
		    		m1.put("pid", -1);
		    		m1.put("t", name);
		    		m1.put("itemId", dataItemInfos.get(k).get("ID"));
		    		
		    	
		    		//判断当前角色是否拥有该数据项
		     		Map<String,Object> mapBm1 = new HashMap<String,Object>();
		     		mapBm1.put("SJBID", dataItemInfos.get(k).get("ID"));
		     		mapBm1.put("JSID", JSID);
		     		List<HashMap<String,Object>> owner1 = roleService.getOwnerSjx(mapBm1);
		    		if(owner1.size()>0){
		    			m1.put("checked", true);
		    			m.put("checked", true);
		    			//m1.put("chkDisabled", true);//设置节点的 checkbox / radio 是否禁用 
		    		}
		    		item1.add(m1);
	    		}
	    		
	    		m.put("children", item1);
	    		item.add(m);
	    	}
	    	
	    	return item;
	 	}
	    
	    
	    
	    /**
	     * 根据信息事项主键id获取信息内容
	     * @param request
	     * @return
	     */
	    @SystemLog(operationType="select",operationName="根据信息事项主键id获取信息内容") 
	    @RequestMapping("getXxnr")
	    @ResponseBody
	    public List<HashMap<String, Object>> getXxnr(WebRequest request){
	    	Map<String, Object> map = ParameterUtil.getFilterMap(request);
	    	System.out.println("getXxnr:"+map);
	    	List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
	    	list = roleService.getXxnr(map);
	    	//该角色拥有的信息内容（参数角色id，数据项id，数据项授权表）
	    	List<HashMap<String,Object>> owner1 = roleService.getOwnerSjx(map);
	    	for (int i = 0; i < list.size(); i++) {
				for (int j = 0; j < owner1.size(); j++) {
					if(list.get(i).get("ID").equals(owner1.get(j).get("SJXID")))list.get(i).put("check", "true");//判断页面checkbox是否选中
				}
			}
	    	return list;
	    	
	    }

	    
	    /**
	     * 角色数据项授权
	     * @param JSID 角色id
	     * @param SJXID 数据项数组id
	     * @return
	     */
	    @SystemLog(operationType="add",operationName="角色数据项授权") 
	    @RequestMapping("/authorizeSJX")
		@ResponseBody
		public Response authorizeSJX(HttpServletRequest request){
	    	Response response = new Response();
	    	Map<String, Object> map = ParameterUtil.getFilterMap(request);
	    	System.out.println("authorizeSJX:"+map);
	    	String JSID = (String) map.get("JSID");//角色id
	    	//用户登入
			Subject subject = SecurityUtils.getSubject();
			String username =  (String) subject.getPrincipal();
			String USERID = username;//操作用户
	    	try {
	    		String orgids[]=request.getParameterValues("SJXID");//数据项数组
	    		if(orgids!=null){
	    			roleService.deleteSjx(map);//先删除在添加
		    		for (int i = 0; i < orgids.length; i++) {
		    			System.out.println(orgids[i]);
			    		Map<String,Object> sjxMap = new HashMap<String,Object>();
			    		sjxMap.put("ID", UUIDGenerator.getUUID());
			    		sjxMap.put("JSID",JSID);
			    		sjxMap.put("SJXID",orgids[i]);//数据项id
			    		sjxMap.put("USERID",USERID);
			    		sjxMap.put("RKRQ",new Date());
						roleService.insertSjx(sjxMap);//角色数据项授权
		    		} 
	    		}else{
	    			//清空已经授权的某个信息事项下的信息内容
	    			roleService.deleteSjx(map);
	    			response.setMsg("null");
	    		}
	    		response.setCode(Response.SUCCESS);
			} catch (Exception e) {
				String msg = "系统内部错误";
				response.setMsg(msg);
				response.setCode(Response.ERROR);
				logger.error(msg, e);
			}
	    	return response;
	    }
}
