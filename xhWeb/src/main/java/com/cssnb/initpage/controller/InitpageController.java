package com.cssnb.initpage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.request.WebRequest;

import com.cssnb.baseframework.core.util.ParameterUtil;
import com.cssnb.initpage.service.InitpageService;
import com.cssnb.users.service.UsersService;
import com.cssnb.util.SystemLog;
import com.cssnb.util.UserPublic;

@Controller
@RequestMapping("/Initpage")
public class InitpageController {
	@Autowired
	public InitpageService initpageService;
	
	@Autowired
	private UsersService usersService;
//	public String login;
//	public String BMID;
//	public String YHID;
	
	@RequestMapping(method=RequestMethod.POST,value="getBMID")
	@ResponseBody
	public Object getBMID(){
		String login=UserPublic.login();
		String BMID=initpageService.getBMID(login);
		String YHID=initpageService.getYHID(login);
		Map map=new HashMap();
		map.put("BMID", BMID);
		map.put("YHID", YHID);
		return map;
	}
	
	//获取用户授权功能ID
	public List checkItem(String YHID){
		List<HashMap<String, Object>> list=initpageService.checkItem(YHID);
		return list;
	}
	
	@SystemLog(operationType="select", operationName="显示通知公告界面内容(部门管理员)")
	@RequestMapping({"/getYytjs"})
	@ResponseBody
	public Map<String, Object> getYytjs(WebRequest request) {
		Map param = ParameterUtil.getFilterMap(request);
		
		//用户登入
		String username = UserPublic.login();
		param.put("YHM", username);
		List<HashMap<String, Object>> userList = usersService.getUserList(param);//获取登陆用户
		Map<String, Object> resMap = new HashMap<String, Object>();
		Object yytjs;
		
	
		
		
		
		//判断是否是信用中心
		if(!"55636fa1ea164673ad41b23535e4daca".equals(userList.get(0).get("BMID"))){
			resMap.put("bmid", userList.get(0).get("BMID"));
		}
		String login=UserPublic.login();
		String BMID=initpageService.getBMID(login);
		String YHID=initpageService.getYHID(login);
		//查看该用户的所有功能菜单
		List list=checkItem(YHID);
		if (list==null||list.isEmpty()) {
			yytjs=null;
			resMap.put("yytjs", yytjs);
			return resMap;
		}
		for (Object object : list) {
			Map m=(Map) object;
			String gncd=(String) m.get("GNCDID");
			//中心异议处理  初审
			if ((gncd.equals("ff267df0fdbd4598a92e0c26107e6bfe")||gncd.equals("f3aee4c5a45c4e17a6af72a0c3d6ce8c"))&&BMID.equals("55636fa1ea164673ad41b23535e4daca")) {
				
				resMap.put("YYTYPE", "XX");//初审异议
				yytjs = initpageService.getYytjs(resMap);
				resMap.put("yytjs", yytjs);//异议统计数
				
				return resMap;
			}
			//复审
			if ((gncd.equals("bff79f732d7448b9b534401bf5d64876")||gncd.equals("f7f799719b3841ff9c9a6f5bed0c6593"))&&BMID.equals("55636fa1ea164673ad41b23535e4daca")) {
				resMap.put("YYTYPE", "BM");//复审异议
				yytjs = initpageService.getYytjs(resMap);
				resMap.put("yytjs", yytjs);//异议统计数
				
				return resMap;
			}
			//终审
			if ((gncd.equals("a3f0e4d351f141a1aaf450a72f02f25c")||gncd.equals("a9f9543c5b46461a9923ffbe38b75ad0"))&&BMID.equals("55636fa1ea164673ad41b23535e4daca")) {
				
				resMap.put("YYTYPE", "ZX");//终审异议
				yytjs = initpageService.getYytjs(resMap);
				resMap.put("yytjs", yytjs);//异议统计数
			
				return resMap;
			}
			//部门异议处理
			else if(gncd.equals("a2e92d8e5ce14b009c8db95e6aceb003")&&!BMID.equals("55636fa1ea164673ad41b23535e4daca")){
				resMap.put("YYTYPE", "aa");//终审异议
				yytjs = initpageService.getYytjs(resMap);
				resMap.put("yytjs", yytjs);//异议统计数
				return resMap;
			}else{
			resMap.put("yytjs", null);
			}
		}
//		yytjs = initpageService.getYytjs(resMap);
//		resMap.put("yytjs", yytjs);
		return resMap;
		
	}
	
