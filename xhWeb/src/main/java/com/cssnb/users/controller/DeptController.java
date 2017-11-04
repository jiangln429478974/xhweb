package com.cssnb.users.controller;

import java.sql.Clob;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.Hash;
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

import com.cssnb.baseframework.core.domain.JqgridPage;
import com.cssnb.baseframework.core.domain.JqgridResponse;
import com.cssnb.baseframework.core.domain.Response;
import com.cssnb.baseframework.core.util.ParameterUtil;
import com.cssnb.baseframework.quickstart.entity.admin.User;
import com.cssnb.baseframework.quickstart.shiro.MyJdbcRealm.ShiroUser;
import com.cssnb.monitor.util.MethodLog;
import com.cssnb.users.service.DeptService;
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
@RequestMapping("/dept")
public class DeptController {
	private static final Logger logger = LoggerFactory.getLogger(DeptController.class);
	
	@Autowired
	private DeptService deptService;
	
	@Autowired
	private UsersService usersService;
	
		@SystemLog(operationType="forward",operationName="跳转部门列表页面") 
	    @RequestMapping("/getInit")
	    public String getInit(HttpServletRequest request){
	    	Map<String, Object> param = ParameterUtil.getFilterMap(request);
	    	request.setAttribute("page", param.get("page"));
	    	return "user/dept/dept_list";
	    }
	    
		
	    /**
		 * 获取所有部门列表
		 * 判断是否为信用办管理员
		 * 若是，只显示该区域的所有部门；若非，则显示所有部门
		 * @param jqgridPage
		 * @param request
		 * @return
		 */
		@SystemLog(operationType="select",operationName="jqgrid加载部门数据") 
		@RequestMapping("/getDeptList")
		@ResponseBody
		public JqgridResponse<HashMap<String, Object>> getDeptList(JqgridPage jqgridPage, WebRequest request) {
			Map<String,Object> map = new HashMap<String,Object>();
			String YHM =  UserPublic.login();
	    	map.put("YHM", YHM);
	    	Map<String,Object> userMap  = usersService.getUserList(map).get(0);//获取用户对象
	    	
	    	Map<String, Object> param = ParameterUtil.getFilterMap(request);
			System.out.println("getDeptList:"+param);
			PageList<HashMap<String, Object>> resList;
			
	    	//通过部门表中的字段判断该用户所在部门是否为县市区信用办
	    	if(userMap.get("ISXYB").equals("2")){
	    		param.put("QYID",userMap.get("QYID"));
	    	}
			resList = deptService.getInit(jqgridPage, param);
			return new JqgridResponse<>(resList);
		}
		
		
		
