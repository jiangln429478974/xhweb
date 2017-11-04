package com.cssnb.baseframework.quickstart.web.cjpt;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cssnb.baseframework.core.domain.JqgridPage;
import com.cssnb.baseframework.core.domain.JqgridResponse;
import com.cssnb.baseframework.core.domain.Response;
import com.cssnb.baseframework.core.util.ParameterUtil;
import com.cssnb.baseframework.quickstart.entity.admin.User;
import com.cssnb.baseframework.quickstart.entity.cjpt.Frequency;
import com.cssnb.baseframework.quickstart.entity.cjpt.Table;
import com.cssnb.baseframework.quickstart.entity.cjpt.TableName;
import com.cssnb.baseframework.quickstart.entity.cjpt.Task;
import com.cssnb.baseframework.quickstart.entity.cjpt.auditDetail;
import com.cssnb.baseframework.quickstart.entity.cjpt.auditEntity;
import com.cssnb.baseframework.quickstart.entity.zTree.Node;
import com.cssnb.baseframework.quickstart.service.admin.UserService;
import com.cssnb.baseframework.quickstart.service.cjpt.CollectionMapperService;
import com.cssnb.baseframework.quickstart.shiro.MyJdbcRealm.ShiroUser;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

//import com.google.common.collect.Table.Cell;


/**
 * 
 * @类描述：采集平台Controller
 * @项目名称：nbzwy-demo
 * @包名： com.cssnb.baseframework.quickstart.web.cjpt
 * @类名称：ResCollectionController
 * @创建人：baiyun
 * @创建时间：2015年8月7日下午3:22:30
 * @修改人：baiyun
 * @修改时间：2015年8月7日下午3:22:30
 * @修改备注：
 * @version v1.0
 * @see [nothing]
 * @bug [nothing]
 * @Copyright 
 * @mail
 */
@Controller
@RequestMapping("/cjpt")
public class ResCollectionController {
	private static final Logger LOGGER = LoggerFactory
			.getLogger(ResCollectionController.class);
	@Autowired
	private CollectionMapperService collectionMapperService;
	
	/* @RequestMapping(value = {"","/list"})
	    public String toUserListPage(){
	        return "cjpt/cjpt_list";
	    }*/
	
	
	/**资源任务列表页面
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ParseException
	 * @throws BiffException
	 */
	@RequestMapping(value = "/datalist/showList/index")
	public String showList(HttpServletRequest request,
			HttpServletResponse response, Model model) throws IOException, ParseException,
			BiffException {
		Subject subject = SecurityUtils.getSubject();
		boolean role = subject.hasRole("admin");
		model.addAttribute("role", role);
		List<Map<String, Object>> departmentList = collectionMapperService.getDepartment();
		request.setAttribute("departmentList", departmentList);
		return "cjpt/cjpt_list";
	}

	/**
	 * 获取任务列表
	 * 
	 * @param jqgridPage
	 * @param request
	 * @return
	 */
	@RequestMapping("/datalist/getCollectionTaskList")
	@ResponseBody
	public JqgridResponse<HashMap<String, Object>> getCollectionTaskList(
			JqgridPage jqgridPage, WebRequest request) {
		Map<String, Object> param = ParameterUtil.getFilterMap(request);
		/*PageList<HashMap<String, Object>> collectionTaskList = collectionMapperService.getCollectionTaskList(
					jqgridPage, param);*/
		/*PageList<HashMap<String, Object>> collectionTaskList = collectionMapperService.collectionTaskList1(jqgridPage, param);
		PageList<HashMap<String, Object>> collectionTaskList2 = collectionMapperService.collectionTaskList2(jqgridPage, param);
		for(int i=0;i<collectionTaskList.size();i++){
			for(int j=0; j<collectionTaskList2.size(); j++){
				if(collectionTaskList.get(j).get("task_id") == (collectionTaskList2.get(j).get("task_id"))){
					collectionTaskList.get(j).putAll(collectionTaskList2.get(j));
				}
			}
		}*/
		Subject subject = SecurityUtils.getSubject();
		ShiroUser ddd = (ShiroUser) subject.getPrincipal();
		boolean role = subject.hasRole("admin");
		PageList<HashMap<String, Object>> resList;
		if(role){
			resList = collectionMapperService.resList(jqgridPage, param);
		}else{
			String department_id = ddd.getDepartmentId();
			param.put("department_id", department_id);
			resList = collectionMapperService.resListForUser(jqgridPage, param);
		}
		
		
		return new JqgridResponse<>(resList);
	}
	
	
	
	
	/** 删除功能
	 * @param id
	 * @return
	 */
	@RequestMapping("/datalist/deletedata")
	@ResponseBody
	public Response deleteInfo(WebRequest request){
		Response response = new Response();
		Map<String, Object> param = ParameterUtil.getFilterMap(request);
		String id = collectionMapperService.getTaskId(param);
		try {
			collectionMapperService.deletedata(id);
			response.setCode(Response.SUCCESS);
		} catch (Exception e) {
			String msg = "删除失败";
			response.setMsg(msg);
			response.setCode(Response.ERROR);
			LOGGER.error(msg, e);
		}
		
		return response;
	}
	