	@SystemLog(operationType="select", operationName="显示通知公告界面内容(部门管理员)")
	@RequestMapping({"/getBmsjtj"})
	@ResponseBody
	public List<Map<String, Object>> getBmsjtj(WebRequest request) {
		Map param = ParameterUtil.getFilterMap(request);
		//用户登入
		String username = UserPublic.login();
		param.put("YHM", username);
		List<HashMap<String, Object>> userList = usersService.getUserList(param);//获取登陆用户
		Map<String, Object> resMap = new HashMap<String, Object>();
		if(!"55636fa1ea164673ad41b23535e4daca".equals(userList.get(0).get("BMID"))){
			resMap.put("bmid", userList.get(0).get("BMID"));
		}
		List<Map<String, Object>> list = initpageService.getBmsjtj(resMap);
		return list;
	}
	
	@SystemLog(operationType="select", operationName="显示通知公告界面内容(部门管理员)")
	@RequestMapping({"/bquery"})
	@ResponseBody
	public List<HashMap<String, Object>> bquery(WebRequest request) {
		Map param = ParameterUtil.getFilterMap(request);
		//用户登入
		String username =  UserPublic.login();
		param.put("YHM", username);
		List<HashMap<String, Object>> userList = usersService.getUserList(param);//获取登陆用户
		//非中心管理员，则存入BMDI字段
//		if(!"55636fa1ea164673ad41b23535e4daca".equals(userList.get(0).get("BMID"))){
			param.put("BMID", userList.get(0).get("BMID"));
//		}
		List<HashMap<String, Object>> resList = this.initpageService.getBmggList(param);
		return resList;
	}
	
//	//共享目录管理
//	@RequestMapping("/InitpageQuery")
//	@ResponseBody
//	public JqgridResponse<HashMap<String, Object>> getbaquery(JqgridPage jqgridPage, WebRequest request) {
//    	String bmid = request.getParameter("BMD");//获取部门id
//		Map<String, Object> param = ParameterUtil.getFilterMap(request);
//		param.put("BMD", bmid);
//		PageList<HashMap<String, Object>> resList;
//		resList = initpageService.getShare();
//		return new JqgridResponse<>(resList);
//		
//	}
	
	//站内消息管理
	@SystemLog(operationType="select:", operationName="站内消息管理")
	@RequestMapping(method=RequestMethod.POST,value="getStationInfo")
	@ResponseBody
	public Object getStationInfo(){ 
		String login=UserPublic.login();
		String BMID=initpageService.getBMID(login);
		String YHID=initpageService.getYHID(login);
		List list=checkItem(YHID);
		if (list==null) {
			return null;
		}
		for (Object object : list) {
			Map m=(Map) object;
			String gncd=(String) m.get("GNCDID");
//			if (gncd.equals("68e8b623c83340ad9e73d1a57a2164fb")) {
				String stationinfo=initpageService.getStationinfo(login);
				return stationinfo;
//			}
		}
		return null;
	}
	
	@SystemLog(operationType="select:", operationName="获取中心的数量")
	@RequestMapping(method=RequestMethod.POST,value="getZXZXCount")
	@ResponseBody
	public Object getZXZXCount(){
		String login=UserPublic.login();
		String BMID=initpageService.getBMID(login);
		String YHID=initpageService.getYHID(login);
		List list=checkItem(YHID);
		if (list==null) {
			return null;
		}
		for (Object object : list) {
			Map m=(Map) object;
			String gncd=(String) m.get("GNCDID");
			if (gncd.equals("878ca6e85bf5414b85c4d22a20bd0bd8")) {
				String zxcount=initpageService.getZXZXCount();
				return zxcount;
			}
		}
		return null;
	}
	