		/**
		 * 删除部门
		 * @param id 部门主键id
		 * @return
		 */
		@SystemLog(operationType="delete",operationName="根据主键id删除部门") 
		@RequestMapping("/deleteDept/{id}")
		@ResponseBody
		public Response deleteUser(@PathVariable String id){
			
			Response response = new Response();
			try {
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("ID", id);
				int i = deptService.getYhb(map);
				if(i>0){
					String msg = "该角色正在使用，删除失败";
					response.setMsg(msg);
					response.setCode(Response.ERROR);
				}else{
				deptService.deleteDept(map);
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
		 * 跳转部门修改页面
		 * @param 部门主键id
		 * @param request
		 * @param response
		 * @return
		 */
		  @SystemLog(operationType="forward",operationName="跳转部门修改页面") 
		  @RequestMapping("/toUpdateDept")
		    public String toUpdateUser(HttpServletRequest request, HttpServletResponse response){
		    	try{
				  	String id=request.getParameter("ID");//当前部门主键id
				  	String page = request.getParameter("page");//当前页
				  	Map<String,Object> map = new HashMap<String,Object>();
				  	map.put("ID", id);
			    	List deptList=deptService.getDeptList(map);//获取部门对象
			    	Map deptMap=new HashMap<String,Object>();
			    	if(deptList!=null){
			    		deptMap=(Map)deptList.get(0);
			    	}
			    	
			    	Map<String,Object> yhMap = new HashMap<String,Object>();
					String YHM =  UserPublic.login();
					yhMap.put("YHM", YHM);
			    	Map<String,Object> userMap  = usersService.getUserList(yhMap).get(0);//获取用户对象
			    	deptMap.put("YHQYID", userMap.get("QYID")); //用户所在区域
			    	
			    	request.setAttribute("map", deptMap);
			    	request.setAttribute("page", page);
		    	}catch(Exception e){
		    		logger.info("error");
		    	}
		    	return "user/dept/dept_update";
		    }
		
		/**
		 * 修改部门信息
		 * @param BMMS 部门描述
		 * @param BMMC 部门名称
		 * @param ID 部门主键id
		 * @param user
		 * @return
		 */
		@SystemLog(operationType="update",operationName="修改部门信息") 
		@RequestMapping("/updateDept")
		@ResponseBody
		public Response updateDept(WebRequest request){
			Map<String, Object> map = ParameterUtil.getFilterMap(request);
			Response response = new Response();
			try {
				//用户登入
				Subject subject = SecurityUtils.getSubject();
				String username =  (String) subject.getPrincipal();
				if(username!=null)map.put("USERID", username);//当前操作用户
				
				Map<String, Object> param = new HashMap<String,Object>();
				param.put("BMMC", map.get("BMMC"));//外部传入需要修改的部门名称
				List<HashMap<String, Object>> list = deptService.getDeptList(param);
				if(list.size()>0){//数据库存在改部门，不更新部门名称
					map.put("BMMC", "");
				}
				map.put("GXRQ", new Date());
				deptService.updateDept(map);
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
		 * 跳转部门新增页面
		 * @return
		 */
		 @SystemLog(operationType="forward",operationName="跳转部门新增页面") 
		 @RequestMapping("/toAddDept")
		    public String toAddDept(HttpServletRequest request){
			 	Map<String,Object> map = new HashMap<String,Object>();
				String YHM =  UserPublic.login();
		    	map.put("YHM", YHM);
		    	Map<String,Object> userMap  = usersService.getUserList(map).get(0);//获取用户对象
		    	//通过部门表中的字段判断该用户所在部门是否为县市区信用办
		    	if(userMap.get("ISXYB").equals("2")){
		    		map.put("QYID","XYB");//县市区信用办
		    	}else{
		    		map.put("QYID","QT");//其他（宁波市级）
		    	}
		    	
		    	//部门编码
		    	Map<String,Object> pxMap = new HashMap<String,Object>();
		    	pxMap.put("QYID",userMap.get("QYID") );
		    	String PX = deptService.getBmpx(pxMap);//获取下一个部门编码
		    	map.put("PX", PX);
		    	
		    	request.setAttribute("map", map);
		    	return "user/dept/dept_add";
		    }
		/**
		 * 新增部门信息
		 * 
		 * @param BMMC 部门名称
		 * @param BMMS 部门描述
		 * @param PX 排序
		 */
		@SystemLog(operationType="add",operationName="新增部门") 
		@RequestMapping("/addDept")
		@ResponseBody
		public Response addDept(WebRequest request){
			Map<String, Object> map = ParameterUtil.getFilterMap(request);
			System.out.println("addDept:"+map);
			Response response = new Response();
			try {
				List list = deptService.getDeptList(map);//判断该部门名称是否存在
				if(list.size()==0){
					map.put("ID", UUIDGenerator.getUUID());//主键id
					map.put("RKRQ", new Date());
					deptService.insertDept(map);
					response.setCode(Response.SUCCESS);
				}else{
					String msg = "部门已存在！请更换";
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
	     * 下拉框-获取所有部门列表
	     * @return
	     */
		@SystemLog(operationType="select",operationName="初始化部门数据") 
	    @RequestMapping("/initDeptList")
	    @ResponseBody
	    public List<HashMap<String, Object>> initDeptList(){ 
	    	Map<String,Object> map = new HashMap<String,Object>();
			String YHM =  UserPublic.login();
	    	map.put("YHM", YHM);
	    	Map<String,Object> userMap  = usersService.getUserList(map).get(0);//获取用户对象
	    	//通过部门表中的字段判断该用户所在部门是否为县市区信用办
	    	if(userMap.get("ISXYB").equals("2")){
	    		map.put("QYID",userMap.get("QYID"));
	    		 
	    		
	    	}
	    	List<HashMap<String, Object>> resList = deptService.getDeptList(map);
	    	return resList;
	    }
	    
		
		/**
	     * 下拉框-获得所有区域列表
	     * @return
	     */
		@SystemLog(operationType="select",operationName="初始化区域") 
	    @RequestMapping("/initSSQYList")
	    @ResponseBody
	    public List<HashMap<String, Object>> initSSQYList( WebRequest request) {
			Map<String,Object> map = new HashMap<String,Object>();
			String YHM =  UserPublic.login();
	    	map.put("YHM", YHM);
	    	Map<String,Object> userMap  = usersService.getUserList(map).get(0);//获取用户对象
	    	//通过部门表中的字段判断该用户所在部门是否为县市区信用办
	    	if(userMap.get("ISXYB").equals("2")){
	    		map.put("QYIDYES",userMap.get("QYID"));
	    	}
	    	List<HashMap<String, Object>> resList = deptService.getSsqyList(map);
	    	return resList;
	    }
		
}
