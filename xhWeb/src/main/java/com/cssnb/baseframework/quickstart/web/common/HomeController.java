/**
 * 
 */
package com.cssnb.baseframework.quickstart.web.common;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cssnb.baseframework.core.util.ParameterUtil;
import com.cssnb.users.service.UsersService;
import com.cssnb.util.UserPublic;


/**
* Company: 中国软件技术与服务股份有限公司宁波分公司
* Project: 
* Module ID: 
* Comments: 
* JDK version used: JDK1.6
 * Author: 胡营
* Created Date: 2015年1月21日
*/
@Controller
public class HomeController {
	@Resource
	private UsersService usersService;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@RequestMapping(method = RequestMethod.GET, value = {"/index" })///nbzwy-demo/index { "/","/index" }
	public String toIndex(HttpServletRequest request,Model model) throws ParseException, IOException {
		Subject currentUser = SecurityUtils.getSubject();
//			System.out.println("---------------->"+currentUser);
			if(currentUser.getPrincipal()!=null){
				if(!currentUser.getPrincipal().toString().equals("") && currentUser.getPrincipal().toString()!=""){
					String username = currentUser.getPrincipal().toString();
					logger.info("Login Success!username:" + username);
					if(username!=null){
						String name=usersService.getUserName(username);
						Map<String, Object> param = ParameterUtil.getFilterMap(request);
						param.put("YHM", username);
                        List<HashMap<String, Object>> userList = usersService.getUserList(param);
						
						String pass=userList.get(0).get("MM").toString();
					    //String bmmc=userList.get(0).get("BMMC").toString();
					    String zwmc=userList.get(0).get("XM").toString();
					    request.getSession().setAttribute("name", name);
					    request.getSession().setAttribute("pass", pass);
					   // request.getSession().setAttribute("bmmc", bmmc);
					    request.getSession().setAttribute("zwmc", zwmc);
				 
					}else{
						return "/login";
				     }	
					return "/index";
				}
			}
			
		return "/login";
	}

}
