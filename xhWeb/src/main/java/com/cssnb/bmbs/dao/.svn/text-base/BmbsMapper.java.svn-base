package com.cssnb.bmbs.dao;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public abstract interface BmbsMapper
{

  public abstract List findBmmc();
  /*public abstract List getbmbsList(PageBounds pageBounds);*/
	public PageList<HashMap<String, Object>> getbmbsList(PageBounds pageBounds,
			String user);
	public PageList<HashMap<String, Object>> findbmmc(PageBounds pageBounds,
			Map map);
  /*public abstract List getfidSjlist(Map param);*/

}