	@SystemLog(operationType="select:", operationName="获取共享目录的数量")
	@RequestMapping(method=RequestMethod.POST,value="getShareCount")
	@ResponseBody
	public Map getShareCount(){
		String login=UserPublic.login();
		String BMID=initpageService.getBMID(login);
		String YHID=initpageService.getYHID(login);
		
		Map resMap=new HashMap();
		//1.判断用户角色是否有权限
		List list=checkItem(YHID);
		if (list==null) {
			resMap.put("ISYX", "N");//无权限
		}else{
			//2.判断是否管理员
			for (Object object : list) {
				Map m=(Map) object;
 				String gncd=(String) m.get("GNCDID");
//				共享申请部门审核cc2ee6a1eaf944699aebd3e24f26d2b9
//				共享目录申请管理ac4893a8841c4d3c9437f368a6bc7394
				String scount="";
				//1.判断是否有权限
				if (gncd.equals("cc2ee6a1eaf944699aebd3e24f26d2b9")
						&&!BMID.equals("55636fa1ea164673ad41b23535e4daca")) {
					//非管理员需要有部门审核权限
					resMap.put("ISYX", "BM");//查看部门审核情况
					scount=initpageService.getShareCount(BMID);
					resMap.put("NUM", scount);//查看部门审核情况
					return resMap;
				}else if ((gncd.equals("ac4893a8841c4d3c9437f368a6bc7394")||
						gncd.equals("e668e4a0848b4bee915832c5936de674"))
						&&BMID.equals("55636fa1ea164673ad41b23535e4daca")){//初审
					//即使管理员又有权限
					resMap.put("gxtype", "xxy");//初审
					resMap.put("ISYX", "ADMIN");//查看中心审核情况
					scount=initpageService.getZXShareCount(resMap);
					resMap.put("NUM", scount);//查看审核情况
					return resMap;
				}else if ((gncd.equals("ce7c88df532d48b99e39b50f82fba462")||
						gncd.equals("8bc52177f4bc4e4c99b5d0073577b22a"))
						&&BMID.equals("55636fa1ea164673ad41b23535e4daca")){//复审
					//即使管理员又有权限
					resMap.put("gxtype", "bmld");//复审
					resMap.put("ISYX", "ADMIN");//查看中心审核情况
					scount=initpageService.getZXShareCount(resMap);
					resMap.put("NUM", scount);//查看审核情况
					return resMap;
				}else if ((gncd.equals("7627cde0bb3841fbaa23a8fc7bf215d9")||
						gncd.equals("f5ad9609f31c4cd5878e708ef1c3ab8b"))
						&&BMID.equals("55636fa1ea164673ad41b23535e4daca")){//终审
					//即使管理员又有权限
					resMap.put("gxtype", "zxld");//终审
					resMap.put("ISYX", "ADMIN");//查看中心审核情况
					scount=initpageService.getZXShareCount(resMap);
					resMap.put("NUM", scount);//查看审核情况
					return resMap;
				}else{
					resMap.put("ISYX", "N");//无权限
					resMap.put("NUM", "0");//无权限
				}
			}
		}
		return resMap;
	}

	@SystemLog(operationType="select:", operationName="获取部门数据")
	@RequestMapping(method=RequestMethod.POST,value="getBMData")
	@ResponseBody
	public Object getBMData(){
		String login=UserPublic.login();
		String BMID=initpageService.getBMID(login);
		String YHID=initpageService.getYHID(login);
		Map param = new HashMap();
		String username =  UserPublic.login();
		param.put("YHM", username);
		List<HashMap<String, Object>> userList = usersService.getUserList(param);//获取登陆用户
		String bmdata="0";
		if ("55636fa1ea164673ad41b23535e4daca".equals(userList.get(0).get("BMID"))) {
			bmdata=initpageService.getZXData();
		}else if(BMID!=null){
			bmdata=initpageService.getBMData(BMID);
		}
		return bmdata;
	}
	

