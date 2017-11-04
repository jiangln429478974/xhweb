package com.cssnb.users.controller;

import java.util.Calendar;
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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.request.WebRequest;

import com.alibaba.fastjson.JSONObject;
import com.cssnb.baseframework.core.domain.JqgridPage;
import com.cssnb.baseframework.core.domain.JqgridResponse;
import com.cssnb.baseframework.core.domain.Response;
import com.cssnb.baseframework.core.util.ParameterUtil;
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
@RequestMapping("/users")
public class UsersController {
	private static final Logger logger = LoggerFactory.getLogger(UsersController.class);
	
	@Autowired
	private UsersService usersService;
	
	  @Autowired
	  private RestTemplate rt;
	
	/**
	 * 跳转用户列表页面
	 * @param request
	 * @return
	 */
   		@SystemLog(operationType="forward",operationName="跳转用户列表页面") 
	    @RequestMapping("/getInit")
	    public String getInit(HttpServletRequest request){
	    	Map<String, Object> param = ParameterUtil.getFilterMap(request);
	    	request.setAttribute("page", param.get("page"));
	    	return "user/user_list";
	    }
	    
	    @RequestMapping("/test")
	    public String getTest(){
	    	
	    	return "user/test";
	    }
	    
	    /**
		 * 获取用户列表数据
		 * 
		 * @param jqgridPage
		 * @param request
		 * @return
		 */
   		@SystemLog(operationType="select",operationName="获取用户列表数据") 
		@RequestMapping("/getUsersList")
		@ResponseBody
		public JqgridResponse<HashMap<String, Object>> getUsersList(
				JqgridPage jqgridPage, WebRequest request) {
			Map<String, Object> param = ParameterUtil.getFilterMap(request);
			System.out.println("getUsersList:"+param);
			//用户登入
			Subject subject = SecurityUtils.getSubject();
			String username =  (String) subject.getPrincipal();
			String YHM =  UserPublic.login();
			
			Map<String,Object> userMap = new HashMap<String,Object>();
			userMap.put("YHM", YHM);
	    	userMap  = usersService.getUserList(userMap).get(0);//获取用户对象
	    	//通过部门表中的字段判断该用户所在部门是否为县市区信用办
	    	if(userMap.get("ISXYB").equals("2")){
	    		param.put("QYID",userMap.get("QYID"));
	    	}
	    	
			if(("请输入查询的姓名").equals(param.get("xm")))param.put("xm", "");
			PageList<HashMap<String, Object>> resList;
			resList = usersService.getInit(jqgridPage, param);
			
			//显示多个角色
			for (int i = 0; i < resList.size(); i++) {
				String YHID = (String) resList.get(i).get("ID");//用户id
				String JSM = "";
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("YHID", YHID);
				List<HashMap<String, Object>> list = usersService.getYhJsList(map); 
				for (int j = 0; j < list.size(); j++) {
					JSM = JSM + list.get(j).get("JSM")+",";
				}
				if(list.size()>0){
					JSM = JSM.toString().substring(0, JSM.length()-1);
				}
				
				resList.get(i).put("JSM", JSM);
			}
			return new JqgridResponse<>(resList);
		}
		
		
		
