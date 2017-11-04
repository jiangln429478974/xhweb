package com.cssnb.bmbs.service;

import com.cssnb.baseframework.core.domain.JqgridPage;
import com.cssnb.baseframework.core.domain.JqgridPageBounds;
import com.cssnb.bmbs.dao.BmbsMapper;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BmbsService
{

  @Autowired
  private BmbsMapper bmbsMapper;

  
  public List findBmmc()
  {

    return this.bmbsMapper.findBmmc();
    
  }
  
 /* public List getbmbsList(JqgridPage jqgridPage)
  {
	  PageBounds pageBounds = new JqgridPageBounds(jqgridPage);
    return this.bmbsMapper.getbmbsList(pageBounds);
    
  }*/
  public PageList<HashMap<String, Object>> getbmbsList(JqgridPage jqgridPage,
		 String  user) {
		PageBounds pageBounds = new JqgridPageBounds(jqgridPage);
		return bmbsMapper.getbmbsList(pageBounds, user);
	}
  
  public PageList<HashMap<String, Object>> findbmmc(JqgridPage jqgridPage,
			 Map map) {
	  System.out.println("aaa"+map);
			PageBounds pageBounds = new JqgridPageBounds(jqgridPage);
			return bmbsMapper.findbmmc(pageBounds,map);
		}
  /*public List getfidSjlist(Map param)
  {
	  System.out.print("时间："+param);
    return this.bmbsMapper.getfidSjlist(param);
    
  }
  */
  
}