	@RequestMapping("/datalist/audit/deletedata")
	@ResponseBody
	public Response deleteAuditInfo(WebRequest request){
		Response response = new Response();
		Map<String, Object> param = ParameterUtil.getFilterMap(request);
		//String id = collectionMapperService.getTaskId(param);
		try {
			String id = (String) param.get("id");
			System.out.println("id="+id);
			collectionMapperService.deletedata(id);
			response.setCode(Response.SUCCESS);
		} catch (Exception e) {
			String msg = "删除失败";
			response.setMsg(msg);
			response.setCode(Response.ERROR);
			LOGGER.error(msg, e);
		}
		
		return response;
	}
	
	
	/**申请修改页面中 AJAX删除标签方法
	 * @param request resid;tag
	 * @return
	 */
	@RequestMapping("/editdata/tag/delete")
	@ResponseBody
	public Response deleteTag(WebRequest request){
		Response response = new Response();
		Map<String, Object> param = ParameterUtil.getFilterMap(request);
		try {
			collectionMapperService.deleteTag(param);
			response.setCode(Response.SUCCESS);
		} catch (Exception e) {
			String msg = "删除失败";
			response.setMsg(msg);
			response.setCode(Response.ERROR);
			LOGGER.error(msg, e);
		}
		
		return response;
	}
	
	@RequestMapping("/editdata/tag/add")
	@ResponseBody
	public Response addTag(WebRequest request){
		Response response = new Response();
		Map<String, Object> param = ParameterUtil.getFilterMap(request);
		try {
			collectionMapperService.addTag(param);
			response.setCode(Response.SUCCESS);
		} catch (Exception e) {
			String msg = "提交失败";
			response.setMsg(msg);
			response.setCode(Response.ERROR);
			LOGGER.error(msg, e);
		}
		
		return response;
	}
	
	/** 新增任务页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/datalist/adddata/index")
	// @ResponseBody
	public String insertPage(HttpServletRequest request, HttpServletResponse response){
		Subject subject = SecurityUtils.getSubject();
		ShiroUser ddd = (ShiroUser) subject.getPrincipal();
		int userid = ddd.getUserId();
		
		List<Table> resourceList = collectionMapperService.getResId(userid);
		request.setAttribute("resourceList", resourceList);
		List<Frequency> frequencyList = collectionMapperService.getFrequency();
		request.setAttribute("frequencyList", frequencyList);
		return "cjpt/cjpt_reg_add";
	}
	
	/**申请审核列表页面
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/datalist/auditlist/index")
	// @ResponseBody
	public String auditListPage(HttpServletRequest request, HttpServletResponse response, Model model){
		Subject subject = SecurityUtils.getSubject();
		boolean role = subject.hasRole("admin");
		model.addAttribute("role", role);
		
		List<Map<String, Object>> departmentList = collectionMapperService.getDepartment();
		request.setAttribute("departmentList", departmentList);
		
		List<Map<String, Object>> regStatusList = collectionMapperService.getRegStatus();
		request.setAttribute("regStatusList", regStatusList);
		return "cjpt/cjpt_audit_list";
	}
	

	
	/**申请详情页面
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/datalist/{id}/auditdetail/index")
	public String toAuditDetail(@PathVariable String id, Model model){
		Subject subject = SecurityUtils.getSubject();
		boolean role = subject.hasRole("admin");
		//String name = subject.
		model.addAttribute("role", role);
		auditDetail detail = collectionMapperService.regDetail(id);
		List<String> tagList = collectionMapperService.getTagList(id);
		if(tagList.size()==0 || tagList.equals(null)){
			model.addAttribute("tag","");
		}else{
			String tag = "";
			for (int i = 0; i < tagList.size(); i++) {
				tag+=tagList.get(i)+',';
			}
			tag = tag.substring(0,tag.length()-1);
			model.addAttribute("tag",tag);
		}
		model.addAttribute("detail",detail);
		model.addAttribute("id",id);
		return "cjpt/cjpt_audit_detail";
	}
	
	/**管理员审核编辑页面
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/datalist/{id}/manager/audit/index")
	public String toManagerAudit(@PathVariable String id, Model model){
		auditDetail detail = collectionMapperService.getAuditDetail(id);
		List<String> tagList = collectionMapperService.getTagList(id);
		if(tagList.size()==0 || tagList.equals(null)){
			model.addAttribute("tag","");
		}else{
			String tag = "";
			for (int i = 0; i < tagList.size(); i++) {
				tag+=tagList.get(i)+',';
			}
			tag = tag.substring(0,tag.length()-1);
			model.addAttribute("tag",tag);
		}
		
		model.addAttribute("detail",detail);
		model.addAttribute("id",id);
		return "cjpt/cjpt_manager_audit_edit";
	}
	
	/**编辑提交
	 * @param request
	 * @return
	 */
	@RequestMapping("datalist/manager/audit/commit")
	@ResponseBody
	public Response auditCommt(WebRequest request){
		Response response = new Response();
		Map<String, Object> param = ParameterUtil.getFilterMap(request);
		Date date = new Date();
		String lsh = Long.toString(date.getTime());
		
		try {
			collectionMapperService.auditCommit(param);
			if(param.get("status").equals("1")){
				param.put("id", lsh);
				collectionMapperService.insertTask(param);
			}
			
			response.setCode(Response.SUCCESS);
		} catch (Exception e) {
			String msg = "审核提交失败";
			response.setMsg(msg);
			response.setCode(Response.ERROR);
			LOGGER.error(msg, e);
		}
		
		return response;
	}
	