		/**
		 * 删除用户信息
		 * 
		 * @param ID 用户主键id
		 * @return
		 */
   		@SystemLog(operationType="delete",operationName="删除用户") 			
		@RequestMapping("/deleteUser/{id}")
		@ResponseBody
		public Response deleteUser(@PathVariable String id){
			
			Response response = new Response();
			try {
				Map<String, Object> map = new HashMap<String,Object>();
				map.put("ID", id);
				usersService.deleteUser(map);
				//删除用户角色
				Map<String, Object> mapjs = new HashMap<String,Object>();
				mapjs.put("YHID", id);
				usersService.deleteYhJs(mapjs);
				response.setCode(Response.SUCCESS);
			} catch (Exception ex) {
				String msg = "系统内部错误，删除用户失败";
				response.setMsg(msg);
				response.setCode(Response.ERROR);
				logger.info("error");
			}
			return response;
		}
		
		
		/**
		 * 中心管理员跳转编辑用户界面
		 * @param ID 当前用户id
		 * @param page 当前页
		 * @return
		 */
   		  @SystemLog(operationType="forward",operationName="中心管理员跳转编辑用户界面") 
		  @RequestMapping("/toUpdateUser")
		    public String toUpdateUser(HttpServletRequest request, HttpServletResponse response){
   			  	//返回数据
   			  	Map userMap=new HashMap();
   			   
   			  	//获取被操作用户信息
		    	String id=request.getParameter("ID");
		    	String page = request.getParameter("page");
		    	Map<String, Object> map = new HashMap<String,Object>();
				map.put("ID", id);
		    	List userList=usersService.getUserList(map);//获取用户对象
		    	
		    	if(userList!=null){
		    		userMap=(Map)userList.get(0);
		    	}
		    	
		    	//获取被操作用户所拥有的角色
		    	String YHID = id;//用户id
				String JSM = "";
				String JSID = "";
				HashMap<String, Object> map1 = new HashMap<String, Object>();
				map1.put("YHID", YHID);
				List<HashMap<String, Object>> list = usersService.getYhJsList(map1); 
				for (int j = 0; j < list.size(); j++) {
					JSM = JSM + list.get(j).get("JSM")+",";
					JSID = JSID + list.get(j).get("JSID")+",";
				}
				JSM = JSM.toString().substring(0, JSM.length()-1);
				JSID = JSID.toString().substring(0, JSID.length()-1);
				userMap.put("JSMARR", JSM);
				userMap.put("JSIDARR", JSID);
				

   			  	//操作者信息 
		    	Map<String,Object> tempMap = new HashMap<String,Object>();
				String YHM =  UserPublic.login();
				tempMap.put("YHM", YHM);
		    	tempMap = usersService.getUserList(tempMap).get(0);//获取操作者用户对象
		    	//通过部门表中的字段判断该用户所在部门是否为县市区信用办
		    	if(tempMap.get("ISXYB").equals("2")){
		    		userMap.put("YHLX","XYB");//县市区信用办
		    	}else if(tempMap.get("ISXYB").equals("1")){
		    		userMap.put("YHLX","XYZX");//信用中心
		    	}
				
		    	request.setAttribute("map", userMap);
		    	request.setAttribute("page", page);
		    	
		    	return "user/user_update";
		    }
		