	/**
	 * 进入异议处理页面(用户)
	 * @return
	 */
		@SystemLog(operationType="forward",operationName="进入异议处理页面(用户)") 
	    @RequestMapping("/tonwindex")
	    public String getInit(HttpServletRequest request){
	    	Map<String, Object> param = ParameterUtil.getFilterMap(request);
	    	request.setAttribute("page", param.get("page"));
	    	request.setAttribute("YHLB", "user");
	    	return "/tonwindex";
	    }
	/**
	 * 进入信用动态列表页
	 * @return
	 */
		@SystemLog(operationType="forward",operationName="进入信用动态列表页") 
	    @RequestMapping("/toxydtlist")
	    public String getXydtlist(HttpServletRequest request){
	    	Map<String, Object> param = ParameterUtil.getFilterMap(request);
	    	request.setAttribute("page", param.get("page"));
	    	request.setAttribute("YHLB", "user");
	    	request.setAttribute("XYDT", param.get("xydt"));
	    	return "/nbggxysite/xydtlist";
	    }
		/**
		 * 进入典型案例列表页
		 * @return
		 */
			@SystemLog(operationType="forward",operationName="进入典型案例列表页") 
		    @RequestMapping("/todxallist")
		    public String getDxallist(HttpServletRequest request){
		    	Map<String, Object> param = ParameterUtil.getFilterMap(request);
		    	request.setAttribute("page", param.get("page"));
		    	request.setAttribute("YHLB", "user");
		    	request.setAttribute("DXAL", param.get("dxal"));
		    	return "/nbggxysite/dxallist";
		    }
	/**
	 * 进入情况通报
	 * 进入工作通报列表页
	 * @return
	 */
		@SystemLog(operationType="forward",operationName="进入工作通报列表页") 
	    @RequestMapping("/togztblist")
	    public String getGztblist(HttpServletRequest request){
	    	Map<String, Object> param = ParameterUtil.getFilterMap(request);
	    	request.setAttribute("page", param.get("page"));
	    	request.setAttribute("YHLB", "user");
	    	request.setAttribute("GZTB", param.get("gztb"));
	    	return "nbggxysite/gztblist";
	    }
	/**
	 * 进入政策文件列表页
	 * @return
	 */
		@SystemLog(operationType="forward",operationName="进入政策文件列表页") 
	    @RequestMapping("/tozcwjlist")
	    public String getZcwjlist(HttpServletRequest request){
	    	Map<String, Object> param = ParameterUtil.getFilterMap(request);
	    	request.setAttribute("page", param.get("page"));
	    	request.setAttribute("YHLB", "user");
	    	return "/nbggxysite/zcwjlist";
	    }
		/**
		 * 进入正在建设当中页面
		 * @return
		 */
			@SystemLog(operationType="forward",operationName="进入信用动态列表页") 
		    @RequestMapping("/tozzjs")
		    public String tozzjs(HttpServletRequest request){
		    	Map<String, Object> param = ParameterUtil.getFilterMap(request);
		    	request.setAttribute("page", param.get("page"));
		    	request.setAttribute("YHLB", "user");
		    	request.setAttribute("XYDT", param.get("xydt"));
		    	//return "/tozzjs";
		    	return "lhcj/cjzb/gotowarming";
		    }
			
			@SystemLog(operationType="forward",operationName="进入信用动态列表页") 
		    @RequestMapping("/towarning")
		    public String towarning(HttpServletRequest request){
		    	Map<String, Object> param = ParameterUtil.getFilterMap(request);
		    	request.setAttribute("page", param.get("page"));
		    	request.setAttribute("YHLB", "user");
		    	request.setAttribute("XYDT", param.get("xydt"));
		    	//return "/tozzjs";
		    	return "lhcj/cjzb/gotowarning";
		    }
//		
//			
//			/**
//			 * 弹出层确定按钮判断是否勾选不再显示
//			 * jiangln
//			 * @return
//			 */
//				@SystemLog(operationType="forward",operationName="进入信用动态列表页") 
//			    @RequestMapping("/noSHow")
//				@ResponseBody
//			    public String  noSHow(HttpServletRequest request){
//			    	Map<String, Object> param = ParameterUtil.getFilterMap(request);
//			    	//String userId= param.get("userId")+"";
//			    	String login=UserPublic.login();
//
//					String status = param.get("status").toString();
//					//String sy_tc = param.get("sy_tc").toString();
//				//	System.out.println(sy_tc);
//					String yhid=initpageService.getYHID(login);
//					String result="ok";
//					if(status.equals("checked")){
//						initpageService.noShow(yhid);
//					}
//						HttpServletRequest requests = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
//				    	requests.getSession().setAttribute("SY_TC","2");
//
//			    	return result;
//			    }
//				
//				
//				/**
//				 * 是否显示
//				 * jiangln
//				 * @return
//				 */
//					@SystemLog(operationType="forward",operationName="进入信用动态列表页") 
//				    @RequestMapping("/showOrNot")
//					@ResponseBody
//				    public String  showOrNot(HttpServletRequest request){
//				    	Map<String, Object> param = ParameterUtil.getFilterMap(request);
//				    	//String userId= param.get("userId")+"";
//				    	String login=UserPublic.login();
//						String BMID=initpageService.getBMID(login);
//						String yhid=initpageService.getYHID(login);
//						String result = initpageService.showOrNot(yhid);
//				    	return result;
//				    }
			
			
			@RequestMapping("/lhjcTJ")
			@ResponseBody
			public Map lhjcTJ(HttpServletRequest request){
				String yhm=UserPublic.login();
				Map map=new HashMap();
				map.put("YHM", yhm);
				String BMID=initpageService.getBMID(yhm);
				Map reMap=initpageService.getlhjcTJ(map);
				reMap.put("BMID", BMID);
				return reMap;
			}
}