	/**
	 * 获取任务列表
	 * 
	 * @param jqgridPage
	 * @param request
	 * @return
	 */
	@RequestMapping("/datalist/auditlist")
	@ResponseBody
	public JqgridResponse<HashMap<String, Object>> getAuditList(
			JqgridPage jqgridPage, WebRequest request) {
		Subject subject = SecurityUtils.getSubject();
		ShiroUser ddd = (ShiroUser) subject.getPrincipal();
		Map<String, Object> param = ParameterUtil.getFilterMap(request);
		
		boolean role = subject.hasRole("admin");
		PageList<auditEntity> auditList;
		if(role){
			/*
			 * 申请列表 管理员
			 */
			auditList = collectionMapperService.getAuditListForManager(
					jqgridPage, param);
		}else{
			/*
			 * 申请列表 用户
			 */
			String DEPARTMENT_ID = ddd.getDepartmentId();
			
			param.put("DEPARTMENT_ID", DEPARTMENT_ID);
			auditList = collectionMapperService.getAuditListForUser(jqgridPage, param);
			
		}
		
		
		return new JqgridResponse<>(auditList);
	}
	
	
	/**获取表字段树
	 * @param resource_id
	 * @return
	 */
	@RequestMapping("{resource_id}/datalist/fieldTree")
	@ResponseBody
	public List<Node> getField(@PathVariable String resource_id) {
		List<Node> fieldNodes = new ArrayList<>();
		String resTableName = collectionMapperService.getResTableName(Integer.valueOf(resource_id));
		List<Map<String,String>> field = collectionMapperService.getResName(resource_id);
		List<Node> newField = new ArrayList<Node>();
		if(field.equals(null)){
			Node nameNode = new Node();
			Node node = new Node();
			node.setId(Integer.valueOf(resource_id));
			node.setName(resTableName);
			node.setChildren(newField);
			node.setChecked(true);
			node.setChkDisabled(true);
		}else{
			
			for(int i=0;i<field.size();i++){
				Node nameNode = new Node();
				nameNode.setName(field.get(i).get("RES_SHOW_NAME"));
				nameNode.setChecked(true);
				newField.add(nameNode);
				nameNode.setChkDisabled(true);
			}
			Node node = new Node();
			node.setId(Integer.valueOf(resource_id));
			node.setName(resTableName);
			node.setChildren(newField);
			node.setChecked(true);
			node.setChkDisabled(true);
			fieldNodes.add(node);
		}
		
		return fieldNodes;
		
	}
	
	/**提交新增任务方法
	 * @param task
	 * @return
	 */
	