		/**
		 * 中心管理员修改用户信息
		 * 
		 * @param YHM 用户名
		 * @param BMID 部门id
		 * @param JSID 角色id
		 * @param XM 姓名
		 * @param JSSJHM 接收手机号码
		 * @param DJYX 电子邮箱
		 * @param MM 密码
		 * @param SFCA 是否CA
		 * @param CABZF CA标识符
		 * @param CS 处室
		 * @return
		 */
   		@SystemLog(operationType="update",operationName="中心管理员修改用户信息") 
		@RequestMapping("/updateUser")
		@ResponseBody
		public Response updateUser(WebRequest request){
			Map<String, Object> map = ParameterUtil.getFilterMap(request);
			Response response = new Response();
			try {
				//用户登入
				Subject subject = SecurityUtils.getSubject();
				String username =  (String) subject.getPrincipal();
				if(username!=null)map.put("USERID", username);//当前操作用户
				
				Map<String, Object> param = new HashMap<String,Object>();
				param.put("YHM", map.get("YHM"));
				List<HashMap<String, Object>> list = usersService.getUserList(param);
				if(list.size()>0){//不更新用户名
					map.put("YHM", "");
				}
				map.put("GXRQ", new Date());
				usersService.updateUser(map);
				
				//更新用户角色表
				Map<String, Object> param1 = new HashMap<String,Object>();
				param1.put("YHID", map.get("ID"));//用户id
				usersService.deleteYhJs(param1);//删除用户角色
				String [] jsidArr = request.getParameterValues("JSIDTO");
				//添加用户角色表
				for (int i = 0; i < jsidArr.length; i++) {
					param1.put("ID", UUIDGenerator.getUUID());
					param1.put("RKRQ", new Date());
					param1.put("USERID", username);
					param1.put("JSID", jsidArr[i]);
					usersService.insertYhJs(param1);
				}
				
				response.setCode(Response.SUCCESS);
			} catch (Exception ex) {
				String msg = "系统内部错误，修改用户失败";
				response.setMsg(msg);
				response.setCode(Response.ERROR);
				logger.error(msg, ex);
			}
			return response;
		}
		
		
		/**
		 * 跳转添加用户界面
		 * @return
		 */
   		@SystemLog(operationType="forward",operationName="跳转添加用户界面") 
		 @RequestMapping("/toAddUser")
		    public String toAddUser(HttpServletRequest request){
	   		 	Map<String,Object> map = new HashMap<String,Object>();
				String YHM =  UserPublic.login();
		    	map.put("YHM", YHM);
		    	Map<String,Object> userMap  = usersService.getUserList(map).get(0);//获取用户对象
		    	//通过部门表中的字段判断该用户所在部门是否为县市区信用办
		    	if(userMap.get("ISXYB").equals("2")){
		    		map.put("YHLX","XYB");//县市区信用办
		    	}else if(userMap.get("ISXYB").equals("1")){
		    		map.put("YHLX","XYZX");//信用中心
		    	}
		    	
		    	request.setAttribute("map", map);
   			
		    	return "user/user_add";
		    }
		/**
		 * 新增用户信息
		 * 
		 * @param YHM 用户名
		 * @param BMID 部门id
		 * @param JSID 角色id
		 * @param XM 姓名
		 * @param JSSJHM 接收手机号码
		 * @param DJYX 电子邮箱
		 * @param MM 密码
		 * @param SFCA 是否CA
		 * @param CABZF CA标识符
		 * @param CS 处室
		 * @return
		 */
   		@SystemLog(operationType="add",operationName="新增用户") 
		@RequestMapping("/addUser")
		@ResponseBody
		public Response addUser(WebRequest request){
			Map<String, Object> map = ParameterUtil.getFilterMap(request);
			System.out.println("addUser:"+map);
			Response response = new Response();
			try {
				//用户登入
				Subject subject = SecurityUtils.getSubject();
				String username =  (String) subject.getPrincipal();
				
				List list =  usersService.getUserList(map);//判断用户名是否存在
				if(list.size()==0){
					if(map.get("CABZF")==null)map.put("CABZF", "0");//CA标识符为空，则默认0
					String [] jsidArr = request.getParameterValues("JSIDTO");
					String ID = UUIDGenerator.getUUID();
					map.put("ID", ID);
					map.put("RKRQ", new Date());
					
				    Calendar calendar = Calendar.getInstance();
			        Date date = new Date(System.currentTimeMillis());
			        calendar.setTime(date);
			        calendar.add(Calendar.YEAR, +2);
			        date = calendar.getTime();
			        System.out.println(date);
			        map.put("SXRQ", date);
			        map.put("USERID", username);
					usersService.insertUser(map);
					
					//添加用户角色表
					for (int i = 0; i < jsidArr.length; i++) {
						HashMap<String, Object> param = new HashMap<String,Object>();
						param.put("ID", UUIDGenerator.getUUID());
						param.put("RKRQ", new Date());
						param.put("YHID", ID);
						param.put("USERID", username);
						param.put("JSID", jsidArr[i]);
						usersService.insertYhJs(param);
					}
					response.setCode(Response.SUCCESS);
				}else{
					String msg = "用户名已存在！请更换用户名";
					response.setMsg(msg);
					response.setCode(Response.ERROR);
				}
			} catch (Exception ex) {
				String msg = "系统内部错误，新增用户失败";
				response.setMsg(msg);
				response.setCode(Response.ERROR);
				logger.error(msg, ex);
			}
			return response;
		}
		
		
		/**
		 * 跳转新增用户页面
		 * 
		 * @return
		 */
   		@SystemLog(operationType="forward",operationName="跳转新增用户页面") 
		@RequestMapping("user_add")
		public String toUserAddPage() {
			return "admin/user_add";
		}

		
		/**
		 * 进入密码修改页面-- 已作废
		 * @param request
		 * @param response
		 * @return
		 */
   		@SystemLog(operationType="forward",operationName="进入密码修改页面") 
		@RequestMapping("toResetPwd")
		public String toResetPwd(HttpServletRequest request, HttpServletResponse response){
			String id=request.getParameter("ID");
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("ID", id);
			List userList=usersService.getUserList(map);
	    	Map userMap=new HashMap();
	    	if(userList!=null){
	    		userMap=(Map)userList.get(0);
	    	}
	    	request.setAttribute("map", userMap);
			return "user/user_pwdReset";
		}
		
		/**
		 * 密码重置--已作废
		 * @param request
		 * @param response
		 * @return
		 */
   		@SystemLog(operationType="update",operationName="密码重置") 
		@RequestMapping("resetPwd")
		@ResponseBody
		public Response resetPwd(WebRequest request){
			Map<String, Object> map = ParameterUtil.getFilterMap(request);
			String YMM = (String) map.get("YMM");
			Response response = new Response();
			try {
				List userList=usersService.getUserList(map);
		    	Map userMap=new HashMap();
		    	if(userList!=null){
		    		userMap=(Map)userList.get(0);
		    	}
		    	if(userMap.get("MM").equals(YMM)){
		    		String msg = "重置成功";
		    		usersService.resetPwd(map);
					response.setMsg(msg);
					response.setCode(Response.SUCCESS);
		    	}else{
		    		String msg = "重置失败！原密码匹配错误";
					response.setMsg(msg);
					response.setCode(Response.ERROR);
		    	}
			} catch (Exception ex) {
				String msg = "系统内部错误";
				response.setMsg(msg);
				response.setCode(Response.ERROR);
				logger.error(msg, ex);
			}	
			return response;
		}
		
		
		
