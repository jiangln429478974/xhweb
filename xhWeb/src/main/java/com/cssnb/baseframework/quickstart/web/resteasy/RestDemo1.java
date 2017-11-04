package com.cssnb.baseframework.quickstart.web.resteasy;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.druid.support.json.JSONUtils;
import com.cssnb.baseframework.quickstart.service.resteasy.RestDemo1Service;

@Controller
@Path(RestDemo1.URL)
public class RestDemo1 {
	public static final String URL = "/demo1";
	@Autowired
	private RestDemo1Service restDemo1Service;
	
	@GET  
   @Produces({ MediaType.APPLICATION_JSON})  
   @Path("/data")  
   public String getAll()  
   {  
      return JSONUtils.toJSONString(restDemo1Service.getAll());
   }  
	
	@RequestMapping("/xx")
	public String xx(){
		return "xx";
	}
	
	   @GET  
	   @Produces(MediaType.TEXT_HTML)  
	   public ModelAndView viewAll()  
	   {  
	      return new ModelAndView("xx", "contacts", restDemo1Service.getAll());  
	   } 
	
}