	@RequestMapping("/datalist/adddata/add")
	@ResponseBody
	public Response insertData(WebRequest request) {
		Map<String, Object> param = ParameterUtil.getFilterMap(request);
		Response response = new Response();
		int regCount = collectionMapperService.ifPass(param);
		if(regCount==0){
			Subject subject = SecurityUtils.getSubject();
			ShiroUser ddd = (ShiroUser) subject.getPrincipal();
			String userid = String.valueOf(ddd.getUserId());
			Date date = new Date();
			String lsh = Long.toString(date.getTime());
			if(userid.length()==1){
				userid="000"+userid;
			}else if(userid.length()==2){
				userid="00"+userid;
			}else if(userid.length()==3){
				userid="0"+userid;
			}else if(userid.length()==4){
				userid=userid;
			}
			String ID = lsh+userid;//任务编号
			param.put("OPERATOR", userid);
			param.put("ID", ID);
			param.put("REG_STATUS", "0");
			param.put("COLLECTION_MODE", "1");
			
			try {
				collectionMapperService.insertReg(param);
				collectionMapperService.updateResTable(param);
				String tag =  (String) param.get("TAG");
				if(tag.equals("")){
					System.out.println(111);
				}else{
					String[] tagarr = tag.split(",");
					Map<String,String> tagMap = new HashMap<String,String>();
					for(int i=0; i<tagarr.length;i++){
						String singleTag = tagarr[i].toString();
						tagMap.put("res_id", (String) param.get("RES_ID"));
						tagMap.put("singleTag", singleTag);
						collectionMapperService.insertTag(tagMap);
					}
				}
				
				response.setCode(Response.SUCCESS);
			} catch (Exception ex) {
				String msg = "系统内部错误，新增用户失败";
				response.setMsg(msg);
				response.setCode(Response.ERROR);
				LOGGER.error(msg, ex);
			}
		}else{
			//资源已存在
			response.setCode(999);
		}
		
		
		return response;
	}
	
	
	
	
	
	/**修改任务详细方法
	 * @param task
	 * @return
	 */
	@RequestMapping("/datalist/editdata/edit")
	@ResponseBody
	public Response updateData(WebRequest request) {
		Map<String, Object> param = ParameterUtil.getFilterMap(request);
		Response response = new Response();
		int regCount = collectionMapperService.ifPass(param);
		if(regCount==0){
			try {
				collectionMapperService.updateTask(param);
				collectionMapperService.updateResTable(param);
				response.setCode(Response.SUCCESS);
			} catch (Exception ex) {
				String msg = "系统内部错误，修改用户失败";
				response.setMsg(msg);
				response.setCode(Response.ERROR);
				LOGGER.error(msg, ex);
			}
		}else{
			//资源已存在
			response.setCode(999);
		}
		
		return response;
	}

	/**修改页面
	 * @param RES_ID
	 * @param LAST_UPDATE_TIME
	 * @param model
	 * @return
	 */
	@RequestMapping("/datalist/editdata/index")
	public ModelAndView editPage(String ID,
			Model model) {
		Subject subject = SecurityUtils.getSubject();
		ShiroUser ddd = (ShiroUser) subject.getPrincipal();
		int userid = ddd.getUserId();
		Map<String,Object> taskInfo = collectionMapperService.getTaskInfo(ID);
		
		List<String> tagList = collectionMapperService.getTagList(ID);
		if(tagList.size()==0 || tagList.equals(null)){
			taskInfo.put("TAG", "[]");
		}else{
			String tag = "";
			for (int i = 0; i < tagList.size(); i++) {
				tag+=tagList.get(i)+',';
			}
			tag = tag.substring(0,tag.length()-1).replaceAll(",", "\" \"");
			tag = "\""+tag+"\"";
			String[] arr = tag.split(" ");
			taskInfo.put("TAG", java.util.Arrays.asList(arr));
		}
		
		List<Table> resourceList = collectionMapperService.getResId(userid);
		List<Frequency> frequencyList = collectionMapperService.getFrequency();
		taskInfo.put("ID", ID);
		taskInfo.put("RES_LIST", resourceList);
		taskInfo.put("FREQUENCY_LIST", frequencyList);
		return new ModelAndView("cjpt/cjpt_reg_edit", "task", taskInfo);
	}

	@RequestMapping(value = "/getResId", method = RequestMethod.POST)
	public void getResId(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		Subject subject = SecurityUtils.getSubject();
		ShiroUser ddd = (ShiroUser) subject.getPrincipal();
		int userid = ddd.getUserId();
		List<Table> tableList = collectionMapperService.getResId(userid);
		JSONArray jsonarray = new JSONArray();
		for (Table table : tableList) {
			JSONObject json = new JSONObject();
			json.put("resid", table.getID());
			json.put("resname", table.getTABLE_NAME());
			jsonarray.add(json);
		}
		response.getWriter().write(jsonarray.toJSONString());
	}
	

	
	
}