		/**
		 * 用户资料修改界面
		 * @param ID 用户主键id
		 * @param request
		 * @param response
		 * @return
		 */
   		  @SystemLog(operationType="forward",operationName="进入用户资料修改页面") 
		  @RequestMapping("/toModifyUserData")
		    public String toModifyUserData(HttpServletRequest request, HttpServletResponse response){
			  try {
			  	//用户登入
			    HashMap<String, Object> param = new HashMap<String, Object>();
				Subject subject = SecurityUtils.getSubject();
				String username =  (String) subject.getPrincipal();
				param.put("YHM", username);
				List<HashMap<String, Object>> user = usersService.getUserList(param);//获取登陆用户
				
		    	String id = "";
		    	if(user.size()>0) id = (String) user.get(0).get("ID");
		    	Map<String, Object> map = new HashMap<String,Object>();
				map.put("ID", id);
		    	List userList=usersService.getUserList(map);
		    	Map userMap=new HashMap();
		    	if(userList!=null){
		    		userMap=(Map)userList.get(0);
		    	}
		    	//获取该用户所拥有的角色
		    	String YHID = id;//用户id
				String JSM = "";
				HashMap<String, Object> map1 = new HashMap<String, Object>();
				map1.put("YHID", YHID);
				List<HashMap<String, Object>> list = usersService.getYhJsList(map1); 
				for (int j = 0; j < list.size(); j++) {
					JSM = JSM + list.get(j).get("JSM")+",";
				}
				JSM = JSM.toString().substring(0, JSM.length()-1);
				userMap.put("JSM", JSM);
				
		    	request.setAttribute("map", userMap);
			  } catch (Exception e) {
				logger.error("系统内部错误", e);
			}
		    	return "user/user_dataModify";
		    }
		
		/**
		 * 用户资料修改
		 * @param XM 姓名
		 * @param JSSJHM 接收手机号码
		 * @param DJYX 电子邮箱
		 * @param MM 密码
		 * @param CS 处室
		 * @param ID 用户主键id
		 * @return
		 */
     	@SystemLog(operationType="update",operationName="用户资料修改") 
		@RequestMapping("/modifyUserData")
		@ResponseBody
		public Response modifyUserData(WebRequest request){
			Map<String, Object> map = ParameterUtil.getFilterMap(request);
			Response response = new Response();
			System.out.println("modifyUserData:"+map);
			try {
				usersService.updateUser(map);
				response.setCode(Response.SUCCESS);
			} catch (Exception ex) {
				String msg = "系统内部错误，修改用户失败";
				response.setMsg(msg);
				response.setCode(Response.ERROR);
				logger.error(msg, ex);
			}
			return response;
		}
		   	
     	/**
		 * 用户添加时，身份信息校验
		 * @param XM  姓名
		 * @param YHM 用户名（内容是身份证号码）
		 * @return
		 */
     	@SystemLog(operationType="update",operationName="用户资料修改") 
		@RequestMapping("/checkInfo")
		@ResponseBody
		public Map<String, Object> checkInfo(WebRequest request){
			Map<String, Object> map = ParameterUtil.getFilterMap(request);
			System.out.print(map.toString());
			
			Map<String,Object> resultMap = new HashMap<String, Object>();
			String code="";
			String msg="";
			String zrrResponse = null;
			try {
				 String nbggxyApi="http://10.19.13.242:8080/nbggxy-api";
				 zrrResponse= rt.postForObject(nbggxyApi+"/api/zrr/validate",map, String.class);
	 		     System.out.println(zrrResponse);
	 		     JSONObject zrrObject = JSONObject.parseObject(zrrResponse);
		    	 String zrrCode = zrrObject.get("code")+"";
		    	 //消息队列结果为result
		    	 if (zrrCode.equals("0")) {
		    		String result = zrrObject.get("result")+"";
		    		if("true".equals(result)){
		    			//三方认证通过
		    			code="0";
			    		msg="校验成功！";	
		    		}else{
		    			//三方认证失败
		    			code="1000";
		    			msg="校验失败，请重新输入";
		    		}
				}
			
			} catch (Exception ex) {
				code="1000";
    			msg="校验失败，请重新输入";
				logger.error(msg, ex);
			}
			
			resultMap.put("code", code);
	    	resultMap.put("msg", msg);
	    	
			return resultMap;
		}
